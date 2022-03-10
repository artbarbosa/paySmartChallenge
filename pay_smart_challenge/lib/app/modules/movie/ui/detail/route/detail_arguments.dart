import 'package:cached_network_image/cached_network_image.dart';
import '../../../model/movie_model.dart';

class DetailArguments {
  DetailArguments({
    this.index = 0,
    required this.movie,
    required this.listGenresMovie,
    required this.imagePost,
  });
  final int index;
  final MovieModel movie;
  final List<String> listGenresMovie;
  final CachedNetworkImage imagePost;
}
