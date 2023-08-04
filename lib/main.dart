import 'package:flutter/material.dart';
import 'package:show_case/model/home_page.dart';
import 'package:showcaseview/showcaseview.dart';

import 'model/drawer_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(

        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: ShowCaseWidget(
        //autoPlay: true,
        //enableAutoPlayLock: true,
        
        builder: Builder(
          builder: (context)=>  Stack(
            children: [
              DrawerPage(),
              HomePage(),
            ],
          ),
        ),
      )
    );
  }
}
