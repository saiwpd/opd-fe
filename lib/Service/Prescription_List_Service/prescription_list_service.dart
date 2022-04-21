import 'package:appname/Models/Prescription_List_model/Prescription_Model.dart';
import 'package:http/http.dart' as http;

import '../../Models/Prescription_List_model/Prescription_Model.dart';

class PrescriptionListService{

  Future<List<Prescription>> getPrescriptionList() async{
    var patientId = "1";
    var url = "http://localhost:3000/prescriptions" + ([null, ""].contains(patientId) ? "" : "?patientId=" + patientId);

    var response = await http.get(
      Uri.parse(url),
    );
    if (response.statusCode == 200){
      var result = prescriptionListModelFromJson(response.body);
      return result;
    } else {
      throw Exception('Failed');
    }
  }
}//PrescriptionListService