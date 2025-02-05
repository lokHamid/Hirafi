import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hirafi_frontend/views/auth/signup.dart';
class Login extends StatefulWidget {
  const Login({super.key, required this.title});
  final String title;

  @override
  State<Login> createState() => _LoginState();
}

class _LoginState extends State<Login> {
  bool obscureText = true;

  @override
  Widget build(BuildContext context) {

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Color(0xFFb0c4de),
                  Color(0xFFafeeee)
                ]
            )
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [Row(
              children:
              [Expanded(
                child: Align(
                  alignment: Alignment.center,
                  child: Padding(
                    padding: EdgeInsets.only(top:70),
                    child: Text("Hirafi"
                      ,style: TextStyle(fontSize: 50,fontWeight: FontWeight.w700,color: Colors.white),
                    ),
                  ),
                ),
              )],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [Padding(
                padding: const EdgeInsets.all(15),
                child: Container(
                    width: 300,
                    decoration: BoxDecoration(color: Color(0xFFf5f5f5),borderRadius: BorderRadius.circular(10),),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Align(alignment: Alignment.topCenter,child: Text("Log in",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),),),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:20,right: 16,left: 16),
                          child: TextField(
                            style: TextStyle(color: Colors.black,fontSize: 14),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xFFFFFFFF),//white
                              hintText: "Email , Phone Number",
                                enabledBorder: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10),
                                    borderSide: BorderSide(color: Colors.transparent),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue.shade400, width: 2.0), // Border when focused
                                  borderRadius: BorderRadius.circular(10),
                                )
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:20,bottom: 10,left: 16,right: 16),
                          child: TextField(
                            obscureText: obscureText,
                            style: TextStyle(color: Colors.black,fontSize: 14),
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Color(0xFFFFFFFF),
                                focusColor: Colors.transparent,
                                hintText: "Password",
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.transparent),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue.shade400,width: 2.0),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    obscureText ? Icons.visibility_off : Icons.visibility, // Eye icon toggle
                                  ),
                                  onPressed: () {
                                    setState(() {
                                      obscureText = !obscureText; // Toggle visibility
                                    });
                                  },
                                ),
                            ),
                          ),
                        ),

                        /// login button here :
                        Padding(
                          padding: EdgeInsets.only(bottom: 8,left: 16,right: 16),
                          child: ElevatedButton(
                                onPressed: () =>(){},
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: Color(0xFFb0c4de),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      side: BorderSide(color: Colors.transparent)// Adjust the radius here
                                  )
                                ),
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Text(
                                        "Log in",
                                        style: TextStyle(color: Colors.white,fontSize: 14),
                                    ),
                                  ],
                                )
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(bottom:8.0),
                          child: Text("Or Sign up with",style: TextStyle(fontSize: 12),),
                        ),

                        //continue with google button here:
                        Padding(
                          padding: EdgeInsets.only(bottom: 8,left: 16,right: 16),
                          child: ElevatedButton(
                              onPressed: () =>(){},

                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: BorderSide(width: 1.5 ,color: Colors.black)// Adjust the radius here
                                ),
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                                foregroundColor: Colors.transparent,

                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FaIcon(FontAwesomeIcons.google,color: Colors.black),
                                  SizedBox(width: 10),
                                  Text("Continue with Google",
                                    style: TextStyle(
                                      color: Colors.black,
                                    ),
                                  )
                                ],
                              )
                          ),
                        ),
                        //to navigate to the sign up page:
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Don't Have An Account?",style: TextStyle(fontSize: 12),),
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Signup(title: "",)),
                                );
                              },
                              child: Text(
                                'Sign Up',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 12,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            )
                          ],
                        )
                      ],
                    ),
                ),
              )],
            )],
          ),
        ),
      ),
    );
  }
}