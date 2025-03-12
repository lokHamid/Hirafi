import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:hirafi_frontend/viewmodels/authenticationViewModel.dart';
import 'package:hirafi_frontend/views/auth/signup.dart';
import '../../models/constants.dart';
import '../../providers/providers.dart';
import '../main_pages/dashboards/dashboard_craftsman.dart';


class Login extends ConsumerWidget {
  Login({super.key});

  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  void _signIn(BuildContext context, WidgetRef ref) async {
    final avm = AuthenticationViewModel(ref.read(firebaseAuthServiceProvider), ref);
    String email = emailController.text.trim();
    String password = passwordController.text.trim();

    // Basic input validation
    if (email.isEmpty || password.isEmpty) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("please fill in all the fields!")),
      );
      return;
    }

    RegExp regex = RegExp(emailPatternRegEx);
    if(!regex.hasMatch(email)){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Invalid Email!")),
      );
      return;
    }
    regex = RegExp(passwordPatternRegEx);
    if(!regex.hasMatch(password)){
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("password must contain atleast 8 letter and 1 number!")),
      );
      return;
    }

    try {
      await avm.signInWithEmailAndPassword(email: email,password: password);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Logged in Successfully")),
      );
      Navigator.pushAndRemoveUntil(
          context,
          MaterialPageRoute(builder: (context)=>Dashboard()),
          (route) => false
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text("Login Failed: $e")),
      );
    }
  }

  void _signInWithGoogle(BuildContext context,WidgetRef ref) async {
    final avm = AuthenticationViewModel(ref.read(firebaseAuthServiceProvider), ref);

    try {
      await avm.signInWithGoogle();
      Navigator.pushAndRemoveUntil (
          context,
          MaterialPageRoute(builder: (context)=>Dashboard()),
              (route) => false
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(e.toString())));
    }
  }

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final obscureText = ref.watch(obscureTextProvider);
    final isLoading = ref.watch(isLoadingAuthFlag);

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
            ],
          ),
        ),
        child: SingleChildScrollView(
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Align(
                      alignment: Alignment.center,
                      child: Padding(
                        padding: EdgeInsets.only(top: 70),
                        child: Text(
                          "Hirafi",
                          style: TextStyle(fontSize: 50, fontWeight: FontWeight.w700, color: Colors.white),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(15),
                    child: Container(
                      width: 300,
                      decoration: BoxDecoration(
                        color: Color(0xFFf5f5f5),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Align(
                              alignment: Alignment.topCenter,
                              child: Text(
                                "Login",
                                style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20, right: 16, left: 16),
                            child: TextField(
                              controller: emailController,
                              style: TextStyle(color: Colors.black, fontSize: 14),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Color(0xFFFFFFFF),
                                hintText: "Email",
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.transparent),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue.shade400, width: 2.0),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                              ),
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(top: 20, bottom: 10, left: 16, right: 16),
                            child: TextField(
                              controller: passwordController,
                              obscureText: obscureText,
                              style: TextStyle(color: Colors.black, fontSize: 14),
                              decoration: InputDecoration(
                                filled: true,
                                fillColor: Color(0xFFFFFFFF),
                                hintText: "Password",
                                enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.transparent),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(color: Colors.blue.shade400, width: 2.0),
                                  borderRadius: BorderRadius.circular(10),
                                ),
                                suffixIcon: IconButton(
                                  icon: Icon(
                                    obscureText ? Icons.visibility_off : Icons.visibility,
                                  ),
                                  onPressed: () {
                                    ref.read(obscureTextProvider.notifier).state = !obscureText;
                                  },
                                ),
                              ),
                              inputFormatters: [
                                BlockPasteFormatter()
                              ],
                            ),
                          ),

                          /// Login button
                          isLoading? CircularProgressIndicator(color: HirafiConstants().hirafi_blue,) : Padding(
                            padding: EdgeInsets.only(bottom: 8, left: 16, right: 16),
                            child: ElevatedButton(
                              onPressed: () => _signIn(context,ref),
                              style: ElevatedButton.styleFrom(
                                backgroundColor: HirafiConstants().hirafi_blue,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: BorderSide(color: Colors.transparent),
                                ),
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Text(
                                    "Login",
                                    style: TextStyle(color: Colors.white, fontSize: 14),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          /// Continue with Google button
                          Padding(
                            padding: EdgeInsets.only(bottom: 8, left: 16, right: 16),
                            child: ElevatedButton(
                              onPressed: () => _signInWithGoogle(context,ref),

                              style: ElevatedButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  side: BorderSide(width: 1.5, color: Colors.black),
                                ),
                                backgroundColor: Colors.transparent,
                                shadowColor: Colors.transparent,
                                foregroundColor: Colors.transparent,
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  FaIcon(FontAwesomeIcons.google, color: Colors.black),
                                  SizedBox(width: 10),
                                  Text(
                                    "Continue with Google",
                                    style: TextStyle(color: Colors.black),
                                  ),
                                ],
                              ),
                            ),
                          ),

                          /// Navigate to sign-up page
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text("Don't have an account?", style: TextStyle(fontSize: 12)),
                              TextButton(
                                onPressed: () {
                                  Navigator.push(
                                    context,
                                    MaterialPageRoute(builder: (context) => Signup()),
                                  );
                                },
                                child: Text(
                                  'Sign up',
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
                  )
                ],
              )
            ],
          ),
        ),
      ),
    );
  }

}

class BlockPasteFormatter extends TextInputFormatter {
  @override
  TextEditingValue formatEditUpdate(
      TextEditingValue oldValue,
      TextEditingValue newValue,
      ) {
    // If the new value is different from the old value and the change is due to pasting, block it
    if (newValue.text != oldValue.text && newValue.text.length > oldValue.text.length + 1) {
      return oldValue; // Revert to the old value
    }
    return newValue;
  }
}
