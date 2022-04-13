import 'package:appname/Models/Prescription_Model/Prescription_Model.dart';
import 'package:http/http.dart' as http;

import '../../Models/Medicine_List_Model/Medicine_Model.dart';
import '../../Models/Medicine_Order_Model/Medicine_Order_Model.dart';
import '../../Models/Medicine_Plan_Model/medicine_plan_model.dart';

class MedicineListService {
  Future<List<Medicine>> getMedicineList() async {
    var response = await http.get(
      Uri.parse("http://localhost:3000/medicines"),
    );
    if (response.statusCode == 200) {
      var result = medicineFromJson(response.body);
      return result;
    } else {
      throw Exception('Failed');
    }
  }

  Future<MedicinePlanModel> addMedicineOrder(MedicineOrderModel senddata) async {
    var response = await http.post(
        Uri.parse(
          "http://localhost:3000/prescriptions",
        ),
        headers: <String, String>{
          'Content-Type': 'application/json; charset=UTF-8',
        },
        body: medicineOrderModelToJson(senddata));
    if (response.statusCode == 201) {
      return medicinePlanModelFromJson(response.body);
    } else {
      throw Exception('Failed');
    }
  }
}
