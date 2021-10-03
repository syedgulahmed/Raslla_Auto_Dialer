import 'package:flutter/material.dart';
import 'package:raslla_call/Data/stateData.dart';

class FileDetailsWidget extends StatelessWidget {
  const FileDetailsWidget();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Container(
        decoration: BoxDecoration(
          border: Border.all(
            color: Color.fromRGBO(61, 80, 101, 1),
            width: 0,
          ),
          color: Color.fromRGBO(61, 80, 101, 1),
          borderRadius: BorderRadius.circular(15),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Text(
                (StateData.fileName != '')
                    ? 'File: ${StateData.fileName}'
                    : 'File: No hay archivo seleccionado.',
                style: TextStyle(
                  color: Colors.white,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Llamadas: ${StateData.numbersCalled}',
                    style: TextStyle(color: Color.fromRGBO(164, 202, 243, 1)),
                  ),
                  Text(
                    'Rechazadas: ${StateData.numbersRejected}',
                    style: TextStyle(color: Color.fromRGBO(164, 202, 243, 1)),
                  ),
                  Text(
                    'Sin Marcar: ${StateData.numberList.length - StateData.numbersCalled}',
                    style: TextStyle(color: Color.fromRGBO(164, 202, 243, 1)),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
