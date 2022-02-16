import 'package:flutter/material.dart';
import 'package:movies/constants_for_widgets.dart';
import 'package:movies/models/movie_model.dart';
import 'package:movies/screens/finded_screen.dart';
import 'package:movies/screens/movie_details.dart';
import 'package:movies/widgets/home_screen_background.dart';
import 'package:movies/widgets/info_widgets.dart';

class SearchingWidget extends StatefulWidget {
  const SearchingWidget({Key? key}) : super(key: key);

  @override
  _SearchingWidgetState createState() => _SearchingWidgetState();
}

class _SearchingWidgetState extends State<SearchingWidget> {
  String searchString = "";

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15.0),
        child: TextField(
          onChanged: (value) {
            searchString = value;
          },
          decoration: InputDecoration(
            hintText: 'Search',
            suffixIcon: IconButton(
                icon: const Icon(Icons.search),
                onPressed: () {
                  setState(() {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            FoundScreen(searchString: searchString)));
                  });
                }),
          ),
        ));
  }
}

class SuitableMovies extends StatelessWidget {
  const SuitableMovies({Key? key, required this.movies}) : super(key: key);
  final List<MovieModel> movies;

  @override
  Widget build(BuildContext context) {
    return HomeBackground(
      backgroundImage: Container(
        color: Theme.of(context).colorScheme.background,
      ),
      child: ListView.builder(
          itemCount: (movies.isEmpty) ? 0 : baseCountMovies,
          //   scrollDirection: Axis.horizontal,
          itemBuilder: (context, index) {
            return Column(
              children: [
                Row(
                  children: [
                    IconButton(
                        icon: (movies[index].imageUrl != "null")
                            ? ClipRRect(
                                borderRadius: BorderRadius.circular(
                                    borderRadiusForImages),
                                child: ColorFiltered(
                                  child: Image.network(
                                    movies[index].imageUrl!,
                                  ),
                                  colorFilter: ColorFilter.mode(
                                      Colors.white10,
                                      (Theme.of(context).brightness ==
                                              Brightness.light)
                                          ? BlendMode.lighten
                                          : BlendMode.darken),
                                ))
                            : const Icon(Icons.image),
                        iconSize: iconButtonSize,
                        onPressed: () {
                          Navigator.of(context).push(
                            MaterialPageRoute(
                                builder: (context) =>
                                    MovieDetails(movie: movies[index])),
                          );
                        }),
                    Expanded(child: titleView(movies[index].title, context)),
                  ],
                ),
                const Divider(
                  thickness: 2.0,
                ),
              ],
            );
          }),
    );
  }
}
