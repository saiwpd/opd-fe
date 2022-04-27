import 'package:appname/Models/Sign_In/Sign_In.dart';
import 'package:http/http.dart' as http;

import '../../Models/Sign_In/Sign_In.dart';

class SignInService {
  Future<OtpExp> signIn(SignIn senddata) async {
    var response =
        await http.post(Uri.parse("http://localhost:3000/profile/login"),
            headers: <String, String>{
              'Content-Type': 'application/json; charset=UTF-8',
            },
            body: signInToJson(senddata));
    if (response.statusCode == 201) {
      var result = otpFromJson(response.body);
      return result;
    } else {
      throw Exception('Failed');
    }
  }
}
