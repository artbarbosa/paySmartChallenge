import 'package:flutter/material.dart';
import '../../../../../../core/const/app_colors_const.dart';

class AppBarComponent extends StatelessWidget {
  const AppBarComponent({
    Key? key,
    required this.currentHeight,
    required this.currentWidth,
    this.onPressed,
  }) : super(key: key);

  final double currentHeight;
  final double currentWidth;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      title: const Text(
        'Detail movie',
        style: TextStyle(fontSize: 25),
      ),
      centerTitle: true,
      leading: IconButton(
        onPressed: onPressed,
        icon: const Icon(
          Icons.arrow_back_ios_rounded,
          color: Colors.white,
        ),
      ),
      backgroundColor: AppColorsConst.background,
      expandedHeight: currentHeight * 0.01,
    );
  }
}
