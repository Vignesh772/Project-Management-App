import 'package:flutter/material.dart';
    const textInputDecoration= InputDecoration(
    hintStyle: TextStyle(
        color: Colors.grey,
    ),


    enabledBorder: UnderlineInputBorder(

    borderSide: BorderSide(color: Colors.blue,width: 2.0),

    ),
    focusedBorder: UnderlineInputBorder(

    borderSide: BorderSide(color: Colors.redAccent,width: 2.0),
    ),
    //filled: true,
    //fillColor: Colors.grey,
    );