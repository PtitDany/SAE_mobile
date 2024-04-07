import 'package:flutter/material.dart';
import 'package:supabase_flutter/supabase_flutter.dart';
import 'package:all_o/Home_Page.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Supabase.initialize(
    url: 'https://qwqclixmupirmuttmday.supabase.co',
    anonKey: 'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InF3cWNsaXhtdXBpcm11dHRtZGF5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTAxNzAxOTMsImV4cCI6MjAyNTc0NjE5M30.OTBsDjeE-DNpN-tMgfgRFunHg1bhfm9C8krId-wxNjA',
  );
  final client = SupabaseClient(
    'https://qwqclixmupirmuttmday.supabase.co',
    'eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJpc3MiOiJzdXBhYmFzZSIsInJlZiI6InF3cWNsaXhtdXBpcm11dHRtZGF5Iiwicm9sZSI6ImFub24iLCJpYXQiOjE3MTAxNzAxOTMsImV4cCI6MjAyNTc0NjE5M30.OTBsDjeE-DNpN-tMgfgRFunHg1bhfm9C8krId-wxNjA',
  );
  runApp(MyApp(client: client));  
}

class MyApp extends StatelessWidget {
  final SupabaseClient client;
  MyApp({required this.client});
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: HomePage(),
    );
  }
}
