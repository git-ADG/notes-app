import 'dart:math';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notes/style/app_style.dart';

class NoteEditorScreen extends StatefulWidget {
  const NoteEditorScreen({super.key});

  @override
  State<NoteEditorScreen> createState() => _NoteEditorScreenState();
}

int? color_id;
TextEditingController _titleController = TextEditingController();
TextEditingController _mainController = TextEditingController();
String date = DateTime.now().toString();

class _NoteEditorScreenState extends State<NoteEditorScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _titleController.text='';
    _mainController.text='';
    color_id=Random().nextInt(AppStyle.cardColors.length);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppStyle.cardColors[color_id!],
      appBar: AppBar(
        backgroundColor: AppStyle.cardColors[color_id!],
        elevation: 0.0,
        centerTitle: true,
        title: const Text(
          "Add a new note",
          style: TextStyle(color: Colors.black),
        ),
        iconTheme: const IconThemeData(color: Colors.black),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _titleController,
              style: AppStyle.mainTitle,
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: "Note Title"),
            ),
            const SizedBox(
              height: 8,
            ),
            Text(
              date,
              style: AppStyle.dateTitle,
            ),
            const SizedBox(
              height: 28,
            ),
            TextField(
              controller: _mainController,
              keyboardType: TextInputType.multiline,
              maxLines: null,
              style: AppStyle.mainContent,
              decoration: const InputDecoration(
                  border: InputBorder.none, hintText: "Note Content"),
            )
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          FirebaseFirestore.instance.collection("Notes").add({
            "notes_title": _titleController.text,
            "creation_date": date,
            "notes_content": _mainController.text,
            "color_id": color_id
          }).then((value) {
            Navigator.pop(context);
          });
        },
        backgroundColor: AppStyle.accentColor,
        child: const Icon(Icons.save),
      ),
    );
  }
}
