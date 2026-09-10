import 'package:career_lk/view/job_detail_screen.dart';
import 'package:career_lk/view/login/signin_screen.dart';
import 'package:career_lk/view/main_screens/home_screen.dart';
import 'package:career_lk/view/main_screens/main_screen.dart';
import 'package:career_lk/view/onboarding_screens/onbording_screen.dart';
import 'package:career_lk/view/main_screens/profile_screen.dart';
import 'package:career_lk/view/main_screens/saved_jobs_screen.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const new({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        fontFamily: GoogleFonts.poppins().fontFamily,
        scaffoldBackgroundColor: Color(0xffeff0f3),
      ),
      home: OnbordingScreen(),
    );
  }
}
