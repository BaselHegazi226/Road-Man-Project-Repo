import 'package:flutter/material.dart';

import '../../core/utilities/app_router.dart';

class RoadManApp extends StatelessWidget {
  const RoadManApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(fontFamily: 'afacad', focusColor: Color(0xff131314)),
      routerConfig: AppRouter.router,
    );
  }
}
