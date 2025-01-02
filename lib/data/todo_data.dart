import 'dart:developer';
import 'dart:io';

import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

Future<List<Map<String, dynamic>>> getTodos() async {
  try {
    QuerySnapshot querySnapshot = await FirebaseFirestore.instance.collection('todos').get();
    List<Map<String, dynamic>> todos = querySnapshot.docs.map((doc) {
      return {
        'title': doc['title'],
        'description': doc['description'],
      };
    }).toList();
    log("hi");
    return todos;
    
  } catch (e) {
    print('Error fetching todos: $e');
    return [];
  }
}
