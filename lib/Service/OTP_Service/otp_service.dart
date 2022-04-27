import 'package:appname/Models/OTP/otp.dart';
import 'package:http/http.dart' as http;

import '../../Models/OTP/otp.dart';

class OTPService {
  Future<GetProfile> sendOTP(SendOtp senddata) async {
    var response =
        await http.post(Uri.parse("http://localhost:3000/profile/otp"),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: sendOtpToJson(senddata));
    if (response.statusCode == 201) {
      var result = getProfileFromJson(response.body);
      return result;
    } else {
      GetProfile getProfileModel = new GetProfile();
      getProfileModel.errormessege = "OTP is incorrected or expired";
      return getProfileModel;
      //throw Exception('Failed');
    }
  }
}
