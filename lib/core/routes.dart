import 'package:flutter/material.dart';
import 'package:spotify/presentation/auth/pages/signin.dart';
import 'package:spotify/presentation/auth/pages/signup_or_siginin.dart';
import 'package:spotify/presentation/home/pages/home.dart';
import 'package:spotify/presentation/intro/pages/get_started.dart';
import 'package:spotify/presentation/profile/pages/profile.dart';

class Routes {
  static Route? onGenerateRoute(RouteSettings settings) {
    switch (settings.name) {
      case GetStartedPage.route:
        return MaterialPageRoute(builder: (_) => const GetStartedPage());
      case SignupOrSigninPage.route:
        return MaterialPageRoute(builder: (_) => const SignupOrSigninPage());
      case SigninPage.route:
        return MaterialPageRoute(builder: (_) => SigninPage());
      case HomePage.route:
        return MaterialPageRoute(builder: (_) => const HomePage());
      case ProfilePage.route:
        return MaterialPageRoute(builder: (_) => const ProfilePage());
      default:
        return MaterialPageRoute(builder: (_) => const GetStartedPage());
    }
  }
}
