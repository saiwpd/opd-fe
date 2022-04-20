import 'package:http/http.dart' as http;
import '../../Models/Medicine_Plan_Model/medicine_plan_model.dart';

class MedicinePlanService {
  Future<MedicinePlanModel> editMedicinePlan(MedicinePlanModel senddata) async {
    var response = await http.put(
        Uri.parse(
          "http://localhost:3000/prescriptions",
        ),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: medicinePlanModelToJson(senddata));
    if (response.statusCode == 200) {
      return medicinePlanModelFromJson(response.body);
    } else {
      throw Exception('Failed');
    }
  }
}
