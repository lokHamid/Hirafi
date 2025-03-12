import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hirafi_frontend/providers/providers.dart';
import 'package:hirafi_frontend/services/clients_service.dart';
import 'package:hirafi_frontend/services/firebase_auth_service.dart';

import '../models/client.dart';
import '../models/craftsman.dart';

class AuthenticationViewModel {
  WidgetRef ref;
  final FirebaseAuthService _authService;
  final ClientService _clientService = ClientService();

  AuthenticationViewModel(this._authService,this.ref);


  Future<void> signUpWithEmailAndPassword({required String fullname, required String email, required String password, required String? location,
  })async{
    _setIsLoading(true);
    try{
      UserCredential creds = await _authService.signUpWithEmailAndPassword(email: email, password: password);

      Client newUser = Client.fromMap({
        'fullName': fullname,
        'email': email,
        'location': location,
        'uid': creds.user!.uid,
      });
      //save the user first time he signed up.
      _clientService.saveClientInfo(client: newUser);
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
      Map<String,dynamic> map = await _clientService.fetchUserById(creds.user!.uid) ?? <String,dynamic>{};
      dynamic loggedUser;

      if(map.containsKey("speciality")){
        ///user is craftsman , set the current user as a craftsman.
        loggedUser = Craftsman.fromMap(map);
      }else{
        ///user is client: do what you gotta do:
        loggedUser = Client.fromMap(map);
      }
      
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
      Client currentLogged = Client(fullName: user?.displayName ?? "Anonymous user", email: user?.email?? "Anonymous user", location: null ,uid: user!.uid);

      Map<String,dynamic>? mapPlaceholder = await _clientService.fetchUserById(user.uid);

      if(mapPlaceholder == null){
        ///user signed up for the first time, save his info:
        _clientService.saveClientInfo(client: currentLogged);
      }else{
        ///two cases either a craftsman logged in or a client logged in:
        if(mapPlaceholder.containsKey("speciality")){
          ///user is craftsman , set the current user as a craftsman.
          currentLogged = Craftsman.fromMap(mapPlaceholder);
        }else{
          ///user is client: do what you gotta do:
          currentLogged = Client.fromMap(mapPlaceholder);
          ///yep this is it.
        }
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

  void _setCurrentLoggedInUser(dynamic user){
    ref.read(currentUserProvider.notifier).state = user;
  }

  void _clearCurrentLoggedInUser(){
    ref.read(currentUserProvider.notifier).state = null;
  }

}