import 'package:flutter/material.dart';
import '../theme.dart';

class Alamat extends StatefulWidget {
  const Alamat({Key? key}) : super(key: key);

  @override
  AlamatState createState() {
    return AlamatState();
  }
}

class AlamatState extends State<Alamat> {
  final _formKey = GlobalKey<FormState>();

  final myController = TextEditingController();
  String dropdownValue = 'pcs';
  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.white,
          title: const Text('Alamat',
            style: TextStyle(
              color: Color(0xff1C1D1D),
              fontWeight: FontWeight.w800,
              fontSize: 16,
            )
          ),
          centerTitle: true,

          leading: IconButton(
            icon: const Icon(Icons.arrow_back, color: Color(0xff1C1D1D)),
            onPressed: () => Navigator.of(context).pop(),
          ), 
        ),

      body: Form(
        key: _formKey,
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
    
              const SizedBox(
                height: 24,
              ),
              Text('No Telepon',
                style: blackTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
    
              TextFormField(
                controller: myController,
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
    
              Text('Isi Alamat dulu yuk',
                style: blackTextStyle.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w800,
                ),
              ),
              const SizedBox(
                height: 16,
              ),
    
              const TextField(
                
                minLines: 5,
                maxLines: 5,
                textAlign: TextAlign.start,
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
    
              Text('Jumlah',
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
                  const SizedBox(
                    height: 36,
                    width: 74,
                    child: TextField(
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
    
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 16.0),
                
                child: Center(
                  child: ElevatedButton(
                    
                    onPressed: () {
    
                      if (_formKey.currentState!.validate()) {
                        showDialog(
                          context: context,
                          builder: (context) {
                            return AlertDialog(
                              title : Text('Selamat datang ' + myController.text),
                            );
                          },
                        );
                      }
                    },
                    style: ElevatedButton.styleFrom(
                    primary: const Color(0xffE5561C),
                    fixedSize: const Size(320, 36),
                    ),
                    child: const Text('Konfirmasi', 
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w800,
                      ),
                    ),
    
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
