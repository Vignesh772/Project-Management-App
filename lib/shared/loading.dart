import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';


class Loading extends StatelessWidget {

  @override

  Widget build(BuildContext context) {

    Color c = const Color.fromRGBO(82,71,215,1);
    return Container(

        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image: AssetImage(
                'assets/backround.png'),
            fit: BoxFit.fill,
          ),

        ),
      child: Center(

        child: SpinKitFadingCircle(
          color: c,
          size: 100.0,
        ),

    )



    );
  }
}
