import '../model/details_movies_up_comming_model.dart';
import '../model/genres_movies_model.dart';
import '../model/movie_model.dart';

abstract class IMovieRepository {
  Future<List<MovieModel>> getMoviesUpComming(int page);
  Future<DetailsMoviesUpCommingModel> getDetailsMoviesUpComming();
  Future<List<GenresMoviesModel>> getAllMoviesGenres();
}
