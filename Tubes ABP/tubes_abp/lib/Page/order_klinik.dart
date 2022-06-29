import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../theme.dart';
import 'package:intl/intl.dart';
import 'package:datetime_picker_formfield/datetime_picker_formfield.dart';


class OrderClinic extends StatefulWidget {
  const OrderClinic({Key? key}) : super(key: key);

  @override
  OrderClinicState createState() {
    return OrderClinicState();
  }
}

class OrderClinicState extends State<OrderClinic> {
  TextEditingController keluhanController = TextEditingController();
  TextEditingController telpController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController waktuController = TextEditingController();
  final format = DateFormat("yyyy-MM-dd HH:mm");

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference order_klinik = firestore.collection('orderKlinik');
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text('Books',
            style: TextStyle(
              color: Color(0xff1C1D1D),
              fontWeight: FontWeight.w800,
              fontSize: 16,
            )),
        centerTitle: true,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Color(0xff1C1D1D)),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: ListView(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 24,
                ),
                Text(
                  'Keluhan',
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextField(
                  textAlign: TextAlign.start,
                  controller: keluhanController,
                  decoration: InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.multiline,
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  'No Telepon',
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextFormField(
                  controller: telpController,
                  decoration: const InputDecoration(
                    border: OutlineInputBorder(),
                  ),
                  // The validator receives the text that the user has entered.
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Nomor Telepon Harus diisi';
                    }
                    return null;
                  },
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  'Isi Alamat dulu yuk',
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextField(
                  minLines: 5,
                  maxLines: 5,
                  textAlign: TextAlign.start,
                  controller: alamatController,
                  decoration: InputDecoration(
                    isDense: true,
                    border: OutlineInputBorder(),
                    hintText: "isi alamat disini",
                  ),
                  keyboardType: TextInputType.multiline,
                ),
                const SizedBox(
                  height: 24,
                ),
                Text(
                  'Waktu Pemesanan',
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                    Column(
                      children: <Widget>[
                    DateTimeField(
                      controller: waktuController,
                      format: format,
                      onShowPicker: (context, currentValue) async {
                        final date = await showDatePicker(
                            context: context,
                            firstDate: DateTime(1900),
                            initialDate: currentValue ?? DateTime.now(),
                            lastDate: DateTime(2100));
                        if (date != null) {
                          final time = await showTimePicker(
                            context: context,
                            initialTime:
                                TimeOfDay.fromDateTime(currentValue ?? DateTime.now()),
                          );
                          return DateTimeField.combine(date, time);
                        } else {
                          return currentValue;
                        }
                      },
                    ),
                  ]),
                SizedBox(
                  height: 40,
                ),
                Container(
                    height: 50,
                    padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                    child: ElevatedButton(
                      style: TextButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 233, 78, 39)),
                      child: const Text('Order'),
                      onPressed: () {
                        order_klinik.add({
                          'keluhan': keluhanController.text,
                          'no_telp': telpController.text,
                          'alamat': alamatController.text,
                          'waktu': waktuController.text,
                        });
                        telpController.text = '';
                        alamatController.text = '';
                        waktuController.text = '';
                      },
                    )),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
