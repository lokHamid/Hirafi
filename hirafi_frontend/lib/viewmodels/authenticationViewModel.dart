import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hirafi_frontend/providers/providers.dart';
import 'package:hirafi_frontend/services/clients_service.dart';
import 'package:hirafi_frontend/services/firebase_auth_service.dart';

import '../models/client.dart';

class AuthenticationViewModel {
  WidgetRef ref;
  final FirebaseAuthService _authService;
  final ClientService _clientService = ClientService();

  AuthenticationViewModel(this._authService,this.ref);

  Future<void> signUpWithEmailAndPassword({required String fullname, required String email, required String password, required String location,
  })async{
    _setIsLoading(true);

    try{
      UserCredential creds = await _authService.signUpWithEmailAndPassword(fullname: fullname, email: email, password: password, location: location);

      Client newUser = Client.fromMap({
        fullname: fullname,
        email: email,
        location: location
      });
      //save the user first time he signed up.
      _clientService.saveClientInfo(client: newUser, uid: creds.user!.uid);
      _setIsLoading(false);
    }catch(e){
      _setIsLoading(false);
      rethrow;
    }
  }

  Future<void> signInWithEmailAndPassword({required String email,required String password})async{
    _setIsLoading(true);
    try{

      UserCredential creds = await _authService.signInWithEmailAndPassword(email: email, password: password);
      Map<String,dynamic> map = await _clientService.fetchClientById(creds.user!.uid) ?? <String,dynamic>{};
      Client loggedUser = Client.fromMap(map);
      _setCurrentLoggedInUser(loggedUser);

      _setIsLoading(false);
    }catch(e){
      _setIsLoading(false);
      rethrow;
    }
  }

  Future<void> signInWithGoogle()async{
    _setIsLoading(true);

    try{
      UserCredential creds = await _authService.signInWithGoogle();
      User? user = creds.user;
      Client currentLogged = Client(fullName: user?.displayName ?? "Anonymous user", email: user?.email?? "Anonymous user", location: "");

      Map<String,dynamic>? mapPlaceholder = await _clientService.fetchClientById(user!.uid);
      if(mapPlaceholder == null){
        ///user signed up for the first time, save his info:
        _clientService.saveClientInfo(client: currentLogged, uid: user.uid);
      }
      ///log him anyways (whether he's signing up for the first time or he's just signing in.)
      _setCurrentLoggedInUser(currentLogged);
      _setIsLoading(false);
    }catch(e){
      _setIsLoading(false);
      rethrow;
    }
  }

  Future<void> logOut()async{
    try{
      await _authService.signOut();
      _clearCurrentLoggedInUser();
    }catch(e){
      rethrow;
    }
  }

  void _setIsLoading(bool flag){
    ref.read(isLoadingAuthFlag.notifier).state = flag;
  }

  void _setCurrentLoggedInUser(Client client){
    ref.read(currentUserProvider.notifier).state = client;
  }

  void _clearCurrentLoggedInUser(){
    ref.read(currentUserProvider.notifier).state = null;
  }

}