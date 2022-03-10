import 'dart:convert';
import '../../../../core/services/local/local_storage_service_interface.dart';
import '../../errors/movie_failures.dart';
import '../../model/movie_model.dart';

class MoviesCacheService {
  final ILocalStorageService cache;

  MoviesCacheService({required this.cache});

  removeInCache(String key) {
    cache.remove(key);
  }

  void saveInCache(String key, List<dynamic> listMovies) async {
    String jsonMovies = jsonEncode(listMovies);
    cache.setString(key, jsonMovies);
  }

  Future<List<dynamic>> getInCache(String key) async {
    try {
      final moviesJsonString = await cache.getString(key);
      final list = jsonDecode(moviesJsonString!) as List;
      return list.map((e) => MovieModel.fromJson(e)).toList();
    } catch (e) {
      throw NoDataFound();
    }
  }
}
