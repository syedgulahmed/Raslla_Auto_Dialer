import 'dart:io';
// ignore: import_of_legacy_library_into_null_safe
import 'package:excel/excel.dart';
import 'package:raslla_call/Data/PhoneNumberClass.dart';
import 'package:shared_preferences/shared_preferences.dart';

class StateData {
  static String fileType = 'XLS';
  static List<String> categoryList = ['Todos'];
  static List<PhoneNumber> numberList = [];
  static int numbersCalled = 0;
  static String fileName = "";
  static int numbersRejected = 0;

  static recycleNumberList() {
    for (var i = 0; i < numberList.length; i++) {
      numberList[i].status = 'notCalled';
    }
    numbersCalled = 0;

    saveNumberList();
    saveCalledNumbers();
  }

  static saveCategories() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setStringList('categories', categoryList);
  }

  static saveFileNameState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString('fileName', fileName);
  }

  static saveCalledNumbers() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setInt('numbersCalled', numbersCalled);
  }

  static saveNumberList() async {
    List<String> contactNames = [];
    List<String> contactNumbers = [];
    List<String> contactStatus = [];
    List<String> contactNotes = [];
    List<String> contactCategories = [];

    for (var i = 0; i < numberList.length; i++) {
      contactNames.add(numberList[i].name);
      contactNumbers.add(numberList[i].number);
      contactStatus.add(numberList[i].status);
      contactNotes.add(numberList[i].note);
      contactCategories.add(numberList[i].category);
    }

    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setStringList('names', contactNames);
    prefs.setStringList('numbers', contactNumbers);
    prefs.setStringList('status', contactStatus);
    prefs.setStringList('notes', contactNotes);
    prefs.setStringList('category', contactCategories);
  }

  static loadState() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();

    categoryList = prefs.getStringList('categories')!;
    numbersCalled = prefs.getInt('numbersCalled')!;
    fileName = prefs.getString('fileName')!;

    List<String> contactNames = prefs.getStringList('names')!;
    List<String> contactNumbers = prefs.getStringList('numbers')!;
    List<String> contactStatus = prefs.getStringList('status')!;
    List<String> contactNotes = prefs.getStringList('notes')!;
    List<String> contactCategories = prefs.getStringList('category')!;

    for (var i = 0; i < contactNames.length; i++) {
      numberList.add(
        PhoneNumber(
          name: contactNames[i],
          number: contactNumbers[i],
          status: contactStatus[i],
          note: contactNotes[i],
          category: contactCategories[i],
        ),
      );
    }
  }

  static loadExcelFile(String path) async {
    numberList = [];
    numbersCalled = 0;
    var excel = Excel.decodeBytes(File(path).readAsBytesSync());
    for (var table in excel.tables.keys) {
      for (var row in excel.tables[table]!.rows) {
        String name = row[0].toString();
        String number = row[1].toString().split('.')[0];

        numberList.add(
          PhoneNumber(
            name: name,
            number: number,
            status: 'notCalled',
            category: 'n\a',
            note: 'n\a',
          ),
        );
      }
    }
    fileName = path;
    saveCategories();
    saveFileNameState();
    saveNumberList();
    saveCalledNumbers();
  }

  static Future<void> loadCSVFile(String path) async {
    numberList = [];
    numbersCalled = 0;
    final lines = await File(path).readAsLines();
    for (var line in lines) {
      numberList.add(
        PhoneNumber(
          name: line.toString().split(',')[0],
          number: line.toString().split(',')[1],
          status: 'notCalled',
          category: 'n\a',
          note: 'n\a',
        ),
      );
    }
    fileName = path;
    saveCategories();
    saveFileNameState();
    saveNumberList();
    saveCalledNumbers();
  }
}
