import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movie_app/peresentation/blocs/movie_detail/movie_tabbed_bloc.dart';

import '../../../../common/constants/size_constants.dart';
import '../../../../common/constants/translation_constants.dart';
import '../../../../common/extensions/size_extensions.dart';
import '../../../../common/extensions/string_extensions.dart';

import 'movie_list_view_builder.dart';
import 'movie_tabbed_constants.dart';
import 'tab_title_widget.dart';

class MovieTabbedWidget extends StatefulWidget {
  @override
  _MovieTabbedWidgetState createState() => _MovieTabbedWidgetState();
}

class _MovieTabbedWidgetState extends State<MovieTabbedWidget>
    with SingleTickerProviderStateMixin {
  MovieTabbedBloc get movieTabbedCubit =>
      BlocProvider.of<MovieTabbedBloc>(context);

  int currentTabIndex = 0;

  @override
  void initState() {
    super.initState();
    movieTabbedCubit.add(MovieTabChangeEvent(currentindex: currentTabIndex));
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MovieTabbedBloc, MovieTabbedState>(
      builder: (context, state) {
        return Padding(
          padding: EdgeInsets.only(top: Sizes.dimen_4.h),
          child: Column(
            children: <Widget>[
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  for (var i = 0;
                      i < MovieTabbedConstants.movieTabs.length;
                      i++)
                    TabTitleWidget(
                      title: MovieTabbedConstants.movieTabs[i].title,
                      onTap: () => _onTabTapped(i),
                      isSelected: MovieTabbedConstants.movieTabs[i].index ==
                          state.curentTabIndex,
                    )
                ],
              ),
              if (state is MovieTabbedChanged)
                // state.movies.isEmpty
                //     ? Expanded(
                //         child: Center(
                //           child: Text(
                //             TranslationConstants.noMovies.t(context),
                //             textAlign: TextAlign.center,
                //             style: Theme.of(context).textTheme.subtitle1,
                //           ),
                //         ),
                //       )
                //     : 
                    Expanded(
                        child: MovieListViewBuilder(movies: state.movies!),
                      ),
              // if (state is MovieTabLoadError)
              //   Expanded(
              //     child: AppErrorWidget(
              //       errorType: state.errorType,
              //       onPressed: () => movieTabbedCubit.movieTabChanged(
              //         currentTabIndex: state.currentTabIndex,
              //       ),
              //     ),
              //   ),
              // if (state is MovieTabLoading)
              //   Expanded(
              //     child: Center(
              //       child: LoadingCircle(
              //         size: Sizes.dimen_100.w,
              //       ),
              //     ),
              //   ),
            ],
          ),
        );
      },
    );
  }

  void _onTabTapped(int index) {
    movieTabbedCubit.add(MovieTabChangeEvent(currentindex: index));
  }
}
