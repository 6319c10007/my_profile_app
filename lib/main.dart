// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:my_profile_app/views/home_ui.dart';

void main() {
  runApp(
    MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomeUi(),
      theme: ThemeData(
        fontFamily: 'Kanit',
        
      ),
    ),
  );
}