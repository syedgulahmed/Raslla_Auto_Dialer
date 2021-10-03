import 'dart:async';
import 'package:flutter/material.dart';
import 'package:raslla_call/Call%20Screens/file_type_screen.dart';
import 'package:raslla_call/Data/PhoneNumberClass.dart';
import 'package:raslla_call/Custom%20Widgets/drop_down_menu_widget.dart';
import 'package:raslla_call/Custom%20Widgets/fileDetailsWidget.dart';
import 'package:raslla_call/Custom%20Widgets/number_card.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
// ignore: import_of_legacy_library_into_null_safe
import 'package:phone_state_i/phone_state_i.dart';
import 'package:raslla_call/Data/stateData.dart';
import 'instruction_screen_home.dart';
import 'number_screen.dart';

//Icons.rotate_left

class CallScreen extends StatefulWidget {
  const CallScreen();

  @override
  _CallScreenState createState() => _CallScreenState();
}

class _CallScreenState extends State<CallScreen> {
  late StreamSubscription streamSubscription;
  String callStatusEvent = 'false';
  bool callMode = false;
  bool recyleStatus = false;
  String selectedCategory = 'Todos';

  //For adding notes dialogbox
  late String valueText;
  TextEditingController _textFieldController = TextEditingController();

  @override
  void initState() {
    super.initState();
    if (StateData.numberList.length > 0) {
      if (StateData.numbersCalled >= StateData.numberList.length) {
        recyleStatus = true;
      }
    }
    streamSubscription =
        phoneStateCallEvent.listen((PhoneStateCallEvent event) {
      callStatusEvent = event.stateC.toString();
      print('call status $callStatusEvent');
    });
  }

  @override
  void dispose() {
    super.dispose();
    streamSubscription.cancel();
  }

  Future<void> _startCall(PhoneNumber number) async {
    await FlutterPhoneDirectCaller.callNumber(number.number);

    setState(() {
      number.status = 'called';
      StateData.numbersCalled++;
    });
    StateData.saveNumberList();
    StateData.saveCalledNumbers();
  }

  _resumeCalls() async {
    int numbersCalled = 0;
    while (callMode && StateData.numbersCalled < StateData.numberList.length) {
      if (callMode == false) {
        break;
      }

      if (selectedCategory == 'Todos') {
        if (StateData.numberList[numbersCalled].status == 'notCalled') {
          await _startCall(StateData.numberList[numbersCalled]);
          await new Future.delayed(new Duration(seconds: 3));
          while (callStatusEvent == 'true') {
            await new Future.delayed(new Duration(seconds: 1));
          }
          await new Future.delayed(new Duration(seconds: 3));
        }
      } else {
        if (StateData.numberList[numbersCalled].category == selectedCategory) {
          if (StateData.numberList[numbersCalled].status == 'notCalled') {
            await _startCall(StateData.numberList[numbersCalled]);
            await new Future.delayed(new Duration(seconds: 3));
            while (callStatusEvent == 'true') {
              await new Future.delayed(new Duration(seconds: 1));
            }
            await new Future.delayed(new Duration(seconds: 3));
          }
        }
      }
      numbersCalled++;
      if (numbersCalled >= StateData.numberList.length) {
        break;
      }
    }

    if (StateData.numbersCalled >= StateData.numberList.length) {
      if (StateData.numberList.length > 0) {
        recyleStatus = true;
      }
    }
    callMode = false;
    setState(() {});
  }

