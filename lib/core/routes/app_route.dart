import 'package:flutter/material.dart';
import 'package:news/core/routes/page_route_name.dart';
import 'package:news/modules/home/View/home_view.dart';
import 'package:news/modules/splash/pages/splash_view.dart';

abstract class AppRouter{

 static Route<dynamic> onGenerateRoute(RouteSettings settings){

    switch(settings.name){
      case PageRouteName.initial:
        return MaterialPageRoute(builder: (context) => const SplashView());

      case PageRouteName.home:
        return MaterialPageRoute(builder: (context) => const HomeView());
      
      
      default:
        return MaterialPageRoute(builder: (context) => const SplashView());
    }

  }
}