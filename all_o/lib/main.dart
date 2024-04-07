import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import './router/app_router.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://qwqclixmupirmuttmday.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InF3cWNsaXhtdXBpcm11dHRtZGF5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTAxNzAxOTMsImV4cCI6MjAyNTc0NjE5M30.OTBsDjeE-DNpN-tMgfgRFunHg1bhfm9C8krId-wxNjA',
  );
  runApp(MyApp());  
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      title: "ALL'O",
      routerConfig: router,
    );
  }
}