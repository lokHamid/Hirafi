import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hirafi_frontend/models/constants.dart';

class CraftsmanProfile extends StatefulWidget {
  const CraftsmanProfile({super.key});

  @override
  State<CraftsmanProfile> createState() => _CraftsmanProfileState();
}

class _CraftsmanProfileState extends State<CraftsmanProfile> {
  int _rating = 0; // Current selected rating

  void _setRating(int rating) {
    setState(() {
      _rating = rating;
    });
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Craftsman Profile",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
        backgroundColor: Colors.white
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(top:8.0,left:8.0),
                      child: Row(
                        children: [
                          Text("saaid zitouni",style: TextStyle(fontSize: 20),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:8.0,left:8.0),
                      child: Row(
                        children: [
                          Text("Water Plumber",style: TextStyle(fontSize: 16),),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          FaIcon(FontAwesomeIcons.locationDot,size: 20,),
                          SizedBox(width: 10,),
                          Text("",style: TextStyle(fontSize: 16),),
                        ],
                      ),
                    ),
                    Divider(),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("",style: TextStyle(color: HirafiConstants().hirafi_blue,fontSize: 20),),
                              Text("Years Of Experience")
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("0.0",style: TextStyle(color: HirafiConstants().hirafi_blue,fontSize: 20),),
                              Text("Average Rating")
                            ],
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top:8,bottom: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor: HirafiConstants().hirafi_blue,
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    side: BorderSide(color: Colors.transparent)// Adjust the radius here
                                )
                            ),
                            onPressed: () {
                              // Handle the rating submission here
                            },
                            child: Text('rate',style: TextStyle(color: Colors.white),softWrap: true,),
                          ),
                          SizedBox(width: 10),
                          Row(
                            children: List.generate(5, (index) {
                              return IconButton(
                                icon: Icon(
                                  index < _rating ? Icons.star : Icons.star_border,
                                  color: index < _rating ? Colors.yellow : Colors.grey,
                                  size: 30,
                                ),
                                onPressed: () => _setRating(index + 1),
                              );
                            }),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text("About This Craftsman",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("",style: TextStyle(fontSize: 16),),
                    )
                  ],
                ),
              ),
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
                              "Contact Craftsman",
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
