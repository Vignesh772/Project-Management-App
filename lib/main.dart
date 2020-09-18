import 'package:flutter/material.dart';

import 'package:recon_subsea_app/domains/done.dart';

import 'package:recon_subsea_app/domains/progress.dart';
import 'package:recon_subsea_app/domains/todo.dart';
import 'package:recon_subsea_app/models/user.dart';
import 'package:recon_subsea_app/screens/authenticate/signin.dart';
import 'package:recon_subsea_app/screens/home/home.dart';
import 'package:recon_subsea_app/screens/wrapper.dart';
import 'package:recon_subsea_app/services/auth.dart';
import 'package:provider/provider.dart';
import 'domains/progress.dart';
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return StreamProvider<User>.value(
      value:AuthService().user,

      child: MaterialApp(

        initialRoute: '/',
        routes: {
          '/home' :(context)=>Home(),
          '/signin' :(context)=>SignIn(),

          '/todo': (context) => Todo(),
          '/done': (context) => Done(),
          '/progress': (context) => Progress(),


        },


        home: Wrapper(),

      ),
    );
  }
}
