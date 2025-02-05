import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
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
                IconButton(onPressed: ()=>(){}, icon: FaIcon(FontAwesomeIcons.circleUser))
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
            ListTile(
              leading: FaIcon(FontAwesomeIcons.magnifyingGlass),
              title: Text("Find Users"),
                onTap: (){
                  ///redirect to respective page: findUsers
                }
            ),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.cartShopping),
              title: Text("Marketplace"),
                onTap: (){
                  ///redirect to respective page: Marketplace
                }
            ),
            ListTile(
              leading: FaIcon(FontAwesomeIcons.comment),
              title: Text("Active Chats"),
              onTap: (){
                ///redirect to respective page: Chats
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
                            Text(
                              "Location Placeholder",
                              style: TextStyle(fontSize: 24),
                            ),
                            Text(
                              "Current Set Location",
                              style: TextStyle(fontSize: 16),
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
                              "Review Placeholder",
                              style: TextStyle(fontSize: 24),
                            ),
                            Text(
                              "My Rating",
                              style: TextStyle(fontSize: 16),
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
                        "My Listings:",
                        style: TextStyle(fontSize: 16),
                      ),
                      SizedBox(height: 10), // Space before list

                      ///  LISTVIEW MARKETPLACE
                      SizedBox(
                        height: 200, // Set height to avoid infinite constraints
                        child: ListView.builder(
                          itemCount: 5, // Number of items in the marketplace
                          itemBuilder: (context, index) {
                            return Card(
                              margin: EdgeInsets.symmetric(vertical: 5),
                              child: ListTile(
                                leading: Icon(Icons.shopping_bag), // Example icon
                                title: Text("Item ${index + 1}"),
                                subtitle: Text("Item description here"),
                                trailing: Icon(Icons.arrow_forward_ios),
                                onTap: () {
                                  // Handle item click
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
    );
  }
}
