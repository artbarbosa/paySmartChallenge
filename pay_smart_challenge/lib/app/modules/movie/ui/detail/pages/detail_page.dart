import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../../core/const/app_colors_const.dart';
import '../../../model/movie_model.dart';
import 'components/app_bar_component.dart';
import 'components/movie_info_component.dart';
import 'widgets/image_detail_custom_widget.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({
    Key? key,
    required this.movie,
    required this.listGenresMovie,
    required this.imagePost,
  }) : super(key: key);
  final MovieModel movie;
  final List<String> listGenresMovie;
  final CachedNetworkImage imagePost;
  @override
  Widget build(BuildContext context) {
    final double currentHeight = MediaQuery.of(context).size.height;
    final double currentWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      backgroundColor: AppColorsConst.background,
      body: CustomScrollView(
        slivers: [
          AppBarComponent(
            currentHeight: currentHeight,
            currentWidth: currentWidth,
            onPressed: () => Navigator.pop(context),
          ),
          SliverToBoxAdapter(
            child: CustomImageDetailWidget(
              imagePost: imagePost,
              movieId: movie.id,
            ),
          ),
          MovieInfoComponent(
            currentHeight: currentHeight,
            currentWidth: currentWidth,
            movie: movie,
            listGenresMovie: listGenresMovie,
          )
        ],
      ),
    );
  }
}
