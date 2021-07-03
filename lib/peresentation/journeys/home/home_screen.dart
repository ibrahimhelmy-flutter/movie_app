import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/di/get_it.dart';
import 'package:movie_app/peresentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:movie_app/peresentation/blocs/movie_carousal/movie_carousel_bloc.dart';
import 'package:movie_app/peresentation/blocs/movie_detail/movie_tabbed_bloc.dart';
import 'package:movie_app/peresentation/journeys/home/movie_carousel/movie_carousel_widget.dart';
import 'package:movie_app/peresentation/journeys/home/movie_tabbed/movie_tabbed_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  MovieCarouselBloc? movieCarouselBloc;
  MovieBackdropBloc? movieBackdropBloc;
  MovieTabbedBloc? movieTabbedBloc;
  @override
  void initState() {
    super.initState();
    movieCarouselBloc = getIt<MovieCarouselBloc>();
    movieTabbedBloc = getIt<MovieTabbedBloc>();
    movieBackdropBloc = movieCarouselBloc?.movieBackdropBloc;
    movieCarouselBloc!.add(CarouselLoadEvent());
  }

  @override
  void dispose() {
    super.dispose();
    movieCarouselBloc?.close();
    movieBackdropBloc?.close();
    movieTabbedBloc?.close();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<MovieCarouselBloc>(
            create: (context) => movieCarouselBloc!),
        BlocProvider<MovieBackdropBloc>(
            create: (context) => movieBackdropBloc!),
                    BlocProvider<MovieTabbedBloc>(
            create: (context) => movieTabbedBloc!),
      ],
      child: Scaffold(
        body: BlocBuilder<MovieCarouselBloc, MovieCarouselState>(
          builder: (context, state) {
            if (state is MovieCarouselLoaded) {
              return Stack(
                fit: StackFit.expand,
                children: [
                  FractionallySizedBox(
                      alignment: Alignment.topCenter,
                      heightFactor: 0.6,
                      child: MovieCarouselWidget(
                          movies: state.movies!,
                          defaultIndex: state.defaultIndex)),
                  FractionallySizedBox(
                    alignment: Alignment.bottomCenter,
                    heightFactor: 0.4,
                    child: MovieTabbedWidget(),
                  )
                ],
              );
            }
            return Text("error");
          },
        ),
      ),
    );
  }
}
