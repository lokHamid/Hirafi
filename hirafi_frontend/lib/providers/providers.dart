import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hirafi_frontend/viewmodels/authenticationViewModel.dart';
import '../services/firebase_auth_service.dart';


///Auth Providers:
///firebase service Provider:
final firebaseAuthServiceProvider = Provider<FirebaseAuthService>((ref) {
  return FirebaseAuthService();
});

///Viewmodel
final isLoadingAuthFlag = StateProvider<bool>((ref) => false);
final obscureTextProvider = StateProvider<bool>((ref)=>false);

