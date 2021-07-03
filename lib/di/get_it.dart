import 'package:get_it/get_it.dart';
import 'package:http/http.dart';
import 'package:movie_app/data/core/api_client.dart';
import 'package:movie_app/data/data_sources/movie_remote_data_source.dart';
import 'package:movie_app/data/domain/repository/movie_repository.dart';
import 'package:movie_app/data/domain/usecases/get_coming_soon.dart';
import 'package:movie_app/data/domain/usecases/get_playing_now.dart';
import 'package:movie_app/data/domain/usecases/get_popular.dart';
import 'package:movie_app/data/domain/usecases/get_tranding.dart';
import 'package:movie_app/data/repository/movie_repository_impl.dart';
import 'package:movie_app/peresentation/blocs/movie_backdrop/movie_backdrop_bloc.dart';
import 'package:movie_app/peresentation/blocs/movie_carousal/movie_carousel_bloc.dart';
import 'package:movie_app/peresentation/blocs/movie_detail/movie_tabbed_bloc.dart';

final getIt = GetIt.instance;
Future init() async {
  getIt.registerLazySingleton<Client>(() => Client());
  getIt.registerLazySingleton<ApiClient>(() => ApiClient(getIt()));
  getIt.registerLazySingleton<MovieRemoteDataSource>(
      () => MovieRemoteDataSourceImpl(getIt()));

  getIt.registerLazySingleton<GetTrending>(() => GetTrending(getIt()));
  getIt.registerLazySingleton<GetPopular>(() => GetPopular(getIt()));
  getIt.registerLazySingleton<GetPlayingNow>(() => GetPlayingNow(getIt()));
  getIt.registerLazySingleton<GetComingSoon>(() => GetComingSoon(getIt()));

  getIt.registerLazySingleton<MovieRepository>(
      () => MovieRepositoryImpl(getIt()));
  getIt.registerFactory(() => MovieBackdropBloc());

  getIt.registerFactory(() => MovieCarouselBloc(
        getTrending: getIt(),
        movieBackdropBloc: getIt(),
      ));
      getIt.registerFactory(() =>MovieTabbedBloc(
        getPopular:GetPopular(getIt()) ,
         getPlayingNow: GetPlayingNow(getIt()),
          getComingSoon: GetComingSoon(getIt())) ,);
}
