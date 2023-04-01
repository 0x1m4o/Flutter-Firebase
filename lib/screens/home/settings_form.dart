import 'package:flutter/material.dart';
import '../../shared/text_fields_constant.dart';

class DialogContent extends StatefulWidget {
  const DialogContent({super.key});

  @override
  State<DialogContent> createState() => _DialogContentState();
}

class _DialogContentState extends State<DialogContent> {
  final _formKey = GlobalKey<FormState>();
  final List<String> sugars = ['0', '1', '2', '3', '4', '5'];

  String? _currentName;
  String? _currentSugars;
  int? _currentStrength;
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              'Update Your Profile',
              style: TextStyle(fontWeight: FontWeight.w700, fontSize: 18),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: 40,
            ),
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              validator: (value) =>
                  value!.isEmpty ? 'Please Enter a Name' : null,
              decoration: textInputDecoration.copyWith(
                hintText: 'Your Username',
                labelText: 'Username',
              ),
              onChanged: (value) {
                setState(() {
                  _currentName = value;
                });
              },
            ),
            SizedBox(
              height: 20,
            ),
            Container(
              width: double.infinity,
              child: DropdownButtonFormField(
                value: _currentSugars ?? '0',
                isExpanded: true,
                decoration: textInputDecoration,
                items: sugars.map((sugar) {
                  return DropdownMenuItem(
                    child: Container(
                      width: double.infinity,
                      child: Text('$sugar Sugars'),
                    ),
                    value: sugar,
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    _currentSugars = value;
                  });
                },
              ),
            ),
            SizedBox(
              height: 20,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                SizedBox(
                  width: 90,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Close'),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.red[400],
                    ),
                  ),
                ),
                SizedBox(
                  width: 20,
                ),
                SizedBox(
                  width: 90,
                  height: 40,
                  child: ElevatedButton(
                    onPressed: () async {
                      print(_currentName);
                      print(_currentSugars);
                      print(_currentStrength);
                    },
                    child: Text('Save'),
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue[600]),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
