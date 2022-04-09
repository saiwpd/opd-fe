import 'package:http/http.dart' as http;

import '../../Models/Fee_List_Model/Fee_Model.dart';

class FeeListService {
  Future<List<Fee>> getFeeList() async {
    var response = await http.get(
      Uri.parse("http://192.168.1.125:3000/service-summaries?userId=1"),
    );
    if (response.statusCode == 200) {
      var result = feeFromJson(response.body);
      return result;
    } else {
      throw Exception('Failed');
    }
  }
}