  _selectFile() async {
    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => InstructionScreenHome(),
      ),
    );

    await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => FileTypeScreen(),
      ),
    );

    FilePickerResult? result = await FilePicker.platform.pickFiles();

    if (result != null) {
      PlatformFile file = result.files.first;
      if (StateData.fileType == 'XLS') {
        await StateData.loadExcelFile(file.path.toString());
        setState(() {});
      } else {
        await StateData.loadCSVFile(file.path.toString());
        setState(() {});
      }
    } else {
      // User canceled the picker
    }
  }

  _visitNumberScreen(int index) {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => NumberScreen(
          callStatus: StateData.numberList[index].status,
          name: StateData.numberList[index].name,
          number: StateData.numberList[index].number,
          notes: StateData.numberList[index].note,
          category: StateData.numberList[index].category,
          indexPosition: index,
        ),
      ),
    ).then((value) => setState(() {}));
  }

  Future<void> _addNoteDialog(BuildContext context, int index) async {
    late String categoryText;

    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Color.fromRGBO(61, 80, 101, 1),
          title: Text(
            'Agregar a Categoría',
            style: TextStyle(
              color: Color.fromRGBO(164, 202, 243, 1),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Expanded(
                    child: DropDownMenuWidget(
                      valueChange: (value) {
                        setState(() {
                          categoryText = value;
                        });
                      },
                    ),
                  ),
                ],
              ),
              TextField(
                onChanged: (value) {
                  setState(() {
                    valueText = value;
                  });
                },
                style: TextStyle(
                  color: Color.fromRGBO(164, 202, 243, 1),
                ),
                controller: _textFieldController,
                decoration: InputDecoration(
                  enabledBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(164, 202, 243, 1)),
                  ),
                  focusedBorder: UnderlineInputBorder(
                    borderSide:
                        BorderSide(color: Color.fromRGBO(164, 202, 243, 1)),
                  ),
                  hintText: "Titulo",
                  hintStyle: TextStyle(
                    color: Color.fromRGBO(164, 202, 243, 1),
                  ),
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(0, 0, 5, 0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(164, 202, 243, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: Text(
                          'Aceptar',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            StateData.numberList[index].category = categoryText;
                            StateData.numberList[index].note =
                                _textFieldController.text;
                            _textFieldController = TextEditingController();
                            StateData.saveNumberList();
                            Navigator.pop(context);
                          });
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(5, 0, 0, 0),
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: Color.fromRGBO(164, 202, 243, 1),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        child: Text(
                          'Cancelar',
                          style: TextStyle(
                            color: Colors.black,
                          ),
                        ),
                        onPressed: () {
                          setState(() {
                            Navigator.pop(context);
                          });
                        },
                      ),
                    ),
                  ),
                ],
              )
            ],
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(28, 40, 55, 1),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(164, 202, 243, 1),
        onPressed: () async {
          if (recyleStatus) {
            recyleStatus = false;
            StateData.recycleNumberList();
            setState(() {});
          } else {
            setState(() {
              callMode = !callMode;
            });
            _resumeCalls();
          }
        },
        child: Icon(
          (recyleStatus)
              ? Icons.rotate_left
              : (callMode)
                  ? Icons.pause
                  : Icons.call,
          color: Color.fromRGBO(28, 40, 55, 1),
        ),
      ),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(61, 80, 101, 1),
        title: Text(
          'Llamadas',
          style: TextStyle(
            color: Color.fromRGBO(164, 202, 243, 1),
            fontWeight: FontWeight.normal,
            fontSize: 18,
          ),
        ),
        actions: [
          ButtonBar(
            children: [
              Transform.rotate(
                angle: -1.5708,
                child: IconButton(
                  onPressed: _selectFile,
                  icon: Icon(
                    Icons.attachment,
                    size: 24,
                    color: Color.fromRGBO(164, 202, 243, 1),
                  ),
                ),
              )
            ],
          )
        ],
      ),
      body: (StateData.numberList.length == 0)
          ? Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Text(
                    "No has cargado ningún archivo.",
                    style: TextStyle(
                      color: Color.fromRGBO(164, 202, 243, 1),
                    ),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(5.0),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Oprime este botón ',
                        style: TextStyle(
                          color: Color.fromRGBO(164, 202, 243, 1),
                        ),
                      ),
                      Transform.rotate(
                        angle: -1.5708,
                        child: Icon(
                          Icons.attachment,
                          size: 20,
                          color: Color.fromRGBO(164, 202, 243, 1),
                        ),
                      )
                    ],
                  ),
                )
              ],
            )
          : Container(
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    Padding(
                      padding: const EdgeInsets.all(20.0),
                      child: DropDownMenuWidget(
                        valueChange: (value) {
                          setState(() {
                            selectedCategory = value;
                          });
                        },
                      ),
                    ),
                    FileDetailsWidget(),
                    Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        for (var i = 0; i < StateData.numberList.length; i++)
                          (selectedCategory == 'Todos')
                              ? NumberCard(
                                  name: StateData.numberList[i].name,
                                  number: StateData.numberList[i].number,
                                  status: StateData.numberList[i].status,
                                  addNoteCallBack: () {
                                    _addNoteDialog(context, i);
                                  },
                                  category: StateData.numberList[i].category,
                                  note: StateData.numberList[i].note,
                                  indexPosition: i,
                                  visitNumScreenCallBack: () {
                                    _visitNumberScreen(i);
                                  },
                                )
                              : (selectedCategory ==
                                      StateData.numberList[i].category)
                                  ? NumberCard(
                                      name: StateData.numberList[i].name,
                                      number: StateData.numberList[i].number,
                                      status: StateData.numberList[i].status,
                                      addNoteCallBack: () {
                                        _addNoteDialog(context, i);
                                      },
                                      category:
                                          StateData.numberList[i].category,
                                      note: StateData.numberList[i].note,
                                      indexPosition: i,
                                      visitNumScreenCallBack: () {
                                        _visitNumberScreen(i);
                                      },
                                    )
                                  : Container(),
                      ],
                    )
                  ],
                ),
              ),
            ),
    );
  }
}
