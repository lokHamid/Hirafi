import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hirafi_frontend/models/constants.dart';
import 'package:hirafi_frontend/views/main_pages/marketplace/item_listing.dart';
import 'package:hirafi_frontend/views/main_pages/marketplace/tool_view_page.dart';
import '../../../models/tool.dart';
import '../chats/chats.dart';
import '../dashboards/dashboard_craftsman.dart';
import '../searchUsers/search_users.dart';


String selectedCriteria = "";
late List<Tool> recentTools = List.empty();
List<Tool> myMarketTools = List.empty();
List<Tool> allTools = List.empty();

class Marketplace extends StatefulWidget {
  const Marketplace({super.key});

  @override
  State<Marketplace> createState() => _MarketplaceState();
}
class _MarketplaceState extends State<Marketplace> {
  int? _selectedIndex;

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
            actions: [
              IconButton(
                onPressed: () {},
                icon: FaIcon(FontAwesomeIcons.bell),
              ),
            ],
            title: Text(
              "Tools Marketplace",
              style: TextStyle(fontSize: 20),
            ),
            backgroundColor: Colors.transparent,
            elevation: 0,
          ),
        ),
      ),
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
                leading: FaIcon(FontAwesomeIcons.houseUser),
                title: Text("Dashboard"),
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Dashboard()));
                }
            ),
            ListTile(
                leading: FaIcon(FontAwesomeIcons.magnifyingGlass),
                title: Text("Find Users"),
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => SearchUsers()));
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
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Card(
                      color: Colors.white,
                      shape: OutlineInputBorder(
                        borderSide: BorderSide(color: Colors.transparent),
                        borderRadius: BorderRadius.circular(10)
                      ),
                      child: Row(
                        children: [
                          Expanded(child: Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Text("أدوات البحث",style: TextStyle(fontSize: 18),),
                          )),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: IconButton(onPressed: (){
                              showSearch(context: context, delegate: ToolsSearch());
                            },icon: FaIcon(FontAwesomeIcons.magnifyingGlass),),
                          )
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Padding(
                padding: const EdgeInsets.only(top:16.0),
                child: Card(
                  child: Column(
                    children: [
                      ///children of the 2nd ROw column:
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(left:8.0),
                            child: Text("أضيفت مؤخرا",style: TextStyle(fontSize: 20,fontWeight: FontWeight.bold),),
                          ),
                          TextButton(onPressed: (){},style: ButtonStyle(), child: Text("عرض الكل",style: TextStyle(color: HirafiConstants().hirafi_blue),),)
                        ],
                      ),
                      SizedBox(
                        height: 200, // Set a bounded height for the ListView
                        child: ListView.builder(
                            itemCount: recentTools.length,
                            itemBuilder: (context,index){
                                return Card(
                                  margin: EdgeInsets.all(8),
                                  color: Colors.white,
                                  child: ListTile(
                                    onTap: (){
                                      Navigator.push(context, MaterialPageRoute(builder: (context)=>ToolViewPage()));
                                    },
                                    title: Text(recentTools[index].title),
                                    subtitle: Text(recentTools[index].category),
                                    ///leading: Center(child: Image.network(recentTools[index].image_url ?? "Image Not Found!")),
                                  ),
                                );
                            }
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(top:8.0),
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          spacing: 60,
                          children: [
                            Text(
                              "قوائمي",
                              style: TextStyle(fontSize: 24),
                            ),
                            IconButton(
                              onPressed: (){
                                Navigator.push(context, MaterialPageRoute(builder: (context)=>ItemListing()));
                              },
                              icon: FaIcon(FontAwesomeIcons.circlePlus),
                            )
                          ],
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
            ],
          ),
        ),
      ),
    );
  }
}


class ToolsSearch extends SearchDelegate {
  List<Tool> filteredList = [];
  String searchCriteria = "C";

  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      PopupMenuButton<String>(
        icon: FaIcon(FontAwesomeIcons.sliders),
        onSelected: (value) {
          searchCriteria = value;
        },
        itemBuilder: (BuildContext context) => <PopupMenuEntry<String>>[
          PopupMenuItem<String>(
            value: 'SN',
            child: Text('حسب اسم البائع'),
          ),
          PopupMenuItem<String>(
            value: 'TB',
            child: Text('بواسطة العلامة التجارية للأداة'),
          ),
          PopupMenuItem<String>(
            value: 'C',
            child: Text('حسب الفئة'),
          ),
        ],
      ),
    ];
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return IconButton(
      onPressed: () {
        close(context, "");
      },
      icon: Icon(Icons.arrow_back),
    );
  }

  @override
  Widget buildResults(BuildContext context) {
    switch(searchCriteria){
      case "SN":
        ///based on seller name.
        break;
      case "TB":
        ///handle logic to retrieve list of tools based on brand.
        break;
      case "C":
        ///based on category .
        break;
    }

    return Center(child: Text("data"),);
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Container();
  }
}
