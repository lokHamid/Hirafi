import 'package:flutter/material.dart';
import 'package:hirafi_frontend/models/constants.dart';

class ToolViewPage extends StatefulWidget {
  const ToolViewPage({super.key});

  @override
  State<ToolViewPage> createState() => _ToolViewPageState();
}

class _ToolViewPageState extends State<ToolViewPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Center(
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Card(
                  shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.transparent)
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                "أداة احترافية للنص الطويل لغرض الاختبار",
                                style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center, // Centers text inside Text widget
                                softWrap: true,
                              ),
                            ),
                          ],
                        ),
                        /// specifications card:
                        ///
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Card(
                            color: Colors.white,
                            shape: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(10),
                              borderSide: BorderSide(color: Colors.transparent)
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(4.0),
                              child: Column(
                                children: [
                                  Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("المواصفات",style: TextStyle(fontSize: 18),),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      spacing: 50,
                                      children: [
                                        Text("ماركة",style: TextStyle(fontWeight: FontWeight.bold),),
                                        Text("بوش",style: TextStyle(color: HirafiConstants().hirafi_blue),),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      spacing: 50,
                                      children: [
                                        Text("الحالة",style: TextStyle(fontWeight: FontWeight.bold),),
                                        Text("جديد",style: TextStyle(color: HirafiConstants().hirafi_blue),),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      spacing: 50,
                                      children: [
                                        Text("سعر",style: TextStyle(fontWeight: FontWeight.bold),),
                                        Text("\$27.99",style: TextStyle(color: HirafiConstants().hirafi_blue),),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),

                        /// description of tool + other stuff:
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                "حول هذه الأداة",
                                style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center, // Centers text inside Text widget
                                softWrap: true,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("نص طويل لأداة احترافية جدًا لأغراض الاختبار، الوصف أو حول (النص الذي يعجبك).",style: TextStyle(fontSize: 14),),
                        )
                      ],
                    ),
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left:16.0,right:16),
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
                              "اتصل بالبائع",
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
    );
  }
}
