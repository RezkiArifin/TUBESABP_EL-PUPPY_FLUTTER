import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../theme.dart';

class OrderProduct extends StatefulWidget {
  const OrderProduct({Key? key}) : super(key: key);

  @override
  OrderProductState createState() {
    return OrderProductState();
  }
}

class OrderProductState extends State<OrderProduct> {
  TextEditingController produkController = TextEditingController();
  TextEditingController telpController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  TextEditingController jumlahController = TextEditingController();
  String dropdownValue = 'pcs';

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    CollectionReference orders = firestore.collection('orders');
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
        title: const Text('Orders',
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
                  'Nama Produk',
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
                  controller: produkController,
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
                  'Jumlah',
                  style: blackTextStyle.copyWith(
                    fontSize: 18,
                    fontWeight: FontWeight.w800,
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 36,
                      width: 74,
                      child: TextField(
                        controller: jumlahController,
                        decoration: InputDecoration(
                          border: OutlineInputBorder(),
                          hintText: "1",
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    DropdownButton<String>(
                      value: dropdownValue,
                      icon: const Icon(Icons.arrow_drop_down),
                      elevation: 16,
                      style: const TextStyle(color: Colors.black),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                      items: <String>['pcs', 'box']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ],
                ),
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
                        orders.add({
                          'produk': produkController.text,
                          'no_telp': telpController.text,
                          'alamat': alamatController.text,
                          'jumlah': jumlahController.text,
                        });
                        telpController.text = '';
                        alamatController.text = '';
                        jumlahController.text = '';
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
