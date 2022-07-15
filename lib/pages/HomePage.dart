import 'package:flutter/material.dart';
import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  String userName= '';

  @override
  // ignore: must_call_super
  void initState(){
    super.initState();
    getUser();
  }

  void getUser() async{
    SharedPreferences prefs = await SharedPreferences.getInstance();
    userName= prefs.getString('username');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Direct'),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: ListView(
          padding: EdgeInsets.zero,
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                  color: Colors.blueAccent.withOpacity(0.45)
              ),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text('Hello,', style: TextStyle(fontSize: 20),),
                    Text('$userName!',
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,

                      ),
                    ),
                  ],
                )
              )
            ),
            ListTile(
              leading: const Icon(Icons.logout,),
              title: const Text('Log out'),
              onTap: ()async{
                Navigator.pop(context);
                Navigator.pushReplacementNamed(context, '/');
                SharedPreferences prefs = await SharedPreferences.getInstance();
                prefs.remove('username');
                prefs.remove('password');
              },
            ),
          ],
        ),
      ),
      body: SafeArea(
        maintainBottomViewPadding: true,
        child: Column(
          children: [
            Card(
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: const <Widget>[
                  ListTile(
                    leading: CircleAvatar(
                      backgroundColor: Colors.white,
                      radius: 60.0,
                      child: CircleAvatar(
                        backgroundColor: Colors.blue,
                        radius: 40.0,
                      ),
                    ),
                    title: Text('User nickname'),
                    subtitle: Text('Message'),
                  ),
                ],
              )


            )
          ],
        ),
      ),
    );
  }
}
