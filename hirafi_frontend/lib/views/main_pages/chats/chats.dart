import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

import '../dashboards/dashboard_craftsman.dart';
import '../marketplace/marketplace.dart';
import '../searchUsers/search_users.dart';

class Chats extends StatefulWidget {
  const Chats({super.key});

  @override
  State<Chats> createState() => _ChatsState();
}

class _ChatsState extends State<Chats> {
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
              IconButton(onPressed: ()=>(){}, icon: FaIcon(FontAwesomeIcons.bell))
            ],
            title: Text("Active Chats",style: TextStyle(fontSize: 20),),
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
                leading: FaIcon(FontAwesomeIcons.cartShopping),
                title: Text("Marketplace"),
                onTap: (){
                  Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Marketplace()));
                }
            ),
          ],
        ),
      ),
    );
  }
}
