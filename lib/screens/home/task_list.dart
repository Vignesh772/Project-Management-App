import 'package:flutter/material.dart';
import 'package:recon_subsea_app/models/tasks.dart';
import 'package:recon_subsea_app/screens/home/task_tile.dart';
import "package:cloud_firestore/cloud_firestore.dart";
import 'package:recon_subsea_app/shared/loading.dart';

class TaskList extends StatefulWidget {
  final String domain;
  //const TaskList({this.domain});
  const TaskList ({ Key key, this.domain }): super(key: key);
  @override
  _TaskListState createState() => _TaskListState();
}

class _TaskListState extends State<TaskList> {



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
          snapshot.data['todo'].length,
              (i) => Task(
            task:snapshot.data['todo'][i],
            //num:i,
          ),
        );

        if(snapshot.data['todo'].length==0) {
          return (Container());
        }
        return Expanded(
          child: ListView.builder(
            itemCount: todos.length,
            itemBuilder: (context, index) {
              return TaskTile(tasks: todos[index],domain: widget.domain);
            },
          ),
        );
      }
      }
    );
  }
}
