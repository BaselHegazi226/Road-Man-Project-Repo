import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';

import 'features/_00_road_man_app/road_man_app.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  runApp(const RoadManApp());
}
