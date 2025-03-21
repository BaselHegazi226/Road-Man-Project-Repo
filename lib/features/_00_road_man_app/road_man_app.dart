import 'package:flutter/material.dart';

import '../../core/utilities/app_router.dart';

class RoadManApp extends StatelessWidget {
  const RoadManApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      routerConfig: AppRouter.router,
    );
  }
}
