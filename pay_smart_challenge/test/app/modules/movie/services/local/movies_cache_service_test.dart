import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pay_smart_challenge/app/core/services/local/local_storage_service_interface.dart';
import 'package:pay_smart_challenge/app/core/services/local/shared_preferences_local_storage_service.dart';
import 'package:pay_smart_challenge/app/modules/movie/errors/movie_failures.dart';
import 'package:pay_smart_challenge/app/modules/movie/services/local/movies_cache_service.dart';

class SharedPreferencesLocalStorageServiceMock extends Mock
    implements SharedPreferencesLocalStorageService {}

void main() {
  late MoviesCacheService moviesCacheService;
  late ILocalStorageService cache;

  setUpAll(() async {
    cache = SharedPreferencesLocalStorageServiceMock();
    moviesCacheService = MoviesCacheService(cache: cache);
  });

  test('Should throws a NoDataFound', () async {
    when(() => cache.getString(any())).thenThrow((_) async => Exception());

    expect(() => moviesCacheService.getInCache('movies_test'),
        throwsA(isA<NoDataFound>()));
  });
}

  // final List<MovieModel> listMovies = [
  //   MovieModel(
  //     adult: false,
  //     genreIds: [18],
  //     id: 670981,
  //     originalLanguage: 'es',
  //     originalTitle: 'Noche de fuego',
  //     overview:
  //         "In a mountain town, where corn and poppies grow, the girls wear boyish haircuts and have hiding places underground to escape the threat of being stolen. Ana and her two best friends grow up together, affirming the bonds of their friendship and discovering what it means to be women in a rural town marked by violence. Their mothers train them to flee death, to escape those who turn them into slaves or ghosts. They create their own impenetrable universe, but one day one of the girls doesn’t make it to her hiding place in time.",
  //     popularity: 38.082,
  //     releaseDate: '2021-09-16',
  //     title: 'Prayers for the Stolen',
  //     video: false,
  //     voteAverage: 8.1,
  //     voteCount: 53,
  //     backdropPath: 'yGlUHuSUdsfy5GYxW42w95RpIms',
  //     posterPath: '/kb0IrVB4bDzBilRNpDv1OPMCs3u.jpg',
  //   )
  // ];