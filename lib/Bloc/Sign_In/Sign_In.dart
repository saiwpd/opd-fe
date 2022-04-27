import 'dart:async';
import 'package:appname/routing_constants.dart';
import 'package:flutter/material.dart';

import '../../Models/Sign_In/Sign_In.dart' as sign_in;
import '../../Service/Sign_In/Sign_In.dart';
import '../../routing_constants.dart';
import '../bloc.dart';

class SignInBloc implements Bloc {
  StreamController<bool> getDataController = StreamController<bool>();
  sign_in.SignIn signInModel = sign_in.SignIn();
  SignInService signInservice = SignInService();

  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();

  Future<void> initPage() async {
    signInModel;
    getDataController.sink.add(true);
  }

  void signIn(BuildContext context) async {
    signInModel.username = username.text;
    signInModel.password = password.text;
    var result = await signInservice.signIn(signInModel);
    if (result != null) {
      Navigator.pushNamed(context, otp_form, arguments: signInModel);
    }
  }

  // void otp(BuildContext context) async {
  //   var result = await signInservice.signIn(signInModel);
  //   if (result != null) {
  //     Navigator.pushNamed(context, otp_form);
  //   } else {
  //     Navigator.pushNamed(context, fee_list);
  //   }
  // }

  @override
  void dispose() {
    getDataController.close();
  }
}
