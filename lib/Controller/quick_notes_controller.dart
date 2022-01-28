import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wps_rp/Model/note_model.dart';
import 'package:wps_rp/db/database_provider.dart';

class QuickNotes extends GetxController {
  // List<dynamic> notesList = [];
  // getNotes() async {
  //   notesList = await DatabaseProvider.db.getNotes();
  //   update();
  // }

  late List<Note> notes;
  bool isLoading = false;

  Future refreshNotes() async {
    isLoading = true;
    this.notes = await NotesDatabase.instance.readAllNotes();
    isLoading = false;
  }
}
