import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:notes/style/app_style.dart';

Widget NoteCard(Function()? onTap, QueryDocumentSnapshot doc) {
  return InkWell(
    onTap: onTap,
    child: Container(
      padding: const EdgeInsets.all(8),
      margin: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: AppStyle.cardColors[doc['color_id']],
        borderRadius: BorderRadius.circular(8),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            doc['notes_title'],
            style: AppStyle.mainTitle,
          ),
          const SizedBox(
            height: 4,
          ),
          Text(
            doc['creation_date'],
            style: AppStyle.dateTitle,
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            doc['notes_content'],
            style: AppStyle.mainContent,
            overflow: TextOverflow.ellipsis,
          ),
        ],
      ),
    ),
  );
}
