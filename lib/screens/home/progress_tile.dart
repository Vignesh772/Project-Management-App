import 'package:flutter/material.dart';
import 'package:recon_subsea_app/models/tasks.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class ProgressTile extends StatelessWidget {

  final Task tasks;
  final domain;
  ProgressTile({this.tasks,this.domain});

  @override
  Widget build(BuildContext context) {
    Color c = const Color.fromRGBO(56,61,148,1);
    if(tasks.task is String) {
      print(tasks.task);
      //print(tasks.num);
    }



    return StreamBuilder(
        stream: Firestore.instance.collection('domains').document(domain).snapshots(),
      builder: (context, snapshot) {
        return Padding(
          padding: const EdgeInsets.fromLTRB(30.0,0,30,20),
          child: Card(

            shape: RoundedRectangleBorder(

              borderRadius: BorderRadius.circular(20.0),


            ),
            color: c,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: <Widget>[
                ListTile(
                  leading: Icon(Icons.arrow_forward_ios),
                  title: Text(tasks.task ,style: TextStyle(color: Colors.white,fontSize: 25),),
                  //subtitle: Text('Music by Julie Gable. Lyrics by Sidney Stein.'),
                ),
                ButtonBar(
                  children: <Widget>[

                    FlatButton(
                      child: const Text('Delete',style: TextStyle(color:Colors.redAccent),),
                      onPressed: () {

                        var temp_progress = new List<String>.from(snapshot.data['progress']);
                        //print(tasks.task);
                        temp_progress.remove(tasks.task);
                        print(temp_progress);
                        Firestore.instance.collection('domains').document(domain).setData(
                            {'todo': snapshot.data['todo'] ,'progress':temp_progress,'done':snapshot.data['done']});
                      },
                    ),
                    FlatButton(
                      child: const Text('To do',style: TextStyle(color:Colors.white),),
                      onPressed: () {
                        var temp_todo = new List<String>.from(snapshot.data['todo']);
                        var temp_progress= new List<String>.from(snapshot.data['progress']);
                        //print(tasks.task);
                        temp_progress.remove(tasks.task);
                        temp_todo.add(tasks.task);

                        //print(temp_todo);
                        Firestore.instance.collection('domains').document(domain).setData(
                            {'todo': temp_todo ,'progress':temp_progress,'done':snapshot.data['done']});


                      },
                    ),
                    FlatButton(
                      child: const Text('Done',style: TextStyle(color:Colors.green),),
                      onPressed: () {

                        var temp_progress = new List<String>.from(snapshot.data['progress']);
                        var temp_done= new List<String>.from(snapshot.data['done']);
                        //print(tasks.task);
                        temp_progress.remove(tasks.task);
                        temp_done.add(tasks.task);

                        //print(temp_todo);
                        Firestore.instance.collection('domains').document(domain).setData(
                            {'todo': snapshot.data['todo'] ,'progress':temp_progress,'done':temp_done});
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      }
    );
  }
}
