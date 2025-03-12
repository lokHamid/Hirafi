import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hirafi_frontend/models/constants.dart';
import 'package:hirafi_frontend/providers/providers.dart';
import 'package:hirafi_frontend/views/main_pages/dashboards/my_profile.dart';
import 'package:hirafi_frontend/views/main_pages/marketplace/marketplace.dart';
import 'package:hirafi_frontend/views/main_pages/searchUsers/search_users.dart';

import '../../../models/tool.dart';
import '../../../services/tools_service.dart';
import '../chats/chats.dart';
import '../marketplace/tool_view_page.dart';
import '../searchUsers/craftsman_profile.dart';


class Dashboard extends ConsumerWidget{
  List<Tool> myMarketTools = List.empty();///for now.

  void _retrieveToolsForUser(ToolsService toolsService,String uid) async {
    try {
      myMarketTools = await toolsService.getToolBySellerId(uid);
    } catch (e) {
      rethrow;
    }
  }
  
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final currentUser = ref.watch(currentUserProvider);
    final ToolsService toolsService = ref.read(toolsServiceProvider);
    _retrieveToolsForUser(toolsService,currentUser?.uid ?? "idk");
    
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
              actions: [
                IconButton(onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>MyProfile()));
                }, icon: FaIcon(FontAwesomeIcons.solidCircleUser))
              ],
              title: Text("Dashboard"),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
          )
      ),

      ///drawer items include search for jobs/users , marketplace , settings.
      drawer: Drawer(
        shape: OutlineInputBorder(
          borderRadius: BorderRadius.circular(0),
          borderSide: BorderSide(color: Colors.transparent)
        ),
        child: ListView(
          children: [
            DrawerHeader(
                decoration: BoxDecoration(
                color: Colors.blue, // Background color
              ),
              child: Column(
                children: [
                  Row(
                    children: [
                      Text("Hirafi",style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.bold),),
                    ],
                  ),
                  Row(
                    children: [
                      Text("saaid zitouni",style: TextStyle(color: Colors.white,fontSize: 18)),
                    ],
                  ),
                  Row(
                    children: [
                      Expanded(child: Text("saaidzitouni77@gmail.com",softWrap: true,style: TextStyle(color: Colors.white,fontSize: 18),)),
                    ],
                  )
                ],
              )
            ),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.magnifyingGlass),
              title: Text("Find Users"),
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SearchUsers()));
                }
            ),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.cartShopping),
              title: Text("Marketplace"),
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Marketplace()));
                }
            ),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.comment),
              title: Text("Active Chats"),
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Chats()));
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            /// LOCATION CARD
            Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FaIcon(FontAwesomeIcons.locationDot,color: HirafiConstants().hirafi_blue,),
                                SizedBox(width: 5,),
                                Text(
                                  (currentUser?.location == null)? "Location Not Set" : currentUser!.location.toString(), ///for now , must extract the location later from it using third party services.
                                  style: TextStyle(fontSize: 20,color: HirafiConstants().hirafi_blue),
                                  softWrap: true,
                                ),
                              ],
                            ),
                            Text(
                              "Current location",
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            /// RATING CARD
              Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Column(
                          children: [
                            Text(
                              "3.8",
                              style: TextStyle(fontSize: 24,color: HirafiConstants().hirafi_blue),
                            ),
                            Text(
                              "Average Rating",
                              style: TextStyle(fontSize: 18),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            /// MARKETPLACE SECTION WITH LISTVIEW
            Padding(
              padding: const EdgeInsets.all(8),
              child: Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Marketplace",
                        style: TextStyle(fontSize: 24),
                      ),
                      Text(
                        "My Listings",
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 10), // Space before list

                      ///  LISTVIEW MARKETPLACE
                      SizedBox(
                        height: 200, // Set height to avoid infinite constraints
                        child: ListView.builder(
                          itemCount: myMarketTools.length, // Number of items in the marketplace
                          itemBuilder: (context, index) {
                            return Card(
                              color: Colors.white,
                              margin: EdgeInsets.symmetric(vertical: 5),
                              child: ListTile(
                                leading: Icon(Icons.shopping_bag), // Example icon
                                title: Text(myMarketTools[index].title),
                                subtitle: Text(myMarketTools[index].category),
                                trailing: Icon(Icons.arrow_forward_ios),
                                onTap: () {
                                  Navigator.push(context, MaterialPageRoute(builder: (context)=>ToolViewPage()));
                                },
                              ),
                            );
                          },
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                shape: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10),
                    borderSide: BorderSide(color: Colors.transparent)
                ),
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("Craftsmen Near You",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 300,
                      child: ListView.builder(
                          itemCount: 5, /// for now ;_;
                          itemBuilder: (context,i){

                            return ListTile(
                              onTap: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>CraftsmanProfile()));
                              },
                              title: Text("saaid zitouni"),
                              subtitle: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text("Furniture Carpenter"),
                                  Row(
                                    children: [
                                      FaIcon(FontAwesomeIcons.locationDot,size: 14,),
                                      SizedBox(width: 5,),
                                      Text("Constantine,Algeria", style: TextStyle(fontSize: 14, color: Colors.grey)),
                                    ],
                                  ),
                                ],
                              ),
                              leading: FaIcon(FontAwesomeIcons.solidCircleUser),
                            );
                          }),
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
