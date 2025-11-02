import 'package:flutter/material.dart';
import 'package:news/core/routes/page_route_name.dart';
import 'package:news/gen/assets.gen.dart';
import 'package:news/main.dart';
class SplashView extends StatefulWidget {
  const SplashView({super.key});

  @override
  State<SplashView> createState() => _SplashViewState();

}

class _SplashViewState extends State<SplashView> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Future.delayed(const Duration(seconds: 2), () {
      navigatorKey.currentState!.pushNamedAndRemoveUntil(
        PageRouteName.home,
          (route) => false ,
      );
    });
  }
  @override
  Widget build(BuildContext context) {
    return  Container(
      color: Colors.white,
      child: Assets.images.appLogoImage.image(),
    );
  }
}
