import 'package:appname/Models/Prescription_List_model/Prescription_Model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

import '../../Bloc/Prescription_List_Bloc/prescription_list_bloc.dart';
import '../../Service/Prescription_List_Service/prescription_list_service.dart';
import '../../SharedWidget/app_loading.dart';
import '../../routing_constants.dart';

class PrescriptionList extends StatefulWidget {
  PrescriptionList({Key? key}) : super(key: key);

  @override
  State<PrescriptionList> createState() => _PrescrptionListState();
}

class _PrescrptionListState extends State<PrescriptionList> {
  PrescriptionListBloc bloc = PrescriptionListBloc();

  @override
  void initState() {
    super.initState();
    bloc.initPage();
  }

  String formatDate(String dateStr){
    DateTime dt = DateTime.parse(dateStr);
    return DateFormat('yyyy-MM-dd').format(dt);
  }

  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        centerTitle: true,
         leading: IconButton(
              icon: Icon(
                Icons.arrow_back_ios,
                color: Colors.black,
              ),
              onPressed: () {
                Navigator.pop(context);
              }),
        title: Text(
          "รายการใบสั่งยา",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        ),
      ),
      body: Column(children: [
          Container(
          height: 10,
        ),
        StreamBuilder(
          stream: bloc.getDataController.stream,
            builder: (context, AsyncSnapshot<bool> snapshot) {
              if (snapshot.hasData) {
                if (!snapshot.hasError) {
                  return Expanded(
                    child: ListView.builder(
                      padding: const EdgeInsets.all(20.0),
                          itemCount: bloc.listOfPrescription.length,
                          itemBuilder: (BuildContext context, int index) {
                            var prescriptionId = '${bloc.listOfPrescription[index].id}';
                            var prescriptionCreatedAt = formatDate('${bloc.listOfPrescription[index].createdAt}');
                            var status = '${bloc.listOfPrescription[index].status}';                            
                            
                            var bgStatusColor;
                            var textStatusColor;
                            if (status == 'CREATED'){
                              bgStatusColor = Color.fromARGB(255, 232, 222, 248);
                              textStatusColor = Color.fromARGB(255, 103, 80, 164);
                            } else if (status == 'CONFIRMED') {
                              bgStatusColor = Color.fromARGB(255, 95, 182, 114);
                              textStatusColor = Color.fromARGB(214, 255, 255, 255);
                            } else {
                              bgStatusColor = Colors.red[600];
                              textStatusColor = Colors.white;
                            }                            
                            var prescriptionUi = <TextSpan>[
                              TextSpan(text: 'เลขที่ใบสั่งยา:\n', style: TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(text: prescriptionId + '\n\n'),
                              TextSpan(text: 'วันที่ออกใบสั่งยา: ', style: TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(text: prescriptionCreatedAt),
                              ];

                            return Container(
                              margin: const EdgeInsets.all(3.0),
                                decoration: BoxDecoration(
                                  border: Border.all(
                                      color: Color.fromARGB(255, 111, 54, 244),
                                      width: 1),
                                  borderRadius:
                                      BorderRadius.all(Radius.circular(10.0)),
                                ),
                                height: 100,
                                child: Row(children: <Widget>[
                                  Expanded(
                                    flex: 2,
                                    child: Container(
                                      child: Image.asset('assets/images/prescription.png'),
                                      height: 50,                                      
                                    ),
                                  ),
                                  Expanded(
                                    flex: 5,
                                    child: RichText(
                                    text: TextSpan(
                                      style: const TextStyle(
                                        fontSize: 12,
                                        color: Colors.black,
                                      ),
                                      children: prescriptionUi,
                                    ),
                                  )
                                  ),
                                  Expanded(
                                    flex: 3,
                                    child: Container(
                                      width: 100,
                                      height: 100,
                                      child: Center(
                                        child: Text(status,
                                          textAlign: TextAlign.center,
                                          style: TextStyle(color: textStatusColor, fontWeight: FontWeight.bold),
                                        )
                                      ),
                                      decoration: BoxDecoration(
                                        color: bgStatusColor,
                                        borderRadius: BorderRadius.only(
                                          bottomRight: Radius.circular(10.0),
                                          topRight: Radius.circular(10.0),
                                        ),
                                      ),
                                    )
                                    
                                  ),
                                  Container(
                                    width: 0,
                                  )
                                ]));
                          }));
                } else {
                  return AppLoaderIndicator();
                }
              } else {
                return AppLoaderIndicator();
              }
            }),
        Container(
          height: 40,
        ),
      ],)
    );
  }
}