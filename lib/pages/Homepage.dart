import 'package:flutter/material.dart';
import 'package:qr_code_demo/pages/qr_code_generator.dart';
import 'package:qr_code_demo/pages/qr_code_scanner.dart';

class Homepage extends StatefulWidget {
  const Homepage({Key? key}) : super(key: key);

  @override
  _HomepageState createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {

  final screen=[
    QR_code_scanner(),
    QR_code_generator()
  ];

  int currentIndex=0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IndexedStack(
          children: screen,
        index: currentIndex,
      ),
      bottomNavigationBar: BottomNavigationBar(
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.qr_code_scanner_outlined),
              label: 'QR Code Scanner',
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.qr_code),
              label: 'QR Code Generator',
            )
          ],
        currentIndex: currentIndex,
        onTap: (index){
            setState(() {
              currentIndex=index;
            });
        },
      ),
    );
  }
}
