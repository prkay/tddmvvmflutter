import 'package:flutter/material.dart';
import 'injection/injection_container.dart' as di;
import 'my_app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await di.init();
  runApp(
    const MyApp(),
  );
}
