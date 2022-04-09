import 'package:appname/routing_constants.dart';
import 'package:flutter/material.dart';

class MedicinePlan extends StatefulWidget {
  MedicinePlan({Key? key}) : super(key: key);
  

  

  @override
  State<MedicinePlan> createState() => _MedicinePlanState();
}

class _MedicinePlanState extends State<MedicinePlan> {
  bool _isChecked = true;
  String _currText = '';
  List<String> dosageTimes = ["เช้า", "กลางวัน", "เย็น", "ก่อนนอน"];
  List<String> dosageMeals = ["ก่อนอาหาร", "หลังอาหาร"];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: Text(
          "Paracetamol",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        ),
      ),
      body: Column(children: [
        Container(
          height: 20,
        ),
        Container(
          margin: const EdgeInsets.only(right: 20, left: 20, bottom: 0, top: 0),          
          height: 100,
          width: MediaQuery.of(context).size.width * 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('ชื่อยา : '),
              TextField(
                readOnly: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Paracetamol',
                ),
              ),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(right: 20, left: 20, bottom: 0, top: 0),          
          height: 100,
          width: MediaQuery.of(context).size.width * 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('สรรพคุณ : '),
              TextField(
                readOnly: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'แก้ปวด ลดไข้',
                ),
              ),
            ],
          ),
        ),
        Row(
          children: [
            Container(
              margin:
                  const EdgeInsets.only(right: 5, left: 20, bottom: 0, top: 0),
              height: 100,
              width: MediaQuery.of(context).size.width * 0.55,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('ครั้งละ : '),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: '2-4',
                    ),
                  ),
                ],
              ),
            ),
            Container(
              margin: const EdgeInsets.only(right: 20, left: 5, bottom: 0, top: 0),
              height: 100,
              width: MediaQuery.of(context).size.width * 0.32,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('หน่วย : '),
                  TextField(
                    decoration: InputDecoration(
                      border: OutlineInputBorder(),
                      hintText: 'เม็ด',
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
        Container(
          margin: const EdgeInsets.only(right: 20, left: 20, bottom: 20, top: 0),
          height: 250,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('ช่วง : '),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Color.fromARGB(255, 75, 75, 75), width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                  child: Column(
                    children: dosageTimes
                        .map((t) => CheckboxListTile(
                              title: Text(t),
                              value: _isChecked,
                              onChanged: (val) {
                                setState(() {
                                  _isChecked = val!;
                                  if (val == true) {
                                    _currText = t;
                                  }
                                });
                              },
                            ))
                        .toList(),
                  ),
                )
              ]),
        ),
        Container(
          margin: const EdgeInsets.only(right: 20, left: 20, bottom: 0, top: 0),
          height: 250,
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text('มื้ออาหาร : '),
                Container(
                  decoration: BoxDecoration(
                    border: Border.all(
                        color: Color.fromARGB(255, 75, 75, 75), width: 1),
                    borderRadius: BorderRadius.all(Radius.circular(5.0)),
                  ),
                  child: Column(
                    children: dosageMeals
                        .map((t) => CheckboxListTile(
                              title: Text(t),
                              value: _isChecked,
                              onChanged: (val) {
                                setState(() {
                                  _isChecked = val!;
                                  if (val == true) {
                                    _currText = t;
                                  }
                                });
                              },
                            ))
                        .toList(),
                  ),
                )
              ]),
        ),
        Container(
          margin: const EdgeInsets.only(right: 20, left: 20, bottom: 0, top: 0),
          height: 100,
          width: MediaQuery.of(context).size.width * 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('หมายเหตุ : '),
              TextField(
                readOnly: true,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: '-',
                ),
              ),
            ],
          ),
        ),
        
       
        Container(
          height: 100,
        ),
        Container(
          height: 50,
          width: MediaQuery.of(context).size.width * 0.75,
          child: ElevatedButton(
            style: ElevatedButton.styleFrom(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(50)),
                primary: Colors.green,
                textStyle: const TextStyle(fontSize: 20)),
            onPressed: () {
              Navigator.pushNamed(context, medicine_order);
            },
            child: const Text('ชำระเงิน'),
          ),
        ),
      ]),
    );
  }
}