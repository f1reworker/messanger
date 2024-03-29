import 'package:flutter/material.dart';
import 'package:learning/pages/Direct.dart';
import 'package:learning/pages/Authorization.dart';
import 'package:learning/pages/NewMessage.dart';
import 'const.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_core/firebase_core.dart';

void initFirebase() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp();
}

void main(){
  initFirebase();
  runApp(MaterialApp(
    theme: ThemeData.dark(),
    initialRoute: "/",
    routes: {
      '/': (context) => const Authorization(),
      '/direct': (context) => const Direct(),
      '/newMessage': (context) => const NewMessage()
    },
  ));
}

