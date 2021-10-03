import 'package:flutter/material.dart';
import 'package:raslla_call/Data/stateData.dart';

class FileTypeScreen extends StatelessWidget {
  const FileTypeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Selecciona el tipo de archivo',
            style: TextStyle(
              color: Color.fromRGBO(164, 202, 243, 1),
            ),
          ),
        ),
        elevation: 0,
        leading: Container(),
        leadingWidth: 0,
        backgroundColor: Color.fromRGBO(61, 80, 101, 1),
      ),
      backgroundColor: Color.fromRGBO(61, 80, 101, 1),
      body: Center(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SizedBox(
              width: (MediaQuery.of(context).size.width / 2) * 0.9,
              height: (MediaQuery.of(context).size.height / 2) * 0.8,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                ),
                onPressed: () {
                  StateData.fileType = 'XLS';
                  Navigator.pop(context);
                },
                child: Text(
                  'XLS',
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.blueAccent,
                  ),
                ),
              ),
            ),
            SizedBox(
              width: (MediaQuery.of(context).size.width / 2) * 0.9,
              height: (MediaQuery.of(context).size.height / 2) * 0.8,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Colors.white,
                ),
                onPressed: () {
                  StateData.fileType = 'CSV';
                  Navigator.pop(context);
                },
                child: Text(
                  'CSV',
                  style: TextStyle(
                    fontSize: 50,
                    color: Colors.blueAccent,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
