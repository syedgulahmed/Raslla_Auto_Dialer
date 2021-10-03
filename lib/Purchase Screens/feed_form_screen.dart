import 'package:flutter/material.dart';

class FeedbackFormScreen extends StatelessWidget {
  const FeedbackFormScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(28, 40, 55, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(28, 40, 55, 1),
        elevation: 0,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: Color.fromRGBO(164, 202, 243, 1),
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText: 'Asunto',
                  fillColor: Color.fromRGBO(61, 80, 101, 1),
                  filled: true,
                  hintStyle: TextStyle(
                    color: Color.fromRGBO(164, 202, 243, 1),
                  ),
                  contentPadding: EdgeInsets.all(10.0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                maxLines: 15,
                decoration: InputDecoration(
                  border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(10.0),
                  ),
                  hintText:
                      'Reporta un error, sugiere alguna característica o envíanos tus comentarios.',
                  fillColor: Color.fromRGBO(61, 80, 101, 1),
                  filled: true,
                  hintStyle: TextStyle(
                    color: Color.fromRGBO(164, 202, 243, 1),
                  ),
                  contentPadding: EdgeInsets.all(10.0),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(61, 231, 157, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: Text(
                          'Enviar',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        onPressed: () {
                          Navigator.pop(context);
                        },
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
