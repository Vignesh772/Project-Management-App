import 'package:flutter/material.dart';
import 'package:recon_subsea_app/models/tasks.dart';
import 'package:recon_subsea_app/screens/home/done_tile.dart';
import "package:cloud_firestore/cloud_firestore.dart";
import 'package:recon_subsea_app/shared/loading.dart';

class DoneList extends StatefulWidget {
  final String domain;
  //const TaskList({this.domain});
  const DoneList ({ Key key, this.domain }): super(key: key);
  @override
  _DoneListState createState() => _DoneListState();
}

class _DoneListState extends State<DoneList> {



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
              snapshot.data['done'].length,
                  (i) => Task(
                task:snapshot.data['done'][i],
                //num:i,
              ),
            );

            if(snapshot.data['done'].length==0) {
              return (Container());
            }
            return Expanded(
              child: ListView.builder(
                itemCount: todos.length,
                itemBuilder: (context, index) {
                  return DoneTile(tasks: todos[index],domain: widget.domain);
                },
              ),
            );
          }
        }
    );
  }
}
