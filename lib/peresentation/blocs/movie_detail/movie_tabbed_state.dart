part of 'movie_tabbed_bloc.dart';

abstract class MovieTabbedState extends Equatable {
  final int? curentTabIndex;
  const MovieTabbedState({this.curentTabIndex});

  @override
  List<Object> get props => [curentTabIndex!];
}

class MovieTabbedInitial extends MovieTabbedState {}

class MovieTabbedChanged extends MovieTabbedState {
  final List<MovieEntity>? movies;

  MovieTabbedChanged({int? curentTabIndex, this.movies})
      : super(curentTabIndex: curentTabIndex);

  @override
  List<Object> get props => [curentTabIndex!, movies!];
}

class MovietabLoadError extends MovieTabbedState {
  const MovietabLoadError({int? currentTabIndex})
      : super(curentTabIndex: currentTabIndex);
}
