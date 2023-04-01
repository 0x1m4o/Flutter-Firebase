import 'package:flutter/material.dart';
import 'package:flutter_firebase/screens/home/user_list_tile.dart';
import 'package:flutter_firebase/shared/loading.dart';
import 'package:provider/provider.dart';
import '../../models/data_model.dart';

class ListUser extends StatefulWidget {
  const ListUser({super.key});

  @override
  State<ListUser> createState() => _ListUserState();
}

class _ListUserState extends State<ListUser> {
  @override
  Widget build(BuildContext context) {
    final userDocs = Provider.of<List<DataModel>?>(context);

    // userDocs.forEach((user) {
    //   print(user.name);
    //   print(user.sugars);
    //   print(user.strength);
    // });

    return userDocs == null
        ? Loading()
        : ListView.builder(
            itemCount: userDocs.length,
            itemBuilder: (context, index) {
              return UserTile(userData: userDocs[index]);
            },
          );
  }
}
