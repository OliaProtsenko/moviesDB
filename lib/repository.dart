import 'package:http/http.dart' as http;
import 'package:movies/models/actor_model.dart';
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

  Future<List<ActorModel>> getActorsForFilm({required movieId}) async {
    var data = await _getData(
        url: "$theMovieDbURL/$movieId/credits?api_key=$theMovieDbAPI");
    List<ActorModel> temp = [];
    for (var item in data["cast"]) {
      if (item["known_for_department"] == "Acting") {
        temp.add(ActorModel(
            id: item["id"].toString(),
            name: item["name"],
            gender: (item["gender"] == 1) ? "woman" : "man",
            imageUrl: (item["profile_path"]==null)?"null":"$theMovieDbImageURL${item["profile_path"]}",
            rating: item["popularity"].toDouble()));
      }
    }
    return Future.value(temp);
  }

  Future<ActorModel> getActorById({required actorId}) async {
    var data =
        await _getData(url: "$getActorByIdURL/$actorId?api_key=$theMovieDbAPI");
    ActorModel actor = ActorModel(
        id: data["id"].toString(),
        name: data["name"],
        gender: (data["gender"]==1)?"woman":"man",
        biography: data["biography"],
        imageUrl: "$theMovieDbImageURL${data["profile_path"]}",
        dateOfBirth:DateTime.parse(data["birthday"]),
        dateOfDeath:(data["deathday"]==null)?null:DateTime.parse(data["deathday"]),
        placeOfBirth: data["place_of_birth"],
        rating: data["popularity"]);
    return Future.value(actor);
  }
}
