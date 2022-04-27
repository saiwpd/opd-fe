import 'dart:async';
import 'package:appname/Models/OTP/otp.dart';
import 'package:appname/Models/Sign_In/Sign_In.dart';
import 'package:appname/routing_constants.dart';
import 'package:flutter/material.dart';

import '../../Models/OTP/otp.dart' as send_otp;
import '../../Service/OTP_Service/otp_service.dart';
import '../bloc.dart';

class OTPBloc implements Bloc {
  OTPService otpservice = OTPService();
  StreamController<bool> getDataController = StreamController<bool>();
  send_otp.SendOtp otpModel = send_otp.SendOtp();
  TextEditingController otpdata = TextEditingController();
  GetProfile getProfileModel = new GetProfile();
  
  Future<void> initPage(String data) async {
    otpModel.id = data;
    getDataController.sink.add(true);
  }

  void otp(BuildContext context) async {
    otpModel.otp = otpdata.text;
    var result = await otpservice.sendOTP(otpModel);
    if (result.id != null) {
      Navigator.pushNamed(context, menu);
    }
    else{
      getProfileModel.errormessege = result.errormessege;
    }
    getDataController.sink.add(true);
  }

  @override
  void dispose() {
    getDataController.close();
  }
}
