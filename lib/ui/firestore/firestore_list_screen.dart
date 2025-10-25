import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:login_app_2025/ui/auth/login_screen.dart';
import 'package:login_app_2025/ui/firestore/add_firestore_data.dart';
import 'package:login_app_2025/utils/utils.dart';

class FireStoreScreen extends StatefulWidget {
  const FireStoreScreen({super.key});

  @override
  State<FireStoreScreen> createState() => _FireStoreScreenState();
}

class _FireStoreScreenState extends State<FireStoreScreen> {
  final auth = FirebaseAuth.instance;
  final fireStore = FirebaseFirestore.instance.collection('users').snapshots();
  CollectionReference ref = FirebaseFirestore.instance.collection('users');
  final editController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: Text('FireStore'),
        actions: [
          IconButton(
            onPressed: () {
              auth
                  .signOut()
                  .then((value) {
                    // ignore: use_build_context_synchronously
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
          SizedBox(height: 10),

          StreamBuilder<QuerySnapshot>(
            stream: fireStore,
            builder: (BuildContext contex, AsyncSnapshot<QuerySnapshot> snapshot) {
              if (snapshot.connectionState == ConnectionState.waiting) {
                return Center(child: CircularProgressIndicator());
              }
              // ignore: curly_braces_in_flow_control_structures
              if (snapshot.hasError) {
                return Text('has error');
              }

              // ✅ Proper null and empty check
              if (!snapshot.hasData || snapshot.data == null || snapshot.data!.docs.isEmpty) {
                return const Center(child: Text('No data found'));
              }

              return Expanded(
                child: ListView.builder(
                  itemCount: snapshot.data!.docs.length,
                  itemBuilder: (context, index) {
                    return Card(
                      child: ListTile(
                        onTap: () {
                          ref.doc();
                        },
                        title: Text(snapshot.data!.docs[index]['title'].toString()),
                        trailing: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            IconButton(
                              icon: Icon(Icons.edit, color: Colors.blue),
                              onPressed: () {
                                showMyDialog(
                                  context,
                                  snapshot.data!.docs[index]['title'].toString(),
                                  snapshot.data!.docs[index]['id'].toString(),
                                );
                              },
                            ),
                    
                            IconButton(
                              icon: Icon(Icons.delete, color: Colors.red),
                              onPressed: () {
                                ref
                                    .doc(snapshot.data!.docs[index]['id'].toString())
                                    .delete()
                                    .then((value) {
                                      Utils().toastMessage('Post deleted');
                                    })
                                    .onError((error, stackTrace) {
                                      Utils().toastMessage(error.toString());
                                    });
                                
                              },
                            ),
                          ],
                        ),
                      ),
                    );
                  },
                ),
              );
            },
          ),
        ],
      ),

      floatingActionButton: FloatingActionButton(
        onPressed: () {
          Navigator.push(context, MaterialPageRoute(builder: (context) => AddFirestoreDataScreen()));
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
          title: Text('Update'),
          content: TextFormField(
            controller: editController,
            decoration: InputDecoration(hintText: 'Edit here'),
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
                // ✅ Now the update happens here
                FirebaseFirestore.instance
                    .collection('users')
                    .doc(id)
                    .update({'title': editController.text.toString()})
                    .then((value) {
                      Utils().toastMessage('Post updated');
                    })
                    .onError((error, stackTrace) {
                      Utils().toastMessage(error.toString());
                    });
                Navigator.pop(context);
              },
              child: Text('Update'),
            ),
          ],
        );
      },
    );
  }
}
