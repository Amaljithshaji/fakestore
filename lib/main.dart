import 'package:fakestore/controller/controller.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'view/home.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [ChangeNotifierProvider(create: (_)=>Controller())],
      child: MaterialApp(
        home: Home(),
        debugShowCheckedModeBanner: false,
      ),
    );
  }
}
