import 'package:flutter/material.dart';
import 'package:recon_subsea_app/models/tasks.dart';
import 'package:recon_subsea_app/screens/home/progress_list.dart';
import "package:cloud_firestore/cloud_firestore.dart";
import 'package:recon_subsea_app/screens/home/progress_tile.dart';
import 'package:recon_subsea_app/shared/loading.dart';

class ProgressList extends StatefulWidget {
  final String domain;
  //const TaskList({this.domain});
  const ProgressList ({ Key key, this.domain }): super(key: key);
  @override
  _ProgressListState createState() => _ProgressListState();
}

class _ProgressListState extends State<ProgressList> {



  @override
  Widget build(BuildContext context) {

    print(widget.domain);
    return StreamBuilder(



        stream: Firestore.instance.collection('domains').document(widget.domain).snapshots(),
        builder: (context, snapshot) {

          if (!snapshot.hasData) {
            return Loading();
          }
          else {

            final todos = List<Task>.generate(
              snapshot.data['progress'].length,
                  (i) => Task(
                task:snapshot.data['progress'][i],
                //num:i,
              ),
            );

            if(snapshot.data['progress'].length==0) {
              return (Container());
            }
            return Expanded(
              child: ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  return ProgressTile(tasks: todos[index],domain: widget.domain);
                },
              ),
            );
          }
        }
    );
  }
}
