import 'package:damdiet/presentation/routes/app_routes.dart';
import 'package:damdiet/presentation/provider/user_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';


class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder<bool>(
      future: context.read<UserProvider>().fetchProfile(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          final isLoggedIn = snapshot.data ?? false;

          WidgetsBinding.instance.addPostFrameCallback((_) {
            Navigator.pushReplacementNamed(
              context,
              isLoggedIn ? AppRoutes.home : AppRoutes.signIn,
            );
          });

          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        } else {
          return const Scaffold(
            body: Center(child: CircularProgressIndicator()),
          );
        }
      },
    );
  }
}
