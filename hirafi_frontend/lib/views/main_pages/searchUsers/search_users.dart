import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hirafi_frontend/models/craftsman.dart';
import 'package:hirafi_frontend/views/main_pages/dashboards/dashboard_craftsman.dart';
import 'package:hirafi_frontend/views/main_pages/searchUsers/add_job_offer_view.dart';
import 'package:hirafi_frontend/views/main_pages/searchUsers/craftsman_profile.dart';

import '../chats/chats.dart';
import '../marketplace/marketplace.dart';
import 'job_view_page.dart';


class SearchUsers extends StatefulWidget {
  const SearchUsers({super.key});
  @override
  State<SearchUsers> createState() => _SearchUsersState();
}
class _SearchUsersState extends State<SearchUsers> {

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
                icon: Icon(Icons.search),
                onPressed: () {
                  showSearch(context: context, delegate: UserSearch());
                },
              ),
            ],
            title: Text(
              "البحث عن الحرفيين",
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
                        Text("حرفي",style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.bold),),
                      ],
                    ),
                    Row(
                      children: [
                        Text("سعيد زيتوني",style: TextStyle(color: Colors.white,fontSize: 18)),
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
                title: Text("لوحة القيادة"),
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => Dashboard()));
                }
            ),
            ListTile(
                leading: FaIcon(FontAwesomeIcons.cartShopping),
                title: Text("السوق"),
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Marketplace()));
                }
            ),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.comment),
              title: Text("الدردشات النشطة"),
              onTap: (){
                Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Chats()));
              },
            ),
          ],
        ),
      ),

      body: SingleChildScrollView(
        child: Column(
          children: [
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
                          Text("الحرفيين بالقرب منك",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
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
                          title: Text("سعيد زيتوني"),
                          subtitle: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text("نجار اثاث"),
                              Row(
                                children: [
                                  FaIcon(FontAwesomeIcons.locationDot,size: 14,),
                                  SizedBox(width: 5,),
                                  Text("قسنطينة، الجزائر", style: TextStyle(fontSize: 14, color: Colors.grey)),
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

            ///Open Projects Posted By Clients.
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
                          Text("المشاريع المفتوحة.",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 400,
                      child: ListView.builder(
                          itemCount: 5, /// for now ;_;
                          itemBuilder: (context,i){
                            return Card(
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
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text("إعادة تصميم المطبخ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Expanded(child: Text("بحاجة إلى رسام محترف ونجار أثاث محترف لإعادة تصميم المطبخ",style: TextStyle(fontSize: 14),softWrap: true,)),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          FaIcon(FontAwesomeIcons.locationDot,size: 16,),
                                          SizedBox(width: 10,),
                                          Text("قسنطينة، الجزائر",style: TextStyle(fontSize: 14),),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                    )
                  ],
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text("عروض العمل الخاصة بي",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
                          IconButton(onPressed: (){
                            Navigator.push(context, MaterialPageRoute(builder: (context)=>AddJobOfferView()));
                          }, icon: FaIcon(FontAwesomeIcons.circlePlus))
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 400,
                      child: ListView.builder(
                          itemCount: 5, /// for now ;_;
                          itemBuilder: (context,i){
                            return Card(
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
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Text("إعادة تصميم المطبخ",style: TextStyle(fontSize: 18,fontWeight: FontWeight.bold),),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.start,
                                        children: [
                                          Expanded(child: Text("بحاجة إلى رسام محترف ونجار أثاث محترف لإعادة تصميم المطبخ",style: TextStyle(fontSize: 14),softWrap: true,)),
                                        ],
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Row(
                                        children: [
                                          FaIcon(FontAwesomeIcons.locationDot,size: 16,),
                                          SizedBox(width: 10,),
                                          Text("قسنطينة، الجزائر",style: TextStyle(fontSize: 14),),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            );
                          }),
                    ),
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




class UserSearch extends SearchDelegate{
  String criteria = "name";
  List<String> allResults = ["الحرفي 1" , "الحرفي 2" , "الحرفيون 3"];
  String currentLocation = "";
  String? selectedSection1;
  String? selectedSection2;
  @override
  List<Widget>? buildActions(BuildContext context) {
    return [
      PopupMenuButton<String>(
        icon: Icon(Icons.more_vert),
        onSelected: (value) {
          if (["Name", "Speciality"].contains(value)) {
            // Section 1 (Only one can be selected at a time)
            selectedSection1 = value;
          } else if (value == "Location") {
            // Toggle for Section 2 (Location)
            selectedSection2 = (selectedSection2 == "Location") ? "Default Location" : "Location";
          }
        },
        itemBuilder: (context) => [
          // Section 1
          PopupMenuItem(
            value: "Name",
            child: Row(
              children: [
                Icon(
                  selectedSection1 == "Name" ? Icons.radio_button_checked : Icons.radio_button_unchecked,
                  color: selectedSection1 == "Name" ? Colors.blue : Colors.grey,
                ),
                SizedBox(width: 8),
                Text("اسم"),
              ],
            ),
          ),
          PopupMenuItem(
            value: "Speciality",
            child: Row(
              children: [
                Icon(
                  selectedSection1 == "Speciality" ? Icons.radio_button_checked : Icons.radio_button_unchecked,
                  color: selectedSection1 == "Speciality" ? Colors.blue : Colors.grey,
                ),
                SizedBox(width: 8),
                Text("التخصص"),
              ],
            ),
          ),
          PopupMenuDivider(), // Divider between sections

          PopupMenuItem(
            onTap: (){
              if( selectedSection2 != "Location"){
                _showInputDialog(context);
              }
            },
            value: "Location",
            child: Row(
              children: [
                Icon(
                  selectedSection2 == "Location" ? Icons.check_box : Icons.check_box_outline_blank,
                  color: selectedSection2 == "Location" ? Colors.green : Colors.grey,
                ),
                SizedBox(width: 8),
                Text("موقع"),
              ],
            ),
          ),
        ],
      ),
    ];
  }

  void _showInputDialog(BuildContext context) {
    TextEditingController _controller = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Enter Location:"),
          content: TextField(
            controller: _controller,

            decoration: InputDecoration(
              border: OutlineInputBorder(borderRadius: BorderRadius.circular(10),borderSide: BorderSide(color: Colors.transparent))
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context); // Close dialog
              },
              child: Text("Cancel"),
            ),
            TextButton(
              onPressed: () {
                currentLocation = _controller.text; // Store input value
                Navigator.pop(context);
              },
              child: Text("OK"),
            ),
          ],
        );
      },
    );
  }

  @override
  Widget? buildLeading(BuildContext context) {
    return null;
  }

  @override
  Widget buildResults(BuildContext context) {
    if(query == ""){
      return ListView.builder(
          itemCount: allResults.length,
          itemBuilder: (context , i){
            return ListTile(title: Text(allResults[i]));
          });
    }else{
      List<String> filteredList = [];

      if(criteria == "spec"){
        filteredList = allResults.where((craftsman) => craftsman.contains(query)).toList(); ///where craftsman.specialty.contains(query) will do this later when implementing REALLY
      }else if (criteria == "loc"){
        filteredList = allResults.where((craftsman)=> craftsman.contains(query)).toList(); // by location later.
      }else if (criteria == "name"){
        filteredList = allResults.where((craftsman)=> craftsman.contains(query)).toList(); // by name later.
      }

      if(filteredList.isEmpty){
        return Center(child: Text("No Craftsmen Were Found!",style: TextStyle(fontSize: 24),),);
      }else{
        return ListView.builder(
            itemCount: filteredList.length,
            itemBuilder: (context , i){
              return ListTile(
                  title: Text(filteredList.elementAt(i)),
                  onTap: (){},
              )
              ;});
      }
    }
  }

  @override
  Widget buildSuggestions(BuildContext context) {
    return Text("");
  }

}
