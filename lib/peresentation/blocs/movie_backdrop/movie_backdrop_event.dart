part of 'movie_backdrop_bloc.dart';

abstract class MovieBackdropEvent extends Equatable {
  const MovieBackdropEvent();

  @override
  List<Object> get props => [];
}

class MoviebackDropChangeEvent extends MovieBackdropEvent {
  final MovieEntity movie;

  MoviebackDropChangeEvent(this.movie);
    @override
  List<Object> get props => [movie];
}
