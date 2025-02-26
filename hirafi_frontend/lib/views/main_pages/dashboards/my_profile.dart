import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../../../models/constants.dart';
import '../../../providers/providers.dart';
import '../../auth/login.dart';

class MyProfile extends ConsumerWidget {
  MyProfile({super.key});

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
  
  @override
  Widget build(BuildContext context,WidgetRef ref) {
    final isLoading = ref.watch(isLoadingAuthFlag);

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
              title: Text("ملفي الشخصي"),
              backgroundColor: Colors.transparent,
              elevation: 0,
            ),
          )
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
                          Text("السعيد زيتوني",style: TextStyle(fontSize: 20),),
                        ],
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        ///ability to modify his speciality.
                      },
                      child: Padding(
                        padding: const EdgeInsets.only(top:10.0,left:8.0),
                        child: Row(
                          children: [
                            Text("سباك المياه",style: TextStyle(fontSize: 16),),
                          ],
                        ),
                      ),
                    ),
                    GestureDetector(
                      onTap: (){
                        ///ability to modify Location this is crucial a lokman.
                      },
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                FaIcon(FontAwesomeIcons.locationDot,size: 20,),
                                SizedBox(width: 10,),
                                Text("قسنطينة، الجزائر",style: TextStyle(fontSize: 16),),
                              ],
                            ),
                          ],
                        ),
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
                              Text("15+",style: TextStyle(color: HirafiConstants().hirafi_blue,fontSize: 20),),
                              Text("سنوات الخبرة")
                            ],
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("3.8",style: TextStyle(color: HirafiConstants().hirafi_blue,fontSize: 20),),
                              Text("متوسط التقييم")
                            ],
                          ),
                        ],
                      ),
                    ),
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
                        Text("حولي",style: TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text("حرفي محترف للغاية.",style: TextStyle(fontSize: 16),),
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
                        onPressed: (){
                        },
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
                              "حفظ التغييرات",
                              style: TextStyle(color: Colors.white,fontSize: 14),
                            ),
                          ],
                        )
                    ),
                  ),
                ),
              ],
            ),
            isLoading? CircularProgressIndicator(color: HirafiConstants().hirafi_blue,) :
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: ElevatedButton(
                        onPressed: () => _logOut(context,ref),
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.redAccent,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(10),
                                side: BorderSide(color: Colors.transparent)// Adjust the radius here
                            )
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "تسجيل الخروج",
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
