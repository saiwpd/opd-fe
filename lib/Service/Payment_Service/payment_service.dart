import 'package:appname/Models/Payment_Model/payment_model.dart';
import 'package:appname/Models/Prescription_Model/Prescription_Model.dart';
import 'package:http/http.dart' as http;


class PaymentService {

  Future<bool> Payments(PaymentModel senddata) async {
    var response = await http.post(
        Uri.parse(
          "http://localhost:3000/payments",
        ),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: paymentModelToJson(senddata));
    if (response.statusCode == 201) {
      return true;
    } else {
      throw Exception('Failed');
    }
  }

  Future<bool> CreatePayment(PaymentModel senddata) async {
    var response = await http.post(
        Uri.parse(
          "http://localhost:3000/payments/create",
        ),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: paymentModelToJson(senddata));
    if (response.statusCode == 201) {
      return true;
    } else {
      throw Exception('Failed');
    }
  }
}
