import 'dart:io';

//import 'package:advance_pdf_viewer/advance_pdf_viewer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:flutter_pdfview/flutter_pdfview.dart';

import 'package:wps_rp/Controller/image_to_pdf_controller.dart';

class ImageToPdfPage extends StatelessWidget {
  ImageToPdfPage({Key? key}) : super(key: key);

  //File? _image;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<ImageToPdfController>(
        init: ImageToPdfController(),
        builder: (imageToPdfController) {
          return Scaffold(
            appBar: AppBar(
              title: Text('Image to Pdf'),
              actions: [
                IconButton(
                  onPressed: () async {
                    //create pdf
                    await imageToPdfController.creatingPdf();
                    await imageToPdfController.savingPdf();
                    await imageToPdfController.makingPdfDocument();

                    //save pdf
                  },
                  icon: Icon(Icons.picture_as_pdf),
                ),
              ],
            ),
            body: imageToPdfController.showPdf
                ? Center(
                    child: PDFView(
                      filePath: imageToPdfController.pdfFile!.path,
                    ),
                    //  PDFViewer(document: imageToPdfController.pdfDocument!),
                  )
                : Column(
                    children: [
                      Container(
                        height: 600.h,
                        width: double.infinity,
                        margin: EdgeInsets.all(8.sp),
                        child: imageToPdfController.imageFile != null
                            ? Image.file(
                                imageToPdfController.imageFile!,
                                fit: BoxFit.cover,
                              )
                            : Container(
                                child: Center(
                                  child: Text('Click below to Add an image'),
                                ),
                              ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          imageToPdfController.pdfDocument != null
                              ? InkWell(
                                  onTap: () {
                                    imageToPdfController.showingPdfDocument();
                                  },
                                  child: Container(
                                    height: 60.h,
                                    decoration: BoxDecoration(
                                      color: Colors.blueGrey[900],
                                      borderRadius: BorderRadius.all(
                                        Radius.circular(10.r),
                                      ),
                                    ),
                                    child: Center(
                                      child: Text(
                                        ' Pdf Document Ready. \n     Show Now',
                                        style: TextStyle(color: Colors.white),
                                      ),
                                    ),
                                  ),
                                )
                              : Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceEvenly,
                                  children: [
                                    InkWell(
                                      onTap: () async {
                                        await imageToPdfController
                                            .gettingImageFromGallery();
                                        //image from gallery
                                      },
                                      child: Icon(
                                        Icons.image,
                                        size: 40.sp,
                                      ),
                                    ),
                                    SizedBox(
                                      width: 60.w,
                                    ),
                                    InkWell(
                                      onTap: () {
                                        imageToPdfController
                                            .gettingImageFromCamera();
                                      },
                                      child: Icon(
                                        Icons.camera_alt,
                                        size: 40.sp,
                                      ),
                                    ),
                                  ],
                                ),
                        ],
                      )
                    ],
                  ),
          );
        });
  }
}
