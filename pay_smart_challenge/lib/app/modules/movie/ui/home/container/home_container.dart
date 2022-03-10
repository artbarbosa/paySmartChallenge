import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:get_it/get_it.dart';
import '../pages/home_erro.dart';
import '../pages/home_loading.dart';
import '../pages/home_page.dart';
import '../store/home_store.dart';

class HomeContainer extends StatefulWidget {
  const HomeContainer({Key? key}) : super(key: key);

  @override
  State<HomeContainer> createState() => _HomeContainerState();
}

class _HomeContainerState extends State<HomeContainer> {
  final HomeStore controller = GetIt.I.get<HomeStore>();

  @override
  Widget build(BuildContext context) {
    return Observer(builder: (context) {
      if (controller.isLoading == true) {
        return const HomeLoading();
      }
      if (controller.hasError == true) {
        return HomeError(
          controller: controller,
        );
      }
      return HomePage(
        controller: controller,
      );
    });
  }
}
