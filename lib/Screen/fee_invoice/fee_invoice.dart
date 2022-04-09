import 'package:appname/Screen/fee_receipt/fee_receipt.dart';
import 'package:flutter/material.dart';

import '../../routing_constants.dart';

class FeeInvoice extends StatefulWidget {
  FeeInvoice({Key? key}) : super(key: key);

  @override
  State<FeeInvoice> createState() => _FeeInvoiceState();
}

class _FeeInvoiceState extends State<FeeInvoice> {
  @override


  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 1,
        backgroundColor: Colors.white,
        automaticallyImplyLeading: true,
        centerTitle: true,
        title: //Text('${listOfFees[index].invoice?.status == "PAID" ? "VIEW" : "PAY"}',
        Text(
          "ใบสรุปค่าบริการ",
          style: TextStyle(color: Colors.black, fontWeight: FontWeight.w500),
        ),
      ),
      body: Column(children: [
        Container(
          height: 20,
        ),
        Container(
          margin: const EdgeInsets.only(right: 20, left: 20, bottom: 10),
          decoration: BoxDecoration(
            color: const Color(0xffE8DEF8),
            borderRadius: BorderRadius.circular(12),
          ),
          height: 180,
          width: MediaQuery.of(context).size.width * 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 20, top: 20),
                        width: MediaQuery.of(context).size.width * 0.45,
                        child: Text('เลขที่ใบแจ้งหนี้',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20, top: 20),
                        width: MediaQuery.of(context).size.width * 0.45,
                        child: Text('INVOICE#1234'),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20, top: 20),
                        width: MediaQuery.of(context).size.width * 0.45,
                        child: Text('วันที่รับบริการ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 20, top: 20),
                        width: MediaQuery.of(context).size.width * 0.45,
                        child: Text('25 ตุลาคม 2564'),
                      ),
                    ],
                  ),
                  Column(
                    children: [
                      Container(
                        padding: EdgeInsets.only(left: 5, top: 20),
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Text('เลขที่ใบเสร็จ',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 5, top: 20),
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Text('RECIEPT#1234'),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 5, top: 20),
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Text('ธนาคาร',
                            style: TextStyle(fontWeight: FontWeight.bold)),
                      ),
                      Container(
                        padding: EdgeInsets.only(left: 5, top: 20),
                        width: MediaQuery.of(context).size.width * 0.4,
                        child: Text('ธนาคารกสิกรไทย'),
                      ),
                    ],
                  )
                ],
              )
              
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(right: 20, left: 20, bottom: 10),
            decoration: BoxDecoration(
            color: const Color(0xffE8DEF8),
            borderRadius: BorderRadius.circular(12),
          ),
          height: 150,
          width: MediaQuery.of(context).size.width * 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.only(left: 20, top: 20),
                child: Text('ไปยัง',
                    style: TextStyle(fontWeight: FontWeight.bold)),
              ),
              Container(
                padding: EdgeInsets.only(left: 20, top: 20),
                child: Text('บริษัท xxxx'),
              ),
              Container(
                padding: EdgeInsets.only(left: 20, top: 20),
                child: Text('ที่อยู่ xxxxx'),
              )
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(right: 20, left: 20, bottom: 10),
          decoration: BoxDecoration(
            color: const Color(0xffE8DEF8),
            borderRadius: BorderRadius.circular(12),
          ),
          height: 200,
          width: MediaQuery.of(context).size.width * 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Container(
                padding: EdgeInsets.only(left: 20, top: 20),
                child: Text('รายละเอียด'),
              ),
              Container(
                padding: EdgeInsets.only(left: 20, top: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded (
                        flex: 4,
                        child: Text('รายการ'),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text('จำนวน'),
                      ),
                      Expanded(
                        flex: 4,
                        child: Text('คิดเป็นเงิน (บาท)'),
                      ),
                    ]),
              ),
              Divider(
                indent: 20,
                endIndent: 20,
                color: Colors.black,
              ),
              Container(
                padding: EdgeInsets.only(left: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded (
                        flex: 4,
                        child: Text('ค่าวินิจฉัยแพทย์'),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text('1'),
                      ),
                      Expanded(
                        flex: 4,
                        child: Text('2,000'),
                      ),
                    ]),
              ),
              Divider(
                indent: 20,
                endIndent: 20,
                color: Colors.black,
              ),
              Container(
                padding: EdgeInsets.only(left: 20),
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded (
                        flex: 6,
                        child: Text('รวมทั้งหมด'),
                      ),
                      Expanded(
                        flex: 4,
                        child: Text('2,000'),
                      ),
                    ]),
              ),
            ],
          ),
        ),
        Container(
          height: 10,
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
