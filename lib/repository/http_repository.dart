import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:movies/models/actor_model.dart';
import 'package:movies/models/movie_model.dart';
import 'package:movies/repository/repository.dart';

import '../constants.dart';
import '../models/genre_model.dart';

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

class HttpMovieRepository implements MovieRepository {
  Future _getData({required String url}) async {
    NetworkHelper networkHelper = NetworkHelper(Uri.parse(url));
    var data = await networkHelper.getData();
    return data;
  }

  @override
  Future<List<GenreModel>> getGenres() async {
    List<GenreModel> categories = [];
    var data = await _getData(url: getGenresFromTheMovieDbURL);
    for (var item in data["genres"]) {
      categories.add(GenreModel.fromJson(item));
    }
    return Future.value(categories);
  }

  @override
  Future<List<MovieModel>> getMovies({required GenreModel genre}) async {
    List<MovieModel> temp = [];
    var data = await _getData(
      url: "$getAllFilmsOfGenre?api_key=$theMovieDbAPI&with_genres=${genre.id}",
    );

    for (var item in data["results"]) {
      temp.add(MovieModel.fromJson(item));
    }

    return Future.value(temp);
  }

  @override
  Future<MovieModel> searchMovieById({required movieId}) async {
    var data =
        await _getData(url: "$theMovieDbURL/$movieId?api_key=$theMovieDbAPI");
    MovieModel result = MovieModel.fromJson(data);

    return result;
  }

  @override
  Future<List<ActorModel>> getActorsForMovie({required movieId}) async {
    var data = await _getData(
        url: "$theMovieDbURL/$movieId/credits?api_key=$theMovieDbAPI");
    List<ActorModel> temp = [];
    for (var item in data["cast"]) {
      if (item["known_for_department"] == "Acting") {
        temp.add(ActorModel.fromJson(item));
      }
    }
    return Future.value(temp);
  }

  @override
  Future<ActorModel> getActorById({required actorId}) async {
    var data =
        await _getData(url: "$getActorByIdURL/$actorId?api_key=$theMovieDbAPI");
    ActorModel actor = ActorModel.fromJson(data);
    return Future.value(actor);
  }

  @override
  Future<List<MovieModel>> searchMovieByName(String search) async {
    var data = await _getData(
        url: "$searchMovieByNameURL?api_key=$theMovieDbAPI&query=$search");
    List<MovieModel> temp = [];
    for (var item in data["results"]) {
      temp.add(MovieModel.fromJson(item));
    }

    return Future.value(temp);
  }
}
