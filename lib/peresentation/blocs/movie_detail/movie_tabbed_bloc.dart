import 'dart:async';
import 'dart:math';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:movie_app/data/domain/entites/error.dart';
import 'package:movie_app/data/domain/entites/movie_entity.dart';
import 'package:movie_app/data/domain/entites/no_params.dart';
import 'package:movie_app/data/domain/usecases/get_coming_soon.dart';
import 'package:movie_app/data/domain/usecases/get_playing_now.dart';
import 'package:movie_app/data/domain/usecases/get_popular.dart';

part 'movie_tabbed_event.dart';
part 'movie_tabbed_state.dart';

class MovieTabbedBloc extends Bloc<MovieTabbedEvent, MovieTabbedState> {
  final GetPopular getPopular;
  final GetPlayingNow getPlayingNow;
  final GetComingSoon getComingSoon;
  MovieTabbedBloc({
    required this.getPopular,
    required this.getPlayingNow,
    required this.getComingSoon,
  }) : super(MovieTabbedInitial());

  @override
  Stream<MovieTabbedState> mapEventToState(MovieTabbedEvent event) async* {
    if (event is MovieTabChangeEvent) {
         Either<AppError, List<MovieEntity>>? moviesEither;
    // print('before making api call $currentTabIndex');
    switch (event.currentindex) {
      case 0:
        moviesEither = await getPopular(NoParams());
        break;
      case 1:
        moviesEither = await getPlayingNow(NoParams());
        break;
      case 2:
        moviesEither = await getComingSoon(NoParams());
        break;
    }

  yield  moviesEither!.fold(
      (l) => MovietabLoadError(
        currentTabIndex: event.currentindex,
        // errorType: l.appErrorType,
      ),
      (movies) {
        // print('returning state making api call $currentTabIndex');
        return MovieTabbedChanged(
          curentTabIndex: event.currentindex,
          movies: movies,
        );
      },
    );

    }
  }
}
