import 'package:flutter/material.dart';

import '../../../models/constants.dart';
import '../../auth/login.dart';

class Settings extends StatefulWidget {
  const Settings({super.key});

  @override
  State<Settings> createState() => _SettingsState();
}

class _SettingsState extends State<Settings> {
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
              title: Text("إعدادات"),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
          )
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(16.0),
              child: Card(
                child: Column(
                  children: [
                    ///text fields:
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              maxLength: 300,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(color: Colors.grey.shade300)
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(color: Colors.grey.shade300)
                                  ),
                                  hintText: "وصف الخاص بك"
                              ),
                            ),
                          ),
                        )
                      ],
                    ),

                    /// Speciality text field
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              maxLines: 5,
                              minLines: 1,
                              maxLength: 20,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(color: Colors.grey.shade300)
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(color: Colors.grey.shade300)
                                  ),
                                  hintText: "التخصص"
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              maxLines: 5,
                              minLines: 1,
                              maxLength: 3,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(color: Colors.grey.shade300)
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(color: Colors.grey.shade300)
                                  ),
                                  hintText: "الخبرة (بالسنوات)"
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: TextField(
                              maxLength: 20,
                              decoration: InputDecoration(
                                  filled: true,
                                  fillColor: Colors.white,
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(color: Colors.grey.shade300)
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide: BorderSide(color: Colors.grey.shade300)
                                  ),
                                  hintText: "موقع"
                              ),
                            ),
                          ),
                        )
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                                onPressed: () =>(){},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: HirafiConstants().hirafi_blue,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        side: BorderSide(color: Colors.transparent)// Adjust the radius here
                                    )
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "حفظ التغييرات",
                                      style: TextStyle(color: Colors.white,fontSize: 14),
                                    ),
                                  ],
                                )
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: ElevatedButton(
                                onPressed: (){
                                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login()));
                                },
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.redAccent,
                                    shape: RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        side: BorderSide(color: Colors.transparent)// Adjust the radius here
                                    )
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                      "تسجيل الخروج",
                                      style: TextStyle(color: Colors.white,fontSize: 14),
                                    ),
                                  ],
                                )
                            ),
                          ),
                        ),
                      ],
                    )
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
