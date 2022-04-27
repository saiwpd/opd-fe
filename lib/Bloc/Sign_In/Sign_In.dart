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
  sign_in.OtpExp otpExpModel = sign_in.OtpExp();

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
    if (result.id != null) {
      Navigator.pushNamed(context, otp_form, arguments: result.id);
    } 
    else {
      otpExpModel.errormessege = result.errormessege;
    }
    getDataController.sink.add(true);
  }


  @override
  void dispose() {
    getDataController.close();
  }
}
