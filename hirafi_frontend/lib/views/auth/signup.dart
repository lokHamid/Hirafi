import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hirafi_frontend/viewmodels/authenticationViewModel.dart';

import '../../models/client.dart';
import '../../models/constants.dart';
import '../../providers/providers.dart';
import 'login.dart';



const String EMAIL_ERROR_MESSAGE = "Invalid Email!";
const String PASSWORD_ERROR_MESSAGE = "Password must contain atleast 8 letters and 1 number!";
const String FULLNAME_ERROR_MESSAGE = "Invalid full name! only lowercase letters are permissible";
const String PASSWORDS_UNMATCH = "Passwords Do Not Match!";
const String emailPatternRegEx =
    r'^[a-zA-Z0-9._%+-]+@[a-zA-Z0-9.-]+\.[a-zA-Z]{2,}$';
const String passwordPatternRegEx = r'^(?=.*[A-Za-z])(?=.*\d)[A-Za-z\d]{8,}$';
const String fullnamePatternRegEx = r'^[A-Za-z]+(?: [A-Za-z]+)?$';

class Signup extends ConsumerWidget {
  Signup({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController confirmPasswordController = TextEditingController();
  final TextEditingController fullnameController = TextEditingController();

  @override
  Widget build(BuildContext context , WidgetRef ref) {
    final obsucreText = ref.watch(obscureTextProvider);
    final avm = AuthenticationViewModel(ref.read(firebaseAuthServiceProvider), ref);
    final isLoading = ref.watch(isLoadingAuthFlag);


    void validateInfo() async{
      String fullname = fullnameController.text.trim();
      String email = emailController.text.trim();
      String password = passwordController.text.trim();
      String confirmPass = confirmPasswordController.text.trim();


      RegExp fullnameRegex = RegExp(fullnamePatternRegEx);
      if(!fullnameRegex.hasMatch(fullname)){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(FULLNAME_ERROR_MESSAGE)));
        return;
      }

      RegExp emailRegex = RegExp(emailPatternRegEx);
      if(!emailRegex.hasMatch(email)){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(EMAIL_ERROR_MESSAGE)));
        return;
      }

      RegExp passRegex = RegExp(passwordPatternRegEx);
      if(!passRegex.hasMatch(password)){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(PASSWORD_ERROR_MESSAGE)));
        return;
      }
      if(password != confirmPass){
        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(PASSWORDS_UNMATCH)));
        return;
      }

       try{
        await avm.signUpWithEmailAndPassword(fullname: fullname, email: email, password: password, location: null);

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("Signed Up Successfully")));
        Navigator.pushAndRemoveUntil(
            context,
            MaterialPageRoute(builder: (context)=>Login()),
                (route) => false
        );
       }catch(e){
         ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
       }
    }

    return Scaffold(
      body: Container(
        height: double.infinity,
        width: double.infinity,
        decoration: BoxDecoration(
          gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: [
                HirafiConstants().hirafi_blue,
                Color(0xFFafeeee)
              ])
        ),
        child: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Row(
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
                          child: Align(alignment: Alignment.topCenter,child: Text("Sign up",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),),),
                        ),

                        Padding(
                          padding: const EdgeInsets.only(top: 10,left: 16,right: 16),
                          child: TextField(
                            controller: fullnameController,
                            style: TextStyle(color: Colors.black,fontSize: 14),
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xFFFFFFFF),
                              focusColor: Colors.transparent,
                              hintText: "Full Name",
                              enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(color: Colors.transparent),
                              ),
                              focusedBorder: OutlineInputBorder(
                                borderSide: BorderSide(color: Colors.blue.shade400,width: 2.0),
                                borderRadius: BorderRadius.circular(10),
                              ),
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top:20,right: 16,left: 16),
                          child: TextField(
                            controller: emailController,
                            style: TextStyle(color: Colors.black,fontSize: 14),
                            decoration: InputDecoration(
                                filled: true,
                                fillColor: Color(0xFFFFFFFF),//white
                                hintText: "Email",
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
                            obscureText: obsucreText,
                            controller: passwordController,
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
                                  obsucreText ? Icons.visibility_off : Icons.visibility, // Eye icon toggle
                                ),
                                onPressed: () {
                                  ref.read(obscureTextProvider.notifier).state = !ref.read(obscureTextProvider.notifier).state;
                                },
                              ),
                            ),
                            inputFormatters: [
                              BlockPasteFormatter()
                            ],
                          ),
                        ),
                        ///confirm pass:
                        Padding(
                          padding: const EdgeInsets.only(top: 10,bottom: 10,left: 16,right: 16),
                          child: TextField(
                            obscureText: obsucreText,
                            style: TextStyle(color: Colors.black,fontSize: 14),
                            controller: confirmPasswordController,
                            decoration: InputDecoration(
                              filled: true,
                              fillColor: Color(0xFFFFFFFF),
                              focusColor: Colors.transparent,
                              hintText: "Confirm Password",
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
                                  obsucreText ? Icons.visibility_off : Icons.visibility, // Eye icon toggle
                                ),
                                onPressed: () {
                                  ref.read(obscureTextProvider.notifier).state = !ref.read(obscureTextProvider.notifier).state;
                                },
                              ),
                            ),
                          ),
                        ),

                        /// signup button here :
                        isLoading? CircularProgressIndicator(color: HirafiConstants().hirafi_blue,) : Padding(
                          padding: EdgeInsets.only(bottom: 8,left: 16,right: 16),
                          child: ElevatedButton(
                              onPressed: () => validateInfo(),
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
                                    "Sign up",
                                    style: TextStyle(color: Colors.white,fontSize: 14),
                                  ),
                                ],
                              )
                          ),
                        ),

                        //to navigate to the sign up page:
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text("Already have an account?",style: TextStyle(fontSize: 12),),
                            TextButton(
                              onPressed: () {
                                Navigator.pushAndRemoveUntil(
                                    context,
                                    MaterialPageRoute(builder: (context)=>Login()),
                                        (route) => false
                                );
                              },
                              child: Text(
                                'Login',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 12,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ),
                          ],
                        )
                      ],
                    ),
                  ),
                )],
              )],
            ///children of col end here.
          ),
        ),
      ),
    );
  }
}


/*
* */