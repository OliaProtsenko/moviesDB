import 'package:http/http.dart' as http;
import 'package:movies/models/movie_model.dart';
import 'dart:convert';
import 'models/genre_model.dart';
import 'constants.dart';

class NetworkHelper {
  NetworkHelper(this.url);

  final Uri url;

  Future<dynamic> getData() async {
    http.Response response = await http.get(url);

    if (response.statusCode == 200) {
      return jsonDecode(response.body);
    } else {
      print(response.statusCode);
    }
  }
}

class MovieRepository {
  Future _getData({required String url}) async {
    NetworkHelper networkHelper = NetworkHelper(Uri.parse(url));
    var data = await networkHelper.getData();
    return data;
  }

  Future<List<GenreModel>> getGenres() async {
    List<GenreModel> categories = [];
    var data = await _getData(url: getGenresFromTheMovieDbURL);
    for (var item in data["genres"]) {
      categories.add(GenreModel(id: item["id"].toString(), name: item["name"]));
    }
    return Future.value(categories);
  }

  Future<List<MovieModel>> getMovies({required GenreModel genre}) async {
    List<MovieModel> temp = [];
    var data = await _getData(
      url: "$getAllFilmsOfGenre?api_key=$theMovieDbAPI&with_genres=${genre.id}",
    );

    for (var item in data["results"]) {
      temp.add(MovieModel(
          id: item["id"].toString(),
          title: item["title"].toString(),
          imageUrl: "$theMovieDbImageURL${item["poster_path"]}",
          backdropImageUrl: '$theMovieDbImageURL${item["backdrop_path"]}',
          date: (item["release_date"].toString().isNotEmpty)
              ? item["release_date"].toString()
              : "",
          overview: item["overview"].toString(),
          rating: item["vote_average"].toDouble()));
    }

    return Future.value(temp);
  }

  Future<MovieModel> searchMovieById({required movieId}) async {
    var data =
        await _getData(url: "$theMovieDbURL/$movieId?api_key=$theMovieDbAPI");
    MovieModel result = MovieModel(
        id: data["id"].toString(),
        title: data["title"],
        imageUrl: "$theMovieDbImageURL${data["poster_path"]}",
        backdropImageUrl: '$theMovieDbImageURL${data["backdrop_path"]}',
        date: data["release_date"],
        overview: data["overview"],
        rating: data["vote_average"]);
    return result;
  }
}
