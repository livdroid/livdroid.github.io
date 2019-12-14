import 'package:altica_app/ui/messages_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'ui/home_page.dart';

class AlticaApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Altica',
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => HomePage(),
        '/messages': (context) => MessagesPage(),
      },
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
    );
  }
}