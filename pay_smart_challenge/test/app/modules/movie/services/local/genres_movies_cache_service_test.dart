import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:pay_smart_challenge/app/core/services/local/local_storage_service_interface.dart';
import 'package:pay_smart_challenge/app/core/services/local/shared_preferences_local_storage_service.dart';
import 'package:pay_smart_challenge/app/modules/movie/errors/movie_failures.dart';
import 'package:pay_smart_challenge/app/modules/movie/services/local/genres_movies_cache_service.dart';

class SharedPreferencesLocalStorageServiceMock extends Mock
    implements SharedPreferencesLocalStorageService {}

void main() {
  late GenreMoviesCacheService genresCacheService;
  late ILocalStorageService cache;

  setUpAll(() async {
    cache = SharedPreferencesLocalStorageServiceMock();
    genresCacheService = GenreMoviesCacheService(cache: cache);
  });

  test('Should throws a NoDataFound', () async {
    when(() => cache.getString(any())).thenThrow((_) async => Exception());

    expect(() => genresCacheService.getInCache('movies_test'),
        throwsA(isA<NoDataFound>()));
  });
}
