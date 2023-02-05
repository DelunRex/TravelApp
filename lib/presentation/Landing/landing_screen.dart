import 'package:flutter/material.dart';

import '../../app_theme.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});
  static const String id = 'landing';

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      backgroundColor: AppTheme.white,
      body: SafeArea(child: LandingBody()),
    );
  }
}

class LandingBody extends StatelessWidget {
  const LandingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
