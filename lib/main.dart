import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:take_home/pages/splash.dart';
import 'package:take_home/provider/get_it_service.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
  setup();
  runApp(const MyApp());
}
