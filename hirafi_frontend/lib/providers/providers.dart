import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hirafi_frontend/services/clients_service.dart';
import 'package:hirafi_frontend/services/tools_service.dart';
import 'package:hirafi_frontend/viewmodels/authenticationViewModel.dart';
import '../models/client.dart';
import '../services/firebase_auth_service.dart';


///Auth Providers:
///firebase service Provider:
final firebaseAuthServiceProvider = Provider<FirebaseAuthService>((ref) {
  return FirebaseAuthService();
});
final clientServiceProvider = Provider<ClientService>((ref) {
  return ClientService();
});
final toolsServiceProvider = Provider<ToolsService>((ref){
  return ToolsService();
});

///Viewmodel
final isLoadingAuthFlag = StateProvider<bool>((ref) => false);
final obscureTextProvider = StateProvider<bool>((ref)=>false);

///location bool flag:
final isLoadingLocationProvider = StateProvider<bool>((ref)=>false);
///location display String:
final locationDisplayStringProvider = StateProvider<String?>((ref)=>null);

///Model:
final currentUserProvider = StateProvider<Client?>((ref) => null);

