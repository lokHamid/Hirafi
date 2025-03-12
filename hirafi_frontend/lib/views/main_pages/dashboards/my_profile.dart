import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:geolocator/geolocator.dart';
import 'package:hirafi_frontend/services/clients_service.dart';
import 'package:hirafi_frontend/widgets/buttons/hirafi_blue_button.dart';
import 'package:permission_handler/permission_handler.dart';
import '../../../models/client.dart';
import '../../../models/constants.dart';
import '../../../models/craftsman.dart';
import '../../../providers/providers.dart';
import '../../auth/login.dart';
import 'package:http/http.dart' as http;

class MyProfile extends ConsumerWidget {
  MyProfile({super.key});

  final TextEditingController experienceController = TextEditingController();
  final TextEditingController specialityController = TextEditingController();
  final TextEditingController aboutController = TextEditingController();
  
  @override
  Widget build(BuildContext context,WidgetRef ref) {

    /// provider data:
    final isLoadingLocation = ref.watch(isLoadingLocationProvider);
    final isLoading = ref.watch(isLoadingAuthFlag);
    final currentUser = ref.watch(currentUserProvider);
    final ClientService clientService = ref.read(clientServiceProvider);
    final locationString = ref.watch(locationDisplayStringProvider);

    setCurrentLocationString(currentUser,context,ref);
    /// ui parameters:
    final bool isCraftsman = currentUser is Craftsman;
    final int maxExpYears = 50;

    /// used for discarding and checking changes in parameters:

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
              title: Text("My Profile"),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
          )
      ),
      body: isLoading? Center(child:CircularProgressIndicator(color: HirafiConstants().hirafi_blue,)) : SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Card(
                child: Column(
                  children: [
                    ///name placeholder:
                    Padding(
                      padding: const EdgeInsets.only(top:8.0,left:8.0),
                      child: Row(
                        children: [
                          Text(currentUser?.fullName ?? "No Name",style: TextStyle(fontSize: 20),),
                        ],
                      ),
                    ),
                    isCraftsman? GestureDetector(
                      /// user already registered craftsman info , ability to modify is below:
                      /// modifying speciality, on Tap , he can set his speciality ( can discard changes )
                      onTap: (){
                        specialityController.text = currentUser.speciality;
                        showModalBottomSheet(
                          isScrollControlled: true,
                          context: context,
                          builder: (BuildContext context){
                            return SingleChildScrollView(
                                padding: EdgeInsets.only(
                                  bottom: MediaQuery.of(context).viewInsets.bottom, // Adjust for keyboard
                                ),
                              child: Container(
                                padding: EdgeInsets.all(16),
                                child: Column(
                                  children: [
                                    TextField(
                                      cursorColor: HirafiConstants().hirafi_blue,controller: specialityController,
                                      decoration: InputDecoration(labelText: "Speciality"),
                                    ),
                                    SizedBox(height: 20,),
                                    HirafiButton(
                                      text: "Save",
                                      onPressed: (){
                                        currentUser.speciality = specialityController.text.trim();
                                        Navigator.pop(context);
                                      },
                                      backgroundColor: HirafiConstants().hirafi_blue,
                                    )
                                  ],
                                ),
                              ),
                            );
                          });
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top:10.0,left:8.0),
                        child: Row(
                          children: [
                            Text(currentUser.speciality,style: TextStyle(fontSize: 16),),
                          ],
                        ),
                      ),
                    ) : Container(),
                    /// location card for both clients and craftsmen.
                    isLoadingLocation? CircularProgressIndicator() : Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              FaIcon(FontAwesomeIcons.locationDot,size: 20,),
                              SizedBox(width: 10,),
                              Text(locationString ?? "Location Not Set",style: TextStyle(fontSize: 16),),
                            ],
                          ),
                          HirafiButton(onPressed: () => getUserLocation(context,ref),text: "Set",)
                        ],
                      ),
                    ),

                    isCraftsman? Divider() : Container(), ///just for UI Enhancments.

                    isCraftsman? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          GestureDetector(
                            onTap: (){///ability to modify experience:
                              experienceController.text = currentUser.experience;
                              showModalBottomSheet(context: context, builder: (context){
                                return SingleChildScrollView(
                                  padding: EdgeInsets.only(
                                    bottom: MediaQuery.of(context).viewInsets.bottom, ///for keyboard
                                  ),
                                  child: Container(
                                    padding: EdgeInsets.all(16),
                                    child: Column(
                                      children: [
                                        TextField(
                                            controller: experienceController,
                                            keyboardType: TextInputType.number, // For numbers with decimals
                                            inputFormatters: [
                                              FilteringTextInputFormatter.digitsOnly // Allows positive double values
                                            ],
                                            decoration: InputDecoration(
                                                label: Text("Years Of Experience")
                                            ),
                                            onChanged: (value) {
                                              if (value.isNotEmpty) {
                                                int? enteredValue = int.tryParse(value);
                                                if (enteredValue != null && enteredValue > maxExpYears) {
                                                  // If the entered value exceeds the maxValue, reset it
                                                  experienceController.text = maxExpYears.toString();
                                                  experienceController.selection = TextSelection.collapsed(offset: experienceController.text.length);
                                                }
                                              }
                                            }
                                        ),
                                        SizedBox(height: 20,),
                                        HirafiButton(
                                          text: "Save",
                                          onPressed: (){
                                            currentUser.experience = experienceController.text.trim();
                                            Navigator.pop(context);
                                          },
                                          backgroundColor: HirafiConstants().hirafi_blue,
                                        )
                                      ],
                                    ),
                                  ),
                                );
                              });
                            },
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text("${currentUser.experience}+",style: TextStyle(color: HirafiConstants().hirafi_blue,fontSize: 20),),
                                Text("Years Of Experience")
                              ],
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(currentUser.rating.toString(),style: TextStyle(color: HirafiConstants().hirafi_blue,fontSize: 20),),
                              Text("Average Rating")
                            ],
                          ),
                        ],
                      ),
                    ) : Container(),
                  ],
                ),
              ),
            ),
            isCraftsman? Padding(
              padding: const EdgeInsets.all(8.0),
              child: GestureDetector(
                onTap: (){
                  aboutController.text = currentUser.about;
                  showModalBottomSheet(context: context, builder: (context){
                    return SingleChildScrollView(
                      padding: EdgeInsets.only(
                        bottom: MediaQuery.of(context).viewInsets.bottom, // Adjust for keyboard
                      ),
                      child: Container(
                        padding: EdgeInsets.all(16),
                        child: Column(
                          children: [
                            TextField(
                              maxLines: 5,
                              minLines: 1,
                              maxLength: 1000,
                              controller: aboutController,
                              decoration: InputDecoration(
                                  label: Text("About Me")
                              ),
                            ),
                            SizedBox(height: 16.0),
                            ///button to save craftsman info.
                            HirafiButton(text: "Save", onPressed: () {
                              currentUser.about = aboutController.text.trim();
                            }),
                          ],
                        ),
                      ),
                    );
                  });
                },
                child: Card(
                  child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text("About Me",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
                        ],
                      ),
                      Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(currentUser.about,style: TextStyle(fontSize: 16),),
                      )
                    ],
                  ),
                ),
              ),
            ) : Container(),

            ///If the user Is Not A Craftsman show a button for adding craftsman info ( and upgrade himself as a client to a craftsman)
            isCraftsman? Container() : HirafiButton(text: "Add Craftsman Info", onPressed: (){
              showModalBottomSheet(
                isScrollControlled: true,
                context: context,
                builder: (BuildContext context) {
                  return SingleChildScrollView(
                    padding: EdgeInsets.only(
                      bottom: MediaQuery.of(context).viewInsets.bottom, // Adjust for keyboard
                    ),
                    child: Container(
                      padding: EdgeInsets.all(16.0),
                      child: Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text('Enter your details:'),
                          TextField(cursorColor: HirafiConstants().hirafi_blue,controller: specialityController,
                            decoration: InputDecoration(labelText: 'Speciality'),
                          ),
                          TextField(
                              controller: experienceController,
                              keyboardType: TextInputType.number, // For numbers with decimals
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly // Allows positive double values
                              ],
                              decoration: InputDecoration(
                                  label: Text("Years Of Experience")
                              ),
                              onChanged: (value) {
                                if (value.isNotEmpty) {
                                  int? enteredValue = int.tryParse(value);
                                  if (enteredValue != null && enteredValue > maxExpYears) {
                                    // If the entered value exceeds the maxValue, reset it
                                    experienceController.text = maxExpYears.toString();
                                    experienceController.selection = TextSelection.collapsed(offset: experienceController.text.length);
                                  }
                                }
                              }
                          ),
                          TextField(
                            maxLines: 5,
                            minLines: 1,
                            maxLength: 1000,
                            controller: aboutController,
                            decoration: InputDecoration(
                                label: Text("About You")
                            ),
                          ),
                          SizedBox(height: 16.0),
                          ///button to save craftsman info.
                          HirafiButton(text: "Save", onPressed: () async{
                            Navigator.pop(context);
                            await _validateCrafmanInfo(context,clientService,currentUser,ref);
                          }),
                        ],
                      ),
                    ),
                  );
                },
              );
            }),
            HirafiButton(text: "Save Changes", onPressed: (){}),
            HirafiButton(text: "Log Out", onPressed: () =>_logOut(context,ref),backgroundColor: Colors.red,)
          ],
        ),
      ),
    );
  }

  void _logOut(BuildContext context,WidgetRef ref) async{
    final auth = ref.read(firebaseAuthServiceProvider);
    ref.read(isLoadingAuthFlag.notifier).state = true;
    try{
      await auth.signOut();
      /// sign out was successful, clear the currentUser state:
      ref.read(currentUserProvider.notifier).state = null;
      ref.read(isLoadingAuthFlag.notifier).state = false;
      Navigator.pushAndRemoveUntil(context, MaterialPageRoute(builder: (context)=>Login()),(route) => false);
    }catch(e){
      ref.read(isLoadingAuthFlag.notifier).state = false;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  Future<void> _validateCrafmanInfo(BuildContext context,ClientService service,dynamic currentUser,WidgetRef ref)async{
    try{
      ref.read(isLoadingAuthFlag.notifier).state = true;
      //lock everything up to avoid mess ups.
      String speciality = specialityController.text.trim();
      String experience = experienceController.text.toString().trim();
      String about = aboutController.text.trim();
      double rating = 0;


      if(speciality.isEmpty || experience.isEmpty || about.isEmpty){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Please Fill in All The Fields!")));
        return;
      }
      ///gotta handle text here ( empty , invalid , incorrect ) whatever.
      Craftsman craftsman = Craftsman.fromClient(client: currentUser,
          speciality: speciality,
          experience: experience,
          about: about,
          rating: rating
      );

      ///update the current user to be a craftsman , now this should work!!!!
      ref.read(currentUserProvider.notifier).state = craftsman;
      await service.saveClientInfo(client: craftsman);

      ref.read(isLoadingAuthFlag.notifier).state = false;
    }catch(e){
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("An Error Occurred : $e")));
    }
  }



  /// method to fetch location:
  Future<void> getUserLocation(BuildContext context,WidgetRef ref) async {

    // block any concurrent requests by using the isLoadingLocation flag:
    ref.read(isLoadingLocationProvider.notifier).state = true;
    // Check and request location permission
    var status = await Permission.location.request();
    try {
      if (!status.isGranted) {
        /// location is null because user disallowed it:
        ref.read(currentUserProvider.notifier).state?.location = null;
        throw Exception("An Error Occurred! Permissions for getting location denied!");
      }


      Position position = await Geolocator.getCurrentPosition(
        locationSettings: LocationSettings(accuracy: LocationAccuracy.best,timeLimit: Duration(seconds: 20)),
      );

      GeoPoint point = GeoPoint(position.altitude, position.longitude);
      ref.read(currentUserProvider.notifier).state?.location = point;
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Fetched Location Successfully!")));
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error: $e")));
    } finally {
      ref.read(isLoadingLocationProvider.notifier).state = false;
    }
  }

  Future<void> _fetchLocationInfo(double latitude, double longitude,BuildContext context,WidgetRef ref) async {
    ref.read(isLoadingLocationProvider.notifier).state = true;

    try {
      final url = Uri.parse(
          'https://nominatim.openstreetmap.org/reverse?format=json&lat=$latitude&lon=$longitude');
      final response = await http.get(url);

      if (response.statusCode == 200) {
        final data = json.decode(response.body);
        final address = data['address'];

        /// extract the location from the address.
        ref.read(locationDisplayStringProvider.notifier).state = "${address['city']}, ${address['country']}";
      } else {
        ref.read(locationDisplayStringProvider.notifier).state = null;
        throw Exception("Failed to fetch location information.make sure you are connected to a network!");
      }
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Error: $e")));
    } finally {
      ref.read(isLoadingLocationProvider.notifier).state = false;
    }
  }

  void setCurrentLocationString(Client? currentUser,BuildContext context,WidgetRef ref)async{
    if(currentUser == null){
      return;
    }

    if(currentUser.location == null){
      ref.read(locationDisplayStringProvider.notifier).state = null;
    }else{
      await _fetchLocationInfo(currentUser.location!.latitude, currentUser.location!.longitude, context, ref);
    }
  }
}
