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
        title: Text(
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
          height: 100,
          width: MediaQuery.of(context).size.width * 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('เลขที่ใบแจ้งหนี้'),
              Text('INVOICE#1234'),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(right: 20, left: 20, bottom: 10),
          decoration: BoxDecoration(
            color: const Color(0xffE8DEF8),
            borderRadius: BorderRadius.circular(12),
          ),
          height: 100,
          width: MediaQuery.of(context).size.width * 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('วันที่รับบริการ'),
              Text('25 ตุลาคม 2564'),
            ],
          ),
        ),
        Container(
          margin: const EdgeInsets.only(right: 20, left: 20, bottom: 10),
            decoration: BoxDecoration(
            color: const Color(0xffE8DEF8),
            borderRadius: BorderRadius.circular(12),
          ),
          height: 100,
          width: MediaQuery.of(context).size.width * 1,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Text('ไปยัง'),
              Text('บริษัท ไทยดีซีน'),
              Text('ที่อยู่ xxxxxxx'),
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
              Text('รายละเอียด'),
              Container(
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded (
                        flex: 5,
                        child: Text('รายการ'),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text('จำนวน'),
                      ),
                      Expanded(
                        flex: 3,
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
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded (
                        flex: 5,
                        child: Text('ค่าวินิจฉัยแพทย์'),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text('1'),
                      ),
                      Expanded(
                        flex: 3,
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
                child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Expanded (
                        flex: 5,
                        child: Text('รายการ'),
                      ),
                      Expanded(
                        flex: 2,
                        child: Text('จำนวน'),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text('คิดเป็นเงิน (บาท)'),
                      ),
                    ]),
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
