import 'package:flutter/material.dart';
import 'package:recon_subsea_app/services/auth.dart';
import 'package:recon_subsea_app/shared/constants.dart';
import 'package:recon_subsea_app/shared/loading.dart';

class Register extends StatefulWidget {
  final Function toggleView;
  Register({this.toggleView});
  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final AuthService _auth =AuthService();
  final _formKey = GlobalKey<FormState>();
  bool loading=false;

  String email="";
  String password="";
  String retypepassword="";
  String error="";

  Color c = const Color.fromRGBO(4,4,28,1);
  Color signup_border =const Color.fromRGBO(156,21,31,1);
  Color signin_border =const Color.fromRGBO(114, 0, 43,1);
  @override
  Widget build(BuildContext context) {
    return  loading? Loading() :Scaffold(
      backgroundColor: c,
      /*appBar: AppBar(
        actions: <Widget>[
          FlatButton.icon(onPressed: (){
            widget.toggleView();


          }, icon: Icon(Icons.person), label: Text('Sign In',style: TextStyle(color: Colors.white),)),
        ],
        backgroundColor: Colors.grey[700],
        elevation: 0.0,
        title: Text('Sign Up To Recon Subsea'),

      ),*/
      body:
          Container(

            padding: const EdgeInsets.symmetric(horizontal:50.0 ,vertical: 20.0),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage(
                    'assets/backround.png'),
                fit: BoxFit.fill,
              ),

            ),


            child: SingleChildScrollView(
              child: Column(

                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: <Widget>[
                  SizedBox(height: 90,),
                  Text('New User Registration',style: TextStyle(
                    fontSize: 25.0,
                    fontWeight: FontWeight.bold,
                    color:Colors.white,

                  ),),
                  SizedBox(height: 200,),
                  Text("Existing user?",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  SizedBox(height: 15,),
                  FlatButton(onPressed: (){
                    widget.toggleView();
                  },

                      color: Colors.transparent,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(18.0),
                          side: BorderSide(color: signup_border)
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(10.0),
                        child: Text(
                          'SIGN IN',

                          style: TextStyle(
                              fontSize: 20.0,
                              color: signup_border),),
                      )
                  ),

                  Form(
                    key: _formKey,
                      child:SingleChildScrollView(
                        child: Column(
                          children: <Widget>[
                            SizedBox(height: 20.0),
                            TextFormField(
                              decoration: textInputDecoration.copyWith(hintText: 'Email'),
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              validator: (val) => (val.isEmpty)? 'Enter email' : null,
                              onChanged: (val){
                                setState(() {
                                  email=val;
                                });

                              },
                            ),
                            SizedBox(height: 20.0),
                            TextFormField(
                              decoration: textInputDecoration.copyWith(hintText: 'Password'),
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              validator: (val) => (val.length<6)? 'Password should contain atleast 6 characters' : null,
                              obscureText: true,
                              onChanged: (val){
                                setState(() {
                                  password=val;
                                });
                              },
                            ),
                            SizedBox(height: 20.0),
                            TextFormField(
                              decoration: textInputDecoration.copyWith(hintText: 'Confirm Password'),
                              style: TextStyle(
                                color: Colors.white,
                              ),
                              validator: (val) => (val!=password)? 'Password did not match' : null,
                              obscureText: true,
                              onChanged: (val){
                                setState(() {
                                  retypepassword=val;
                                });
                              },
                            ),
                            SizedBox(height: 50.0),
                            RaisedButton(
                              shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(18.0),
                                  side: BorderSide(color: signin_border)
                              ),
                              color: signin_border,
                              child: Padding(
                                padding: const EdgeInsets.fromLTRB(50,15,50,15),
                                child: Text('Register',

                                    style: TextStyle(fontSize:20,color:Colors.white)),
                              ),
                              onPressed: ()async{
                                if(_formKey.currentState.validate()) {
                                  setState(() {
                                    loading=true;
                                  });
                                  dynamic result=await _auth.registerWithEmailAndPassword(email,password);
                                  if(result==null){
                                    setState(() {
                                      loading=false;
                                      error='please supply a valid email';
                                    });

                                  }
                                  else{
                                    Navigator.pushNamed(context, '/home');
                                  }

                                }

                              }
                              ,
                            ),
                            SizedBox(height: 12.0),
                            Text(error,
                            style: TextStyle(
                              color:Colors.red,fontSize: 14.0),
                            ),
                            //SizedBox(height: 140.0),
                            //Image.asset('assets/recon_logo.jpg'),


                          ],
                        ),
                      )

                  ),
                ],
              ),
            ),
          ),



    );
  }
}
