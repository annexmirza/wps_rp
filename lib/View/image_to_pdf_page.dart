import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
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

                    //save pdf
                  },
                  icon: Icon(Icons.picture_as_pdf),
                ),
              ],
            ),
            body: Column(
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
                          child: Center(child: Text('Add an image')),
                        ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    InkWell(
                      onTap: () async {
                        await imageToPdfController.gettingImageFromGallery();
                        //image from gallery
                      },
                      child: Icon(
                        Icons.image,
                        size: 40.sp,
                      ),
                    ),
                    InkWell(
                      onTap: () {
                        //image from camera
                      },
                      child: Icon(
                        Icons.camera_alt,
                        size: 40.sp,
                      ),
                    ),
                  ],
                )
              ],
            ),
          );
        });
  }
}
