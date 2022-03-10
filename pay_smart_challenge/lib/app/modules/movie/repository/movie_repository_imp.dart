import '../../../core/const/api_consts.dart';
import '../../../core/services/remote/http_client_service.dart';
import '../errors/movie_failures.dart';
import '../model/details_movies_up_comming_model.dart';
import '../model/genres_movies_model.dart';
import '../model/movie_model.dart';
import 'movie_repository_interface.dart';
import 'package:dio/dio.dart';

class MovieRepositoryImp implements IMovieRepository {
  final IHttpService httpService;

  MovieRepositoryImp({required this.httpService});

  @override
  Future<List<MovieModel>> getMoviesUpComming(int page) async {
    try {
      final response =
          await httpService.get(ApiConst.moviesUpComming(page: page));
      final list = response.data['results'] as List<dynamic>;
      return list.map((e) => MovieModel.fromJson(e)).toList();
    } on DioError catch (e, stackTrace) {
      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout) {
        throw MovieUpComingNoInternetConnection();
      } else if (e.type == DioErrorType.other) {
        throw MovieUpComingNoInternetConnection();
      } else {
        throw MovieUpComingError(
          stackTrace: stackTrace,
          label: 'MovieRepositoryImp-getMovieUpComming',
          exception: e.error,
          errorMessage: e.message,
        );
      }
    }
  }

  @override
  Future<DetailsMoviesUpCommingModel> getDetailsMoviesUpComming() async {
    try {
      final response = await httpService.get(ApiConst.moviesUpComming());
      return DetailsMoviesUpCommingModel(
        totalPages: response.data['total_pages'],
        totalResults: response.data['total_results'],
      );
    } on DioError catch (e, stackTrace) {
      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout) {
        throw MovieUpComingNoInternetConnection();
      } else if (e.type == DioErrorType.other) {
        throw MovieUpComingNoInternetConnection();
      } else {
        throw MovieUpComingError(
          stackTrace: stackTrace,
          label: 'MovieRepositoryImp-getTotalPagesMoviesUpComming',
          exception: e.error,
          errorMessage: e.message,
        );
      }
    }
  }

  @override
  Future<List<GenresMoviesModel>> getAllMoviesGenres() async {
    try {
      final response = await httpService.get(ApiConst.fetchGenre());
      final list = response.data['genres'] as List<dynamic>;
      return list.map((e) => GenresMoviesModel.fromJson(e)).toList();
    } on DioError catch (e, stackTrace) {
      if (e.type == DioErrorType.connectTimeout ||
          e.type == DioErrorType.receiveTimeout) {
        throw MovieGenresNoInternetConnection();
      } else if (e.type == DioErrorType.other) {
        throw MovieGenresNoInternetConnection();
      } else {
        throw MovieGenresError(
          stackTrace: stackTrace,
          label: 'MovieRepositoryImp-getMovieUpComming',
          exception: e.error,
          errorMessage: e.message,
        );
      }
    }
  }
}
