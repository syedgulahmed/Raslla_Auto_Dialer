import 'package:flutter/material.dart';
import 'package:raslla_call/Data/stateData.dart';

class DropDownMenuWidget extends StatefulWidget {
  const DropDownMenuWidget({required this.valueChange});

  final ValueChanged valueChange;

  @override
  _DropDownMenuWidgetState createState() =>
      _DropDownMenuWidgetState(valueChange: this.valueChange);
}

class _DropDownMenuWidgetState extends State<DropDownMenuWidget> {
  late String valueChoose = StateData.categoryList[0];

  _DropDownMenuWidgetState({required this.valueChange});

  ValueChanged valueChange;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(left: 16, right: 16),
      decoration: BoxDecoration(
        border: Border.all(
          color: Color.fromRGBO(61, 80, 101, 1),
          width: 0,
        ),
        color: Color.fromRGBO(61, 80, 101, 1),
        borderRadius: BorderRadius.circular(15),
      ),
      child: DropdownButton(
        icon: Icon(
          Icons.arrow_drop_down,
          color: Color.fromRGBO(164, 202, 243, 1),
        ),
        isExpanded: true,
        value: valueChoose,
        underline: SizedBox(),
        dropdownColor: Color.fromRGBO(61, 80, 101, 1),
        style: TextStyle(
          color: Color.fromRGBO(164, 202, 243, 1),
        ),
        onChanged: (newValue) {
          setState(() {
            valueChoose = newValue.toString();
            valueChange(valueChoose);
          });
        },
        items: StateData.categoryList.map((valueItem) {
          return DropdownMenuItem(
            value: valueItem,
            child: Text(valueItem),
          );
        }).toList(),
      ),
    );
  }
}
