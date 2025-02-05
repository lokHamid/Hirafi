import 'package:flutter/material.dart';
import 'package:hirafi_frontend/views/main_pages/dashboard_craftsman.dart';


void main() {
  runApp(const Hirafi());
}

class Hirafi extends StatelessWidget {
  const Hirafi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(fontFamily: 'Roboto'),
      debugShowCheckedModeBanner: false,
      home: Dashboard(),
    );
  }
}