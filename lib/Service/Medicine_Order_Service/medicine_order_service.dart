import 'package:http/http.dart' as http;
import '../../Models/Medicine_Plan_Model/medicine_plan_model.dart';

class MedicineOrderService {
  Future<bool> addMedicineOrder(MedicineOrderModel senddata) async {
    var a = medicinePlanToJson(senddata);
    var response = await http.post(
        Uri.parse(
          "http://192.168.1.125:3000/prescriptions",
        ),
        body: medicinePlanToJson(senddata));
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed');
    }
  }

  Future<bool> editMedicineOrder(MedicineOrderModel senddata) async {
    var response = await http.put(
        Uri.parse(
          "http://192.168.1.125:3000/prescriptions/$senddata",
        ),
        body: medicinePlanToJson(senddata));
    if (response.statusCode == 200) {
      return true;
    } else {
      throw Exception('Failed');
    }
  }
}
