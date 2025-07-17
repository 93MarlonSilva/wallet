import 'package:flutter/material.dart';
import 'package:wallet/pages/home/home_page.dart';
// import 'package:google_fonts/google_fonts.dart'; // Removido pois não está instalado

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Wallet App',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(
          seedColor: Colors.deepPurple,
          brightness: Brightness.dark,
          primary: const Color(0xFF377CFF),
          secondary: const Color(0xFFFFA351),
          background: Colors.black,
        ),
        scaffoldBackgroundColor: Colors.black,
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          iconTheme: IconThemeData(color: Colors.white),
        ),
        textTheme: const TextTheme(
          headlineSmall: TextStyle(
            fontFamily: 'Montserrat',
            fontWeight: FontWeight.bold,
            fontSize: 24,
            color: Colors.white,
            letterSpacing: 1.2,
          ),
          bodyLarge: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 16,
            color: Colors.white70,
          ),
          bodyMedium: TextStyle(
            fontFamily: 'Montserrat',
            fontSize: 14,
            color: Colors.white60,
          ),
        ),
        inputDecorationTheme: InputDecorationTheme(
          filled: true,
          fillColor: const Color(0xFF2A2A40),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(12),
            borderSide: BorderSide.none,
          ),
          hintStyle: TextStyle(color: Colors.white38, fontFamily: 'Montserrat'),
        ),
        iconTheme: const IconThemeData(color: Colors.white),
        useMaterial3: true,
      ),
      home: const HomePage(),
    );
  }
}
