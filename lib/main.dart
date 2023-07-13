import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:group_introduce_project/presentation/views/Profile.dart';
import 'package:group_introduce_project/presentation/views/home.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );

  runApp(
    ProviderScope(
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.yellow),
        useMaterial3: true,
      ),
      initialRoute: '/', // 初期表示するルートを指定
      routes: {
        '/': (context) => MyHomePage(), // ルート名 '/' は通常ホームページ（アプリの初期ページ）に対応させます。
        '/profile': (context) => ProfilePage(), // '/second'という名前のルートをSecondPageに対応させます。
      },
    );
  }
}
