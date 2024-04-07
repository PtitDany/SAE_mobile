import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:all_o/Login_Page.dart';
import 'package:sqflite/sqflite.dart';
import './app.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://qwqclixmupirmuttmday.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InF3cWNsaXhtdXBpcm11dHRtZGF5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTAxNzAxOTMsImV4cCI6MjAyNTc0NjE5M30.OTBsDjeE-DNpN-tMgfgRFunHg1bhfm9C8krId-wxNjA',
  );
  runApp(MyApp());  
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: LoginPage(),
    );
  }
}