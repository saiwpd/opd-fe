import 'package:appname/Models/Prescription_List_model/Prescription_Model.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

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
                                      decoration: BoxDecoration(
                                        shape: BoxShape.circle,
                                        border: Border.all(
                                            color: Color.fromARGB(
                                                255, 111, 54, 244),
                                            width: 1),
                                        //borderRadius: BorderRadius.all(Radius.circular(100.0)), color: Color(0xffE8DEF8),
                                      ),
                                      height: 40,
                                    ),
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Text(
                                      '${bloc.listOfPrescription[index].id}'
                                    )
                                  ),
                                  Expanded(
                                    flex: 4,
                                    child: Text(
                                      '${bloc.listOfPrescription[index].status}'
                                    )
                                  ),
                                  Container(
                                    width: 20,
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