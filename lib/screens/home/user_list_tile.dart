import 'package:flutter/material.dart';
import '../../models/data_model.dart';

class UserTile extends StatelessWidget {
  final DataModel? userData;
  UserTile({this.userData});
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top: 10),
      child: Card(
        margin: EdgeInsets.fromLTRB(20, 6, 20, 0),
        child: ListTile(
          leading: CircleAvatar(
            radius: 25,
            backgroundColor: Colors.brown[userData!.strength],
          ),
          title: Text(userData!.name),
          subtitle: Text(userData!.sugars),
        ),
      ),
    );
  }
}
