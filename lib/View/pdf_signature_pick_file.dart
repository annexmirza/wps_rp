import 'package:flutter/material.dart';
import 'package:wps_rp/View/homePage.dart';

class PDFSignaturePickFile extends StatelessWidget {
  const PDFSignaturePickFile({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        children: [
          Container(
            child: CustomButtonWithText(titleText: 'Open File',buttonIcon: Icons.upload,onTab: (){
              
            },),
          ),
        ],
      ),
    );
  }
}