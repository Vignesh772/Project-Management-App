import 'package:flutter/material.dart';
import 'package:recon_subsea_app/models/arguments.dart';
import 'package:recon_subsea_app/screens/home/done_list.dart';
import 'package:recon_subsea_app/services/auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:recon_subsea_app/shared/loading.dart';

class Done extends StatefulWidget {
  @override
  _DoneState createState() => _DoneState();
}

class _DoneState extends State<Done> {


  final myController = TextEditingController();
  var tempOutput;
  String _field;

  final AuthService _auth=AuthService();

  @override
  void dispose() {
    // Clean up the controller when the widget is disposed.
    myController.dispose();
    super.dispose();
  }
  Widget build(BuildContext context) {

    final ScreenArguments args = ModalRoute.of(context).settings.arguments;
    Color add_button =const Color.fromRGBO(56,61,148,1);
    Color dialog_color = const Color.fromRGBO(7,7,25,1);




    return StreamBuilder(
        stream: Firestore.instance.collection('domains').document(args.domain).snapshots(),

        builder: (context, snapshot) {
          if(!snapshot.hasData){
            Loading();
          }
          return Scaffold(
            body: Container(
              decoration: BoxDecoration(
                color: Colors.black,
                image: DecorationImage(

                  image: AssetImage(
                      'assets/background2.jpeg'),
                  fit: BoxFit.fill,
                ),

              ),

              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(height: 35),
                  Row(
                    children: <Widget>[
                      FlatButton.icon(
                          color: Colors.transparent,
                          onPressed: () {
                            Navigator.pop(context);
                          },
                          icon: Icon(
                            Icons.arrow_back, color: Colors.white, size: 40,),
                          label: Text("")),

                      SizedBox(width: 190,),

                      FlatButton.icon(onPressed: () async {
                        await _auth.signOut();
                        Navigator.pushNamedAndRemoveUntil(context, '/signin', (
                            Route<dynamic> route) => false);
                      },
                          icon: Icon(Icons.person, color: Colors.white,),
                          label: Text('Logout', style: TextStyle(fontSize: 20,
                              color: Colors.white),)),

                    ],
                  ),

                  SizedBox(height: 40),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 0, 0,),
                    child: Text('DOMAINS',
                      style: TextStyle(
                        color: Colors.grey,
                        fontSize: 20.0,
                        fontWeight: FontWeight.normal,
                      )
                      ,),
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 0, 0, 0,),
                    child: Text(args.domain,
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 40.0,
                        fontWeight: FontWeight.bold,
                      )
                      ,),
                  ),

                  Padding(
                    padding: const EdgeInsets.fromLTRB(30, 10, 0, 0),
                    child: Row(
                      children: <Widget>[
                        Icon(
                          Icons.assignment, size: 25, color: Colors.redAccent,),
                        Text(' Done ', style: TextStyle(color: Colors
                            .blueAccent,
                            fontSize: 25,
                            fontWeight: FontWeight.bold),),
                        SizedBox(width: 110,),
                        RaisedButton.icon(
                          color: Colors.transparent,
                          onPressed: () {
                            showDialog(

                                context: context,

                                builder: (_) =>
                                new AlertDialog(
                                  backgroundColor: dialog_color,
                                  shape: RoundedRectangleBorder(
                                      borderRadius:
                                      BorderRadius.all(
                                          Radius.circular(10.0))),
                                  content: Builder(

                                    builder: (context) {
                                      // Get available height and width of the build area of this widget. Make a choice depending on the size.
                                      var height = MediaQuery
                                          .of(context)
                                          .size
                                          .height;
                                      var width = MediaQuery
                                          .of(context)
                                          .size
                                          .width;

                                      return Container(

                                        height: height - 700,
                                        width: width - 400,
                                        child: Column(

                                          children: <Widget>[
                                            new TextField(
                                              decoration: new InputDecoration(
                                                hintText: 'Add New',
                                                enabledBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: Colors.white,
                                                      width: 2.0),
                                                ),
                                                focusedBorder: OutlineInputBorder(
                                                  borderSide: BorderSide(
                                                      color: add_button,
                                                      width: 2.0),
                                                ),
                                                filled: true,
                                                fillColor: Colors.white,
                                              ),
                                              controller: myController,

                                            ),
                                            SizedBox(height: 20),
                                            FlatButton(

                                                onPressed: () {
                                                  setState(() {
                                                    this._field= myController.text;
                                                    tempOutput = new List<String>.from(snapshot.data['done']);

                                                    tempOutput.add(this._field);
                                                    tempOutput.remove('');

                                                    print(snapshot.data['done']);


                                                  });
                                                  print("temp output ");
                                                  print(tempOutput);
                                                  Firestore.instance.collection('domains').document(args.domain).setData(
                                                      {'todo': snapshot.data['todo'] ,'progress':snapshot.data['progress'],'done':tempOutput});

                                                  Navigator.pop(context);
                                                },
                                                color: add_button,
                                                shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius
                                                        .circular(18.0),
                                                    side: BorderSide(
                                                        color: add_button)
                                                ),
                                                child: Padding(
                                                  padding: const EdgeInsets.all(
                                                      10.0),
                                                  child: Text(
                                                    'Add',

                                                    style: TextStyle(
                                                        fontSize: 20.0,
                                                        color: Colors.white),),
                                                )
                                            ),
                                          ],
                                        ),
                                      );
                                    },
                                  ),
                                )
                            );

                            //ADD A TASK BACKEND CODE
                          },
                          icon: Icon(Icons.add, size: 25,
                            color: Colors.redAccent,),
                          label: Text('ADD ', style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 25,
                              fontWeight: FontWeight.bold),),)
                      ],

                    ),
                  ),
                  Container(
                    child: DoneList(domain:args.domain),

                  ),


                ],
              ),


            ),
          );
        }
    );
  }



}

