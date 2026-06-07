import 'package:flutter/material.dart';
import 'package:template_flutter/features/onboarding/repository/user_repository.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    _checkUser();
  }

  Future<void> _checkUser() async {
    final user = await UserRepository().getUserData();
    print('USER: ${user?.isOnboarded}');
    if (!mounted) return;

    Navigator.pushReplacementNamed(
      context,
      user?.isOnboarded == true ? '/onboarding/result' : '/onboarding/welcome',
    );
  }

  @override
  Widget build(BuildContext context) {
    return const Scaffold(body: Center(child: CircularProgressIndicator()));
  }
}
