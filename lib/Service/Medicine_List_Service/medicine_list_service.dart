import 'package:http/http.dart' as http;

import '../../Models/Medicine_List_Model/Medicine_Model.dart';

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
}
