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
                        ///biggest title:
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Expanded(
                              child: Text(
                                "Bosch Wireless Drill",
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
                                      Text("Specifications",style: TextStyle(fontSize: 18),),
                                    ],
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      spacing: 50,
                                      children: [
                                        Text("Brand",style: TextStyle(fontWeight: FontWeight.bold),),
                                        Text("",style: TextStyle(color: HirafiConstants().hirafi_blue),),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      spacing: 50,
                                      children: [
                                        Text("Condition",style: TextStyle(fontWeight: FontWeight.bold),),
                                        Text("",style: TextStyle(color: HirafiConstants().hirafi_blue),),
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: const EdgeInsets.all(8.0),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      spacing: 50,
                                      children: [
                                        Text("Price",style: TextStyle(fontWeight: FontWeight.bold),),
                                        Text("",style: TextStyle(color: HirafiConstants().hirafi_blue),),
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
                                "About This Tool",
                                style: TextStyle(fontSize: 16,fontWeight: FontWeight.bold),
                                textAlign: TextAlign.center, // Centers text inside Text widget
                                softWrap: true,
                              ),
                            ),
                          ],
                        ),
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("",style: TextStyle(fontSize: 14),),
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
                              "Contact Seller",
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
