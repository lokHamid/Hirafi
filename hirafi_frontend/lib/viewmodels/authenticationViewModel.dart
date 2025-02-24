import 'dart:math';

import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hirafi_frontend/providers/providers.dart';
import 'package:hirafi_frontend/services/firebase_auth_service.dart';

import '../models/client.dart';

class AuthenticationViewModel {
  WidgetRef ref;
  final FirebaseAuthService _authService ;
  AuthenticationViewModel(this._authService,this.ref) : super();

  Future<Client?> signUpWithEmailAndPassword({required String fullname, required String email, required String password, required String location,
  })async{
    _setIsLoading(true);

    try{
      Client? client = await _authService.signUpWithEmailAndPassword(fullname: fullname, email: email, password: password, location: location);
      _setIsLoading(false);

      return client;
    }catch(e){
      _setIsLoading(false);
      rethrow;
    }
  }

  Future<Client?> signInWithEmailAndPassword({required String email,required String password})async{
    _setIsLoading(true);

    try{
      Client? loggedInUser = await _authService.signInWithEmailAndPassword(email: email, password: password);
      _setIsLoading(false);

      return loggedInUser;
    }catch(e){
      _setIsLoading(false);
      rethrow;
    }
  }

  Future<Client?> signInWithGoogle()async{
    _setIsLoading(true);

    try{
      Client? loggedInUser = await _authService.signInWithGoogle();
      _setIsLoading(false);

      return loggedInUser;
    }catch(e){
      _setIsLoading(false);
      rethrow;
    }
  }

  void _setIsLoading(bool flag){
    ref.read(isLoadingAuthFlag.notifier).state = flag;
  }
}