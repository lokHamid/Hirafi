import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../../../models/constants.dart';

class JobViewPage extends StatefulWidget {
  const JobViewPage({super.key});

  @override
  State<JobViewPage> createState() => _JobViewPageState();
}

class _JobViewPageState extends State<JobViewPage> {
  final ScrollController _parentScrollController = ScrollController();
  final ScrollController _childScrollController = ScrollController();

  bool _isChildScrolling = true;

  @override
  void dispose() {
    _parentScrollController.dispose();
    _childScrollController.dispose();
    super.dispose();
  }
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
      body: Padding(
        padding: const EdgeInsets.only(top:50.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Card(
                margin: EdgeInsets.all(10),
                color: Colors.white,
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.transparent)
                ),
                child: GestureDetector(
                  onTap: (){
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>JobViewPage()));
                  },
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Kitchen Re-Model",style: TextStyle(fontSize: 22,fontWeight: FontWeight.bold),),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Expanded(child: Text("",style: TextStyle(fontSize: 16),softWrap: true,)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            FaIcon(FontAwesomeIcons.locationDot,size: 16,),
                            SizedBox(width: 10,),
                            Expanded(child: Text("",style: TextStyle(fontSize: 16),softWrap: true,)),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          children: [
                            FaIcon(FontAwesomeIcons.user,size: 16,),
                            SizedBox(width: 10,),
                            Expanded(child: Text("",style: TextStyle(fontSize: 16),softWrap: true,)),
                          ],
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
                                        "Contact Client",
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
