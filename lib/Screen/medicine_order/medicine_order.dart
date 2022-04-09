import 'package:appname/routing_constants.dart';
import 'package:flutter/material.dart';

import '../../Models/Medicine_List_Model/Medicine_Model.dart';
import '../../Service/Medicine_List_Service/medicine_list_service.dart';

class MedicineOrder extends StatefulWidget {
  MedicineOrder({Key? key}) : super(key: key);

  @override
  State<MedicineOrder> createState() => _MedicineOrderState();
}

class _MedicineOrderState extends State<MedicineOrder> {
  MedicineListService service = MedicineListService();
  List<Medicine> listOfMedicine = [];

  @override
  void initState() {
    super.initState();
    getListMedicine();
  }

  void getListMedicine() async {
    listOfMedicine = await service.getMedicineList();
    print(listOfMedicine.length);
  }
  
  
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text(
          "รายการยาที่สั่ง",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        ),
      ),
      body: Column(children: [
        Container(
          height: 30,
        ),
        Center(
            child: Container(
          alignment: Alignment.center,
          width: 350,
          height: 50,
          child: TextField(
            textAlignVertical: TextAlignVertical.bottom,
            textAlign: TextAlign.left,
            decoration: new InputDecoration(
              focusedBorder: const OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Colors.transparent, width: 0.0),
                  borderRadius: BorderRadius.all(Radius.circular(50))),
              enabledBorder: const OutlineInputBorder(
                  borderSide:
                      const BorderSide(color: Colors.transparent, width: 0.0),
                  borderRadius: BorderRadius.all(Radius.circular(50))),
              fillColor: Color(0xffE8DEF8),
              filled: true,
              suffixIcon: Icon(
                Icons.search,
                color: Color(0xFF65676B),
              ),
              hintText: 'ค้นหา...',
              hintStyle: TextStyle(
                  fontWeight: FontWeight.w300,
                  color: Color(0xFF65676B),
                  fontSize: 16),
            ),
          ),
        )),
        Container(
          child:  Column(
          children: <Widget>[
            SizedBox(height:20.0),
            ExpansionTile(
              title: Text(
                "Title",
                style: TextStyle(
                  fontSize: 18.0,
                  fontWeight: FontWeight.bold
                ),
              ),
              children: <Widget>[
                ListTile(
                  title: Text(
                    'data'
                  ),
                )
              ],
            ),
          ]),

        ),
        
        Expanded(          
            child: ListView.builder(
            padding: const EdgeInsets.all(20.0),            
            itemCount: listOfMedicine.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    margin: const EdgeInsets.all(3.0),      
                    decoration: BoxDecoration(
                      border: Border.all(color: Color.fromARGB(255, 111, 54, 244),width: 1),
                      borderRadius: BorderRadius.all(Radius.circular(10.0)),
                      ),
                      height: 80,
                      child: Row(
                          children: <Widget>[
                            Expanded(
                              flex: 2,
                              child: Container(
                                decoration: BoxDecoration(
                                    shape: BoxShape.circle,
                                    border: Border.all(color: Color.fromARGB(255, 111, 54, 244), width: 1),
                                    //borderRadius: BorderRadius.all(Radius.circular(100.0)), color: Color(0xffE8DEF8),                                    
                                    ),
                                height: 40,                                
                              ),
                            ),
                            Expanded(                              
                              flex: 5,
                              child: Text('${listOfMedicine[index].name}'),
                            ),
                            Expanded(
                              flex: 3,
                              child: Container(
                                decoration: BoxDecoration(
                                    border: Border.all(
                                        color: Color.fromARGB(255, 111, 54, 244), width: 1),
                                        borderRadius: BorderRadius.all(Radius.circular(100.0)), color: Color(0xffE8DEF8),),
                                height: 40,
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                  children: <Widget>[
                                  Container(// 20%
                                    child: Text('+'),
                                  ),
                                  Container( // 60%
                                    child: Text('2'),
                                  ),
                                  Container( // 60%
                                    child: Text('-'),
                                  ),
                                ]),
                              ),
                            )
                          ]

                          // [
                          //   Center(child: Text('${listOfMedicine[index].name}')),
                          //   Container(
                          //     decoration: BoxDecoration(
                          //       border: Border.all(color: Color.fromARGB(255, 111, 54, 244),width: 1)
                          //     )

                          //   )

                          // ],
                          ));
                })),
        Container(
          height: 40,
        ),
        Container(
          height: 50,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                primary: Colors.green,
                textStyle: const TextStyle(fontSize: 20)),
            onPressed: () {
              Navigator.pushNamed(context, medicine_order);
            },
            child: const Text('ดูรายการที่สั่ง'),
          ),
        ),
        Container(
          height: 10,
        ),
      ]),
    );
  }
}