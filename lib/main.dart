import 'package:flutter/material.dart';
import 'package:freelancer_app/app/view/color/color.dart';
import 'package:freelancer_app/feature/view/navigate_page.dart';
import 'package:freelancer_app/provider/home_provider.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => HomeProvider()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        scaffoldBackgroundColor: AppColors.backgroundColor,
        fontFamily: "Poppins",
      ),
      home: NavigatePage(),
    );
  }
}
