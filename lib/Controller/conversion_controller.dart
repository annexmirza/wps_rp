// Import dependencies
// import 'package:aspose_words_cloud/aspose_words_cloud.dart';
import 'dart:typed_data';

import 'package:external_path/external_path.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'dart:convert';
import 'dart:io';

import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:internet_file/internet_file.dart';

class ConversionController extends GetxController{
  convertDocxToJpg() async{
     String _localPath = await ExternalPath.getExternalStoragePublicDirectory(
        ExternalPath.DIRECTORY_DOWNLOADS);
String url='https://v2.convertapi.com/convert/docx/to/jpg?Secret=LN72qmLNad8Jwa8J';
var filePickerResult = await FilePicker.platform.pickFiles(
  type: FileType.custom,
  allowMultiple: false,
allowedExtensions: ['docx'],
);
if(filePickerResult!=null){
File file=File(filePickerResult.files.single.path!);
String filePath=file.path;
String fileName=file.path.split('/').last;
Uint8List? fileInBytes=file.readAsBytesSync();
String? docFileData=base64Encode(fileInBytes);
final body = {

       "Parameters": [
         {
           "Name": "File",
           "FileValue": {
             "Name": fileName,
             "Data": docFileData
           }
         },
         {
           "Name": "StoreFile",
           "Value": true
         }
       ]

    };

http.Response response = await http.post(
 Uri.parse(url), 
 body: jsonEncode(body), 
 headers: {"Content-Type": "application/json"}
);
print(response.body);
var abc=jsonDecode(response.body);
String fileUrl=abc['Files'][0]['Url'];


final Uint8List bytes = await InternetFile.get(
    fileUrl,
    process: (percentage) {
        print('downloadPercentage: $percentage');
    },
);
var file1=await File('${_localPath}/${abc['Files'][0]['FileName']}').writeAsBytes(bytes);
print(file1);
  }
  
}
  convertDocxToPdf() async{
    
     String _localPath = await ExternalPath.getExternalStoragePublicDirectory(
        ExternalPath.DIRECTORY_DOWNLOADS);
String url='https://v2.convertapi.com/convert/docx/to/pdf?Secret=LN72qmLNad8Jwa8J';
var filePickerResult = await FilePicker.platform.pickFiles(
  allowMultiple: false,
  type: FileType.custom,
  allowedExtensions: ['docx'],
  

);
if(filePickerResult!=null){
File file=File(filePickerResult.files.single.path!);
String filePath=file.path;
String fileName=file.path.split('/').last;
Uint8List? fileInBytes=file.readAsBytesSync();
String? docFileData=base64Encode(fileInBytes);
final body = {

       "Parameters": [
         {
           "Name": "File",
           "FileValue": {
             "Name": fileName,
             "Data": docFileData
           }
         },
         {
           "Name": "StoreFile",
           "Value": true
         }
       ]

    };

http.Response response = await http.post(
 Uri.parse(url), 
 body: jsonEncode(body), 
 headers: {"Content-Type": "application/json"}
);
print(response.body);
var abc=jsonDecode(response.body);
String fileUrl=abc['Files'][0]['Url'];


final Uint8List bytes = await InternetFile.get(
    fileUrl,
    process: (percentage) {
        print('downloadPercentage: $percentage');
    },
);
var file1=await File('${_localPath}/${abc['Files'][0]['FileName']}').writeAsBytes(bytes);
print(file1);
  }
  
}
convertPdfToJpg() async{
     String _localPath = await ExternalPath.getExternalStoragePublicDirectory(
        ExternalPath.DIRECTORY_DOWNLOADS);
String url='https://v2.convertapi.com/convert/pdf/to/jpg?Secret=LN72qmLNad8Jwa8J';
var filePickerResult = await FilePicker.platform.pickFiles(
  allowMultiple: false,
  type: FileType.custom,
  allowedExtensions: ['pdf'],
  

);
if(filePickerResult!=null){
File file=File(filePickerResult.files.single.path!);
String filePath=file.path;
String fileName=file.path.split('/').last;
Uint8List? fileInBytes=file.readAsBytesSync();
String? docFileData=base64Encode(fileInBytes);
final body = {

       "Parameters": [
         {
           "Name": "File",
           "FileValue": {
             "Name": fileName,
             "Data": docFileData
           }
         },
         {
           "Name": "StoreFile",
           "Value": true
         }
       ]

    };

http.Response response = await http.post(
 Uri.parse(url), 
 body: jsonEncode(body), 
 headers: {"Content-Type": "application/json"}
);
print(response.body);
var abc=jsonDecode(response.body);
String fileUrl=abc['Files'][0]['Url'];


final Uint8List bytes = await InternetFile.get(
    fileUrl,
    process: (percentage) {
        print('downloadPercentage: $percentage');
    },
    
);
var file1=await File('${_localPath}/${abc['Files'][0]['FileName']}').writeAsBytes(bytes);
print(file1);
  }
  
}
}
// Configure words api client
