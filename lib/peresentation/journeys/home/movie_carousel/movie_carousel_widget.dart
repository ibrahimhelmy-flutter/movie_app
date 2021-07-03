import 'package:flutter/material.dart';
import 'package:movie_app/data/domain/entites/movie_entity.dart';
import 'package:movie_app/peresentation/journeys/home/movie_carousel/movie_backdrop_widget.dart';
import 'package:movie_app/peresentation/journeys/home/movie_carousel/movie_data_widget.dart';
import 'package:movie_app/peresentation/journeys/home/movie_carousel/movie_page_view.dart';
import 'package:movie_app/peresentation/widgets/movie_app_bar.dart';
import 'package:movie_app/peresentation/widgets/separator.dart';

class MovieCarouselWidget extends StatelessWidget {
 final List<MovieEntity> movies;
 final int defaultIndex;
  const MovieCarouselWidget(
      {Key? key,required this.movies,required this.defaultIndex})
      : assert(defaultIndex>=0,"shout more than 0"),super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      fit: StackFit.expand,
      children: [
        MovieBackdropWidget(),
        Column(
          children: [
            MovieAppBar(),
            MoviePageView(
              movies:movies,
              initialPage:defaultIndex
            ),
            MovieDataWidget(),
            Separator()
          ],
        ),
      ],
    );
  }
}
