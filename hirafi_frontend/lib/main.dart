import 'package:flutter/material.dart';
import 'package:hirafi_frontend/views/auth/login.dart';
import 'package:hirafi_frontend/views/main_pages/dashboards/dashboard_craftsman.dart';


void main() {
  runApp(const Hirafi());
}

class Hirafi extends StatelessWidget {
  const Hirafi({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "حرفي",
      theme: ThemeData(fontFamily: 'Roboto'),
      debugShowCheckedModeBanner: false,
      home: Login(),
    );
  }
}