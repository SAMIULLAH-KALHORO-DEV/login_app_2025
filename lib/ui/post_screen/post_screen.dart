import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_database/ui/firebase_animated_list.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_app_2025/ui/auth/login_screen.dart';
import 'package:login_app_2025/ui/post_screen/add_posts.dart';
import 'package:login_app_2025/utils/utils.dart';
import 'package:firebase_database/firebase_database.dart';

class PostScreen extends StatefulWidget {
  const PostScreen({super.key});

  @override
  State<PostScreen> createState() => _PostScreenState();
}

class _PostScreenState extends State<PostScreen> {
  final auth = FirebaseAuth.instance;
  final ref = FirebaseDatabase.instance.ref('Posts');
  final searchFilter = TextEditingController();
  final editController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('Post Screen'),
        actions: [
          IconButton(
            onPressed: () {
              auth
                  .signOut()
                  .then((value) {
                    Navigator.push(context, MaterialPageRoute(builder: (context) => LoginScreen()));
                  })
                  .onError((error, stackTrace) {
                    Utils().toastMessage(error.toString());
                  });
            },
            icon: Icon(Icons.logout_outlined),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: TextFormField(
              controller: searchFilter,
              decoration: InputDecoration(
                hintText: 'Search post',
                border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
              ),
              onChanged: (String value) {
                setState(() {});
              },
            ),
          ),
          Expanded(
            child: FirebaseAnimatedList(
              query: ref,
              defaultChild: Center(child: Text('Loading', style: TextStyle(fontSize: 30))),
              itemBuilder: (context, snapshot, animation, index) {
                final title = snapshot.child('title').value.toString();
                // subtitle: Text(snapshot.child('id').value.toString()),

                if (searchFilter.text.isEmpty) {
                  return ListTile(
                    title: Text(snapshot.child('title').value.toString()),
                    subtitle: Text(snapshot.child('id').value.toString()),
                    trailing: PopupMenuButton(
                      icon: Icon(Icons.more_vert),
                      itemBuilder: (context) => [
                        PopupMenuItem(
                          value: 1,
                          child: ListTile(
                            leading: Icon(Icons.edit),
                            title: Text('Edit'),
                            onTap: () {
                              Navigator.pop(context);
                              showMyDialog(context, title, snapshot.child('id').value.toString());
                            },
                          ),
                        ),
                        PopupMenuItem(
                          value: 1,
                          child: ListTile(
                            leading: Icon(Icons.delete),
                            title: Text('delete'),
                            onTap: () {
                              Navigator.pop(context);
                              // ignore: avoid_single_cascade_in_expression_statements
                              ref..child(snapshot.child('id').value.toString()).remove();
                            },
                          ),
                        ),
                      ],
                    ),
                  );
                } else if (title.toLowerCase().contains(searchFilter.text.toLowerCase())) {
                  return ListTile(
                    title: Text(snapshot.child('title').value.toString()),
                    // subtitle: Text(snapshot.child('id').value.toString()),
                  );
                } else {
                  return Container();
                }
              },
            ),
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddPostScreen()));
        },
        child: Icon(Icons.add),
      ),
    );
  }

  Future<void> showMyDialog(BuildContext context, String title, String id) async {
    editController.text = title;
    return showDialog(
      context: context,

      builder: (BuildContext context) {
        return AlertDialog(
          title: Text('update'),
          content: Container(
            child: TextFormField(
              controller: editController,
              decoration: InputDecoration(hintText: 'Edit here'),
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('Cancel'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                ref
                    .child(id)
                    .update({'title': editController.text.toString()})
                    .then((value) {
                      Utils().toastMessage('Post updated');
                    })
                    .onError((error, stackTrace) {
                      Utils().toastMessage(error.toString());
                    });
              },
              child: Text('Update'),
            ),
          ],
        );
      },
    );
  }
}


  // Expanded(
  //           child: StreamBuilder(
  //             stream: ref.onValue,
  //             builder: (context, AsyncSnapshot<DatabaseEvent> snapshot) {
  //               if (!snapshot.hasData) {
  //                 return Center(child: CircularProgressIndicator());
  //               } else {
  //                 Map<dynamic, dynamic> map = snapshot.data!.snapshot.value as dynamic;
  //                 List<dynamic> list = [];
  //                 list.clear();
  //                 list = map.values.toList();

  //                 return ListView.builder(
  //                   itemCount: snapshot.data!.snapshot.children.length,
  //                   itemBuilder: (context, index) {
  //                     return ListTile(
  //                       title: Text(list[index]['title'].toString()),
  //                       subtitle: Text(list[index]['id'].toString()),
  //                     );
  //                   },
  //                 );
  //               }
  //             },
  //           ),
  //         ),