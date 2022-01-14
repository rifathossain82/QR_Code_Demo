import 'package:flutter/material.dart';
import 'package:qr_flutter/qr_flutter.dart';

class QR_code_generator extends StatefulWidget {
  const QR_code_generator({Key? key}) : super(key: key);

  @override
  _QR_code_generatorState createState() => _QR_code_generatorState();
}

class _QR_code_generatorState extends State<QR_code_generator> {

  TextEditingController controller=TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('QR Code Generator'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.only(top: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Card(
                elevation: 5,
                shadowColor: Colors.orange,
                color: Colors.white,
                child: Padding(
                  padding:EdgeInsets.only(left: 12,right: 12,top: 12,bottom: 12),
                  child: QrImage(
                    data: controller.text,
                    size: 200,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: TextField(
                  controller: controller,
                  style: TextStyle(color: Colors.white,fontSize: 20),
                  onSubmitted: (_){
                    setState(() {

                    });
                  },
                  decoration: InputDecoration(
                      hintText: 'Enter data',
                      hintStyle: TextStyle(color: Colors.white),
                      border: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange)
                      ),
                      enabledBorder: OutlineInputBorder(
                          borderSide: BorderSide(color: Colors.orange)
                      )
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
