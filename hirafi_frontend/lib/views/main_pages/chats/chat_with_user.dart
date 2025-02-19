import 'package:flutter/material.dart';

class ChatWithUser extends StatefulWidget {
  const ChatWithUser({super.key});

  @override
  State<ChatWithUser> createState() => _ChatWithUserState();
}

class _ChatWithUserState extends State<ChatWithUser> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(kToolbarHeight),
        child: Container(
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [Colors.blue, Color(0xFFafeeee)], // Gradient colors
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: AppBar(
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            ///implement text messaging ;_;
            /// im just gonna skip this ( this comment is here because lokman wrote it )
          ],
        )
      ),
    );
  }
}
