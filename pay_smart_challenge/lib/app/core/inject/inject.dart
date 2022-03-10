import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pay_smart_challenge/app/modules/movie/services/local/genres_movies_cache_service.dart';
import 'package:shared_preferences/shared_preferences.dart';
import '../../modules/movie/repository/movie_repository_imp.dart';
import '../../modules/movie/repository/movie_repository_interface.dart';
import '../../modules/movie/services/local/movies_cache_service.dart';
import '../../modules/movie/stores/genres_movie_store.dart';
import '../../modules/movie/stores/movies_up_comming_store.dart';
import '../../modules/movie/ui/home/store/home_store.dart';
import '../services/local/local_storage_service_interface.dart';
import '../services/local/shared_preferences_local_storage_service.dart';
import '../services/remote/dio_http_client_service.dart';
import '../services/remote/http_client_service.dart';

class Inject {
  static initialize() {
    GetIt getIt = GetIt.instance;

    getIt.registerLazySingleton<IHttpService>(() => DioHttpServiceImp(Dio()));
    getIt.registerLazySingleton<ILocalStorageService>(() =>
        SharedPreferencesLocalStorageService(
            sharedPreferences: SharedPreferences.getInstance()));
    getIt.registerLazySingleton<IMovieRepository>(
        () => MovieRepositoryImp(httpService: getIt()));
    getIt.registerLazySingleton<MoviesCacheService>(
        () => MoviesCacheService(cache: getIt()));
    getIt.registerLazySingleton<GenreMoviesCacheService>(
        () => GenreMoviesCacheService(cache: getIt()));
    getIt.registerLazySingleton<GenresMovieStore>(
        () => GenresMovieStore(cache: getIt(), repository: getIt()));
    getIt.registerLazySingleton<MovieUpCommingStore>(
        () => MovieUpCommingStore(cache: getIt(), repository: getIt()));
    getIt.registerLazySingleton<HomeStore>(() =>
        HomeStore(genresMovieStore: getIt(), movieUpCommingStore: getIt()));
  }
}
