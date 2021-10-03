import 'package:flutter/material.dart';

class NumberCard extends StatefulWidget {
  final String name;
  final String number;
  final String status;
  final String category;
  final String note;
  final int indexPosition;
  final VoidCallback addNoteCallBack;
  final VoidCallback visitNumScreenCallBack;

  const NumberCard({
    required this.name,
    required this.number,
    required this.status,
    required this.category,
    required this.note,
    required this.addNoteCallBack,
    required this.indexPosition,
    required this.visitNumScreenCallBack,
  });

  @override
  _NumberCardState createState() => _NumberCardState();
}

class _NumberCardState extends State<NumberCard> {
  @override
  Widget build(BuildContext context) {
    Color _backgoundColor;
    Color _iconColor;
    Color _fontColor;

    if (widget.status == 'notCalled') {
      _backgoundColor = Colors.white;
      _iconColor = Colors.blue;
      _fontColor = Colors.grey;
    } else if (widget.status == 'called') {
      _backgoundColor = Color.fromRGBO(61, 80, 101, 1);
      _iconColor = Color.fromRGBO(164, 202, 243, 1);
      _fontColor = Colors.white;
    } else {
      _backgoundColor = Colors.pinkAccent;
      _iconColor = Colors.grey;
      _fontColor = Colors.grey;
    }

    return InkWell(
      onLongPress: () async {
        widget.addNoteCallBack();
      },
      onTap: () {
        widget.visitNumScreenCallBack();
      },
      child: Padding(
        padding: const EdgeInsets.fromLTRB(16.0, 2.0, 16.0, 2.0),
        child: Card(
          elevation: 5,
          child: Container(
            color: _backgoundColor,
            child: Row(
              children: [
                Container(
                  height: 40,
                  width: 40,
                  margin: EdgeInsets.all(10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      width: 2,
                      color: _iconColor,
                    ),
                    shape: BoxShape.circle,
                  ),
                  child: Icon(
                    (this.widget.status == 'called')
                        ? Icons.call_end
                        : Icons.call,
                    color: _iconColor,
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      this.widget.name,
                      style: TextStyle(
                        color: _fontColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      this.widget.number,
                      style: TextStyle(
                        color: _fontColor,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
