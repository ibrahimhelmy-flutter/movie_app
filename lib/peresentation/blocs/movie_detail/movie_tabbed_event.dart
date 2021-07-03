part of 'movie_tabbed_bloc.dart';

abstract class MovieTabbedEvent extends Equatable {
  const MovieTabbedEvent();

  @override
  List<Object> get props => [];
}

class MovieTabChangeEvent extends MovieTabbedEvent {
  final int currentindex;

 const MovieTabChangeEvent({this.currentindex=0});
    @override
  List<Object> get props => [currentindex];
}
