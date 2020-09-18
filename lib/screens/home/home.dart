import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:recon_subsea_app/domains/todo.dart';
import 'package:recon_subsea_app/models/arguments.dart';

import 'package:recon_subsea_app/services/auth.dart';
//import 'package:ninja_brew/shared/expansions.dart';

class Home  extends StatelessWidget {
  final AuthService _auth=AuthService();
  Color c = const Color.fromRGBO(82,71,215,1);
  Color text_color = const Color.fromRGBO(158,158,159,1);
  String _value = 'Coding';
  @override
  Widget build(BuildContext context) {



    return //StreamProvider<List<Brew>>.value(
      //value:DataBaseService().brews,
      //child:
      Scaffold(


        //backgroundColor: Colors.transparent,


        /*appBar: AppBar(


          //backgroundColor: Colors.grey[900],
          elevation: 20.0,
          actions: <Widget>[
            FlatButton.icon(onPressed: () async {
              await _auth.signOut();
              }, icon: Icon(Icons.person,color: Colors.white,), label: Text('Log Out',style: TextStyle(color: Colors.white),)),



          ],


         ),

         */
         body: Container(

             decoration: BoxDecoration(
               color: Colors.black,
               image: DecorationImage(

                 image: AssetImage(
                     'assets/background2.jpeg'),
                 fit: BoxFit.fill,
               ),

             ),




               child: SingleChildScrollView(
                 child: Column(
                   children: <Widget>[


                     SizedBox(height: 35,),
                     Row(
                       mainAxisAlignment: MainAxisAlignment.end,
                       children: <Widget>[
                         FlatButton.icon(onPressed: () async {
                           await _auth.signOut();
                           Navigator.pushNamedAndRemoveUntil(context, '/signin',  (Route<dynamic> route) => false);
                          }, icon: Icon(Icons.person,color: Colors.white,), label: Text('Logout',style: TextStyle(fontSize:20,color: Colors.white),)),
                       ],
                     ),

                     Padding(
                       padding: const EdgeInsets.fromLTRB(40,10,40,0),
                       child: Column(

                         crossAxisAlignment: CrossAxisAlignment.stretch,
                         children: <Widget>[


                           SizedBox(height: 70.0),

                           Text(
                             'DOMAINS',
                             style: TextStyle(
                               fontSize: 45.0,
                               color: Colors.white,
                               fontWeight: FontWeight.bold,
                             ),
                           ),
                           SizedBox(height: 60.0),
                           Container(
                               decoration: BoxDecoration(
                                   border: Border.all(
                                     color: c,
                                     width: 5,
                                   ),
                                   borderRadius: BorderRadius.all(Radius.circular(18))
                               ),
                               child:
                               ExpansionTile(
                                 leading:Icon(
                                   Icons.computer,
                                   color: Colors.white,
                                   size: 50.0,

                                 ),

                                 title: Padding(
                                   padding: const EdgeInsets.all(10.0),
                                   child: Text(

                                     "Coding",
                                     style: TextStyle(
                                         fontSize: 28.0,
                                         color: Colors.white,
                                         fontWeight: FontWeight.bold
                                     ),


                                   ),
                                 ),
                                 children: <Widget>[

                                   Column(
                                     crossAxisAlignment: CrossAxisAlignment.start,

                                     children: <Widget>[
                                       RaisedButton.icon(
                                         color: Colors.transparent,
                                         label: Text('To do',style: TextStyle(color:c,fontSize: 20),),
                                         icon: Icon(Icons.assignment,size: 30,color: Colors.red),
                                         textColor: Colors.white,
                                         onPressed: (){
                                           Navigator.pushNamed(context, '/todo',arguments: ScreenArguments(domain:'Coding'));

                                         },

                                       ),
                                       SizedBox(height: 10,),
                                       RaisedButton.icon(
                                         color: Colors.transparent,
                                         label: Text('In Progress',style: TextStyle(color:c,fontSize: 20),),
                                         icon: Icon(Icons.group_work,size: 30,color: Colors.white),
                                         textColor: Colors.white,
                                         onPressed: (){
                                           Navigator.pushNamed(context, '/progress',arguments: ScreenArguments(domain:'Coding'));

                                         },

                                       ),

                                       SizedBox(height: 10,),
                                       RaisedButton.icon(
                                         color: Colors.transparent,
                                         label: Text('Done',style: TextStyle(color:c,fontSize: 20),),
                                         icon: Icon(Icons.check,size: 30,color: Colors.green),
                                         textColor: Colors.white,
                                         onPressed: (){
                                           Navigator.pushNamed(context, '/done',arguments: ScreenArguments(domain:'Coding'));

                                         },

                                       ),
                                     ],
                                   ),


                                 ],
                               ),

                           ),

                          SizedBox(height: 30,),
                           Container(
                             decoration: BoxDecoration(
                                 border: Border.all(
                                   color: c,
                                   width: 5,
                                 ),
                                 borderRadius: BorderRadius.all(Radius.circular(18))
                             ),
                             child:
                             ExpansionTile(
                                 leading:Icon(
                                   Icons.power,
                                   color: Colors.white,
                                   size: 50.0,

                                 ),

                               title: Padding(
                                 padding: const EdgeInsets.all(10.0),
                                 child: Text(

                                   "EPS",
                                   style: TextStyle(
                                       fontSize: 28.0,
                                       color: Colors.white,
                                       fontWeight: FontWeight.bold
                                   ),


                                 ),
                               ),
                               children: <Widget>[

                                 Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,

                                   children: <Widget>[
                                     RaisedButton.icon(
                                       color: Colors.transparent,
                                       label: Text('To do',style: TextStyle(color:c,fontSize: 20),),
                                       icon: Icon(Icons.assignment,size: 30,color: Colors.redAccent),
                                       textColor: Colors.white,
                                       onPressed: (

                                           ){
                                         Navigator.pushNamed(context, '/todo',arguments: ScreenArguments(domain:'EPS'));

                                       },

                                     ),
                                     SizedBox(height: 10,),
                                     RaisedButton.icon(
                                       color: Colors.transparent,
                                       label: Text('In Progress',style: TextStyle(color:c,fontSize: 20),),
                                       icon: Icon(Icons.group_work,size: 30,color: Colors.white),
                                       textColor: Colors.white,
                                       onPressed: (){
                                         Navigator.pushNamed(context, '/progress',arguments: ScreenArguments(domain:'EPS'));

                                       },

                                     ),

                                     SizedBox(height: 10,),
                                     RaisedButton.icon(
                                       color: Colors.transparent,
                                       label: Text('Done',style: TextStyle(color:c,fontSize: 20),),
                                       icon: Icon(Icons.check,size: 30,color: Colors.green),
                                       textColor: Colors.white,
                                       onPressed: (){
                                         Navigator.pushNamed(context, '/done',arguments: ScreenArguments(domain:'EPS'));

                                       },

                                     ),
                                   ],
                                 ),


                               ],
                             ),

                           ),



                           SizedBox(height: 30,),
                           Container(
                             decoration: BoxDecoration(
                                 border: Border.all(
                                   color: c,
                                   width: 5,
                                 ),
                                 borderRadius: BorderRadius.all(Radius.circular(18))
                             ),
                             child:
                             ExpansionTile(
                               leading:Icon(
                                 Icons.build,
                                 color: Colors.white,
                                 size: 50.0,

                               ),

                               title: Padding(
                                 padding: const EdgeInsets.all(10.0),
                                 child: Text(

                                   "Mechanical",
                                   style: TextStyle(
                                       fontSize: 28.0,
                                       color: Colors.white,
                                       fontWeight: FontWeight.bold
                                   ),


                                 ),
                               ),
                               children: <Widget>[

                                 Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,

                                   children: <Widget>[
                                     RaisedButton.icon(
                                       color: Colors.transparent,
                                       label: Text('To do',style: TextStyle(color:c,fontSize: 20),),
                                       icon: Icon(Icons.assignment,size: 30,color: Colors.redAccent),
                                       textColor: Colors.white,
                                       onPressed: (){
                                         Navigator.pushNamed(context, '/todo',arguments: ScreenArguments(domain:'Mechanical'));

                                       },

                                     ),
                                     SizedBox(height: 10,),
                                     RaisedButton.icon(
                                       color: Colors.transparent,
                                       label: Text('In Progress',style: TextStyle(color:c,fontSize: 20),),
                                       icon: Icon(Icons.group_work,size: 30,color: Colors.white),
                                       textColor: Colors.white,
                                       onPressed: (){
                                         Navigator.pushNamed(context, '/progress',arguments: ScreenArguments(domain:'Mechanical'));

                                       },

                                     ),

                                     SizedBox(height: 10,),
                                     RaisedButton.icon(
                                       color: Colors.transparent,
                                       label: Text('Done',style: TextStyle(color:c,fontSize: 20),),
                                       icon: Icon(Icons.check,size: 30,color: Colors.green),
                                       textColor: Colors.white,
                                       onPressed: (){
                                         Navigator.pushNamed(context, '/done',arguments: ScreenArguments(domain:'Mechanical'));

                                       },

                                     ),
                                   ],
                                 ),


                               ],
                             ),

                           ),


                           SizedBox(height: 30,),
                           Container(
                             decoration: BoxDecoration(
                                 border: Border.all(
                                   color: c,
                                   width: 5,
                                 ),
                                 borderRadius: BorderRadius.all(Radius.circular(18))
                             ),
                             child:
                             ExpansionTile(
                               leading:Icon(
                                 Icons.supervisor_account,
                                 color: Colors.white,
                                 size: 50.0,

                               ),

                               title: Padding(
                                 padding: const EdgeInsets.all(10.0),
                                 child: Text(

                                   "Corporate",
                                   style: TextStyle(
                                       fontSize: 28.0,
                                       color: Colors.white,
                                       fontWeight: FontWeight.bold
                                   ),


                                 ),
                               ),
                               children: <Widget>[

                                 Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,

                                   children: <Widget>[
                                     RaisedButton.icon(
                                       color: Colors.transparent,
                                       label: Text('To do',style: TextStyle(color:c,fontSize: 20),),
                                       icon: Icon(Icons.assignment,size: 30,color: Colors.redAccent),
                                       textColor: Colors.white,
                                       onPressed: (){
                                         Navigator.pushNamed(context, '/todo',arguments: ScreenArguments(domain:'Corporate'));

                                       },

                                     ),
                                     SizedBox(height: 10,),
                                     RaisedButton.icon(
                                       color: Colors.transparent,
                                       label: Text('In Progress',style: TextStyle(color:c,fontSize: 20),),
                                       icon: Icon(Icons.group_work,size: 30,color: Colors.white),
                                       textColor: Colors.white,
                                       onPressed: (){
                                         Navigator.pushNamed(context, '/progress',arguments: ScreenArguments(domain:'Corporate'));


                                       },

                                     ),

                                     SizedBox(height: 10,),
                                     RaisedButton.icon(
                                       color: Colors.transparent,
                                       label: Text('Done',style: TextStyle(color:c,fontSize: 20),),
                                       icon: Icon(Icons.check,size: 30,color: Colors.green),
                                       textColor: Colors.white,
                                       onPressed: (){
                                         Navigator.pushNamed(context, '/done',arguments: ScreenArguments(domain:'Corporate'));


                                       },

                                     ),
                                   ],
                                 ),


                               ],
                             ),

                           ),

                           SizedBox(height: 30,),
                           Container(
                             decoration: BoxDecoration(
                                 border: Border.all(
                                   color: c,
                                   width: 5,
                                 ),
                                 borderRadius: BorderRadius.all(Radius.circular(18))
                             ),
                             child:
                             ExpansionTile(

                               leading:Icon(
                                 Icons.color_lens,
                                 color: Colors.white,
                                 size: 50.0,

                               ),

                               title: Padding(
                                 padding: const EdgeInsets.all(10.0),
                                 child: Text(

                                   "Graphic Design",
                                   style: TextStyle(
                                       fontSize: 28.0,
                                       color: Colors.white,
                                       fontWeight: FontWeight.bold
                                   ),


                                 ),
                               ),
                               children: <Widget>[

                                 Column(
                                   crossAxisAlignment: CrossAxisAlignment.start,

                                   children: <Widget>[
                                     RaisedButton.icon(
                                       color: Colors.transparent,
                                       label: Text('To do',style: TextStyle(color:c,fontSize: 20),),
                                       icon: Icon(Icons.assignment,size: 30,color: Colors.redAccent),
                                       textColor: Colors.white,
                                       onPressed: (){
                                         Navigator.pushNamed(context, '/todo',arguments: ScreenArguments(domain:'Graphic Design'));

                                       },

                                     ),
                                     SizedBox(height: 10,),
                                     RaisedButton.icon(
                                       color: Colors.transparent,
                                       label: Text('In Progress',style: TextStyle(color:c,fontSize: 20),),
                                       icon: Icon(Icons.group_work,size: 30,color: Colors.white),
                                       textColor: Colors.white,
                                       onPressed: (){
                                         Navigator.pushNamed(context, '/progress',arguments: ScreenArguments(domain:'Graphic Design'));


                                       },

                                     ),

                                     SizedBox(height: 10,),
                                     RaisedButton.icon(
                                       color: Colors.transparent,
                                       label: Text('Done',style: TextStyle(color:c,fontSize: 20),),
                                       icon: Icon(Icons.check,size: 30,color: Colors.green),
                                       textColor: Colors.white,
                                       onPressed: (){
                                         Navigator.pushNamed(context, '/done',arguments: ScreenArguments(domain:'Graphic Design'));


                                       },

                                     ),



                                   ],
                                 ),


                               ],
                             ),

                           ),
                           SizedBox(height: 27,),


                            /*


                           RaisedButton.icon(
                             shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(18.0),
                               side: BorderSide(color: c ,width: 5),
                             ),
                             icon: Icon(
                               Icons.computer,
                               color: Colors.white,
                               size: 50.0,

                             ),
                             label: Text('Coding',
                               style: TextStyle(
                                 color: Colors.white,
                                 fontSize: 30.0,
                                 fontWeight: FontWeight.bold,
                               ),),
                             padding: EdgeInsets.all(15.0),
                             color: Colors.transparent,

                             onPressed: (){

                               Navigator.pushNamed(context,'/coding');

                             },
                           ),
                           SizedBox(height: 20.0),
                           RaisedButton.icon(
                             shape: RoundedRectangleBorder(
                                 borderRadius: BorderRadius.circular(18.0),
                                 side: BorderSide(color: c,width: 5),
                             ),
                             icon: Icon(
                               Icons.power,
                               color: Colors.white,
                               size: 50.0,

                             ),
                             label: Text('EPS',
                             style: TextStyle(
                               color:Colors.white,
                               fontSize: 30.0,
                               fontWeight: FontWeight.bold,
                             ),),
                             padding: EdgeInsets.all(15.0),
                             color: Colors.transparent,

                             onPressed: (){
                               Navigator.pushNamed(context,'/eps');

                             },
                           ),
                           SizedBox(height: 20.0),
                           RaisedButton.icon(
                             shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(18.0),
                               side: BorderSide(color: c,width: 5),
                             ),
                             icon: Icon(
                               Icons.build,
                               color: Colors.white,
                               size: 50.0,

                             ),
                             label: Text('Mechanical',
                               style: TextStyle(
                                 color: Colors.white,
                                 fontSize: 30.0,
                                 fontWeight: FontWeight.bold,
                               ),),
                             padding: EdgeInsets.all(15.0),
                             color: Colors.transparent,

                             onPressed: (){
                               Navigator.pushNamed(context,'/mechanical');

                             },
                           ),
                           SizedBox(height: 20.0),
                           RaisedButton.icon(
                             shape: RoundedRectangleBorder(
                               borderRadius: BorderRadius.circular(18.0),
                               side: BorderSide(color:c ,width: 5),
                             ),
                             icon: Icon(
                               Icons.supervisor_account,
                               color: Colors.white,
                               size: 50.0,

                             ),
                             label: Text('Corporate',
                               style: TextStyle(
                                 color: Colors.white,
                                 fontSize: 30.0,
                                 fontWeight: FontWeight.bold,
                               ),),
                             padding: EdgeInsets.all(15.0),
                             color: Colors.transparent,

                             onPressed: (){
                               Navigator.pushNamed(context,'/corporate');

                             },
                           ),
                           SizedBox(height: 20.0),
                           RaisedButton.icon(
                             shape: RoundedRectangleBorder(

                               borderRadius: BorderRadius.circular(18.0),
                               side: BorderSide(color: c,width: 5),
                             ),
                             icon: Icon(
                               Icons.color_lens,
                               color: Colors.white,
                               size: 50.0,

                             ),
                             label: Text('Graphic design',
                               style: TextStyle(
                                 color: Colors.white,
                                 fontSize: 30.0,
                                 fontWeight: FontWeight.bold,
                               ),),
                             padding: EdgeInsets.all(15.0),
                             color: Colors.transparent,

                             onPressed: (){
                               Navigator.pushNamed(context,'/gd');

                             },
                           ),
                           */


                         ],
                       ),
                     ),
                   ],
                 ),
               ),
             )




      //),

    );
  }
}
