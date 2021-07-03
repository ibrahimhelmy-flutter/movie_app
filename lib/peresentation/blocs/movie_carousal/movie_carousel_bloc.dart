import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/data/domain/entites/movie_entity.dart';
import 'package:movie_app/data/domain/entites/no_params.dart';
import 'package:movie_app/data/domain/usecases/get_tranding.dart';
import 'package:movie_app/data/domain/entites/no_params.dart';
import 'package:movie_app/peresentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';

part 'movie_carousel_event.dart';
part 'movie_carousel_state.dart';

class MovieCarouselBloc extends Bloc<MovieCarouselEvent, MovieCarouselState> {
  final GetTrending getTrending;
  final MovieBackdropBloc movieBackdropBloc;

  MovieCarouselBloc(
      {required this.getTrending, required this.movieBackdropBloc})
      : super(MovieCarouselInitial());

  @override
  Stream<MovieCarouselState> mapEventToState(MovieCarouselEvent event) async* {
    if (event is CarouselLoadEvent) {
      final moviesEither = await getTrending(NoParams());
      yield moviesEither.fold((l) {
        return MovieCarouselError();
      }, (r) {
        movieBackdropBloc.add(MoviebackDropChangeEvent(r[event.defaultIndex]));
        return MovieCarouselLoaded(movies: r, defaultIndex: event.defaultIndex);
      });
    }
  }
}
