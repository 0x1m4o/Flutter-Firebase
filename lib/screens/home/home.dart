import 'package:flutter/material.dart';
import 'package:flutter_firebase/models/data_model.dart';
import 'package:flutter_firebase/screens/home/settings_form.dart';
import 'package:flutter_firebase/screens/home/user_list.dart';
import 'package:flutter_firebase/services/auth.dart';
import 'package:provider/provider.dart';
import '../../services/database.dart';

class Home extends StatelessWidget {
  final AuthService _auth = AuthService();

  @override
  Widget build(BuildContext context) {
    void _showSettingsPanel() {
      showDialog(
          context: context,
          builder: (context) => new AlertDialog(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.all(Radius.circular(10.0))),
                content: Builder(
                  builder: (context) {
                    // Get available height and width of the build area of this widget. Make a choice depending on the size.
                    var height = MediaQuery.of(context).size.height;
                    var width = MediaQuery.of(context).size.width;

                    return Container(
                      height: height - 400,
                      width: width,
                      child: DialogContent(),
                    );
                  },
                ),
              ));
    }

    return StreamProvider<List<DataModel>?>.value(
      initialData: null,
      value: DatabaseService(uid: '').userData,
      child: Scaffold(
        backgroundColor: Colors.brown[300],
        appBar: AppBar(
          backgroundColor: Colors.brown[400],
          title: Text('Home Page'),
          actions: [
            TextButton.icon(
              style: TextButton.styleFrom(
                iconColor: Colors.white,
              ),
              onPressed: () async {
                await _auth.userSignOut();
              },
              icon: Icon(Icons.exit_to_app_rounded),
              label: Text(
                'Logout',
                style: TextStyle(color: Colors.white, fontSize: 13),
              ),
            )
          ],
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.endFloat,
        // floatingActionButtonAnimator: FloatingActionButtonAnimator.scaling,
        floatingActionButton: FloatingActionButton.extended(
          onPressed: () => _showSettingsPanel(),
          backgroundColor: Colors.brown,
          label: Row(children: [
            Icon(Icons.person),
            SizedBox(
              width: 10,
            ),
            Text('Profile')
          ]),
        ),
        body: ListUser(),
      ),
    );
  }
}
