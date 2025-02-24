import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hirafi_frontend/viewmodels/authenticationViewModel.dart';

import '../../models/client.dart';
import '../../models/constants.dart';
import '../../providers/providers.dart';
import 'login.dart';



const String EMAIL_ERROR_MESSAGE = "البريد الإلكتروني غير صالح!";
const String PASSWORD_ERROR_MESSAGE = "يجب أن تحتوي كلمة المرور على 8 أحرف ورقم واحد على الأقل!";
const String FULLNAME_ERROR_MESSAGE = "الاسم الكامل غير صالح!فقط الحروف الصغيرة مسموح بها";
const String PASSWORDS_UNMATCH = "كلمات المرور غير متطابقة!";
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

    void showErrorDialog(BuildContext context, String message) {
      showDialog(
        context: context,
        builder: (context) {
          return AlertDialog(
            title: Text('خطأ'),
            content: Text(message),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context); // Close the dialog
                },
                child: Text('نعم'),
              ),
            ],
          );
        },
      );
    }

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
        Client? result = await avm.signUpWithEmailAndPassword(fullname: fullname, email: email, password: password, location: "");

        ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text("تم التسجيل بنجاح")));
        Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>Login()));
       }catch(e){
        showErrorDialog(context, e.toString());
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
                      child: Text("حرفي"
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
                          child: Align(alignment: Alignment.topCenter,child: Text("اشتراك",style: TextStyle(fontSize: 30,fontWeight: FontWeight.w600),),),
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
                              hintText: "الاسم الكامل",
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
                                hintText: "البريد الإلكتروني",
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
                              hintText: "كلمة المرور",
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
                              hintText: "تأكيد كلمة المرور",
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
                                    "إنشاء حساب",
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
                            TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => Login()),
                                );
                              },
                              child: Text(
                                'تسجيل الدخول',
                                style: TextStyle(
                                  color: Colors.blue,
                                  fontSize: 12,
                                  decoration: TextDecoration.none,
                                ),
                              ),
                            ),
                            Text("هل لديك حساب بالفعل؟",style: TextStyle(fontSize: 12),),
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