import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:raslla_call/Data/stateData.dart';

class NumberScreen extends StatefulWidget {
  const NumberScreen({
    required this.callStatus,
    required this.name,
    required this.number,
    required this.category,
    required this.notes,
    required this.indexPosition,
  });
  final String callStatus;
  final String name;
  final String number;
  final String category;
  final String notes;
  final int indexPosition;

  @override
  _NumberScreenState createState() =>
      _NumberScreenState(status: this.callStatus);
}

class _NumberScreenState extends State<NumberScreen> {
  _NumberScreenState({required this.status});
  String status;

  @override
  Widget build(BuildContext context) {
    Color _statusBgColor = Color.fromRGBO(61, 231, 157, 1);
    Color _statusTextColor = Color.fromRGBO(61, 80, 101, 1);
    String _status = 'Accepted';

    if (status == 'called') {
      _status = 'Marcar';
      _statusBgColor = Color.fromRGBO(61, 231, 157, 1);
      _statusTextColor = Color.fromRGBO(61, 80, 101, 1);
    } else if (status == 'notCalled') {
      _status = 'Sin Marcar';
      _statusBgColor = Color.fromRGBO(61, 80, 101, 1);
      _statusTextColor = Color.fromRGBO(164, 202, 243, 1);
    } else if (status == 'rejected') {
      _status = 'Rejected';
      _statusBgColor = Colors.redAccent;
      _statusTextColor = Color.fromRGBO(61, 80, 101, 1);
    }

    return Scaffold(
      backgroundColor: Color.fromRGBO(28, 40, 55, 1),
      appBar: AppBar(
        backgroundColor: _statusBgColor,
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: _statusTextColor,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      bottomNavigationBar: InkWell(
        onTap: () async {
          await FlutterPhoneDirectCaller.callNumber(this.widget.number);
          if (StateData.numberList[widget.indexPosition].status ==
              'notCalled') {
            StateData.numberList[widget.indexPosition].status = 'called';
            setState(() {
              status = 'called';
              StateData.numbersCalled++;
              StateData.saveCalledNumbers();
              StateData.saveNumberList();
            });
          }
        },
        child: Container(
          width: 100,
          height: 70,
          color: _statusBgColor,
          child: Center(
            child: Text(
              'Llamar',
              style: TextStyle(
                fontSize: 20,
                color: _statusTextColor,
              ),
            ),
          ),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              child: Container(
                width: MediaQuery.of(context).size.width,
                height: 100,
                color: _statusBgColor,
                child: Center(
                  child: Text(
                    _status,
                    style: TextStyle(
                      fontSize: 30,
                      color: _statusTextColor,
                    ),
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Nombre',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Container(
                    height: 0.1,
                    color: Color.fromRGBO(164, 202, 243, 1),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      this.widget.name,
                      style: TextStyle(
                        color: Color.fromRGBO(164, 202, 243, 1),
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Teléfono',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Container(
                    height: 0.1,
                    color: Color.fromRGBO(164, 202, 243, 1),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      this.widget.number,
                      style: TextStyle(
                        color: Color.fromRGBO(164, 202, 243, 1),
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Categoría',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Container(
                    height: 0.1,
                    color: Color.fromRGBO(164, 202, 243, 1),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      this.widget.category,
                      style: TextStyle(
                        color: Color.fromRGBO(164, 202, 243, 1),
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      'Notas',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16,
                      ),
                    ),
                  ),
                  Container(
                    height: 0.1,
                    color: Color.fromRGBO(164, 202, 243, 1),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text(
                      this.widget.notes,
                      style: TextStyle(
                        color: Color.fromRGBO(164, 202, 243, 1),
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
