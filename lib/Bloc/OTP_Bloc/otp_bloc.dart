import 'dart:async';
import 'package:appname/Models/OTP/otp.dart';
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
  Future<void> initPage() async {
    otpModel;
    getDataController.sink.add(true);
  }

  void otp(BuildContext context) async {
    otpModel.id = "62644007cc92696b95771667";
    otpModel.otp = otpdata.text;
    var result = await otpservice.sendOTP(otpModel);
    if (result != null) {
      Navigator.pushNamed(context, menu);
    }
  }

  @override
  void dispose() {
    getDataController.close();
  }
}
