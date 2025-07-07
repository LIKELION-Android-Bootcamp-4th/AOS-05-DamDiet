import 'package:damdiet/presentation/routes/app_routes.dart';
import 'package:damdiet/presentation/screens/splash/splash_viewmodel.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();

    Future.microtask(() {
      context.read<SplashViewModel>().checkLogin(
        context: context,
        homeRoute: AppRoutes.home,
        loginRoute: AppRoutes.signIn,
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: Center(child: CircularProgressIndicator()),
    );
  }
}
