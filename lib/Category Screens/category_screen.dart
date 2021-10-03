import 'package:flutter/material.dart';
import 'package:raslla_call/Data/stateData.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({Key? key}) : super(key: key);

  @override
  _CategoryScreenState createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  TextEditingController _textFieldController = TextEditingController();
  String valueText = '';

  Future<void> _removeCategoryDialogBox(BuildContext context, int index) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Color.fromRGBO(61, 80, 101, 1),
          title: Text(
            'Seguro que quieres borrar esta categoría? ${StateData.categoryList[index]}',
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
                          _removeCategory(index);
                          Navigator.pop(context);
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
                          'Cancel',
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

  Future<void> _addCategoryDialogBox(BuildContext context) async {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: Color.fromRGBO(61, 80, 101, 1),
          title: Text(
            'Crea una categoría.',
            style: TextStyle(
              color: Color.fromRGBO(164, 202, 243, 1),
            ),
          ),
          content: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
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
                          _addCategory();
                          _textFieldController = TextEditingController();
                          Navigator.pop(context);
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
                          Navigator.pop(context);
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

  _removeCategory(int index) {
    setState(() {
      StateData.categoryList.removeAt(index);
    });
    StateData.saveCategories();
  }

  _addCategory() {
    setState(() {
      StateData.categoryList.add(valueText);
      valueText = '';
    });
    StateData.saveCategories();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color.fromRGBO(28, 40, 55, 1),
      appBar: AppBar(
        backgroundColor: Color.fromRGBO(61, 80, 101, 1),
        title: Text(
          'Categorías',
          style: TextStyle(
            color: Color.fromRGBO(164, 202, 243, 1),
            fontWeight: FontWeight.normal,
            fontSize: 18,
          ),
        ),
        actions: [
          ButtonBar(
            children: [
              IconButton(
                onPressed: () {
                  _addCategoryDialogBox(context);
                },
                icon: Icon(
                  Icons.add_circle_outline,
                  size: 24,
                  color: Color.fromRGBO(164, 202, 243, 1),
                ),
              )
            ],
          )
        ],
      ),
      body: (StateData.categoryList.length <= 1)
          ? Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      "No hay categorías.",
                      style: TextStyle(
                        color: Color.fromRGBO(164, 202, 243, 1),
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(5.0),
                    child: Text(
                      'Crear categoría',
                      style: TextStyle(
                        color: Color.fromRGBO(164, 202, 243, 1),
                      ),
                    ),
                  ),
                ],
              ),
            )
          : ListView.builder(
              itemCount: StateData.categoryList.length,
              itemBuilder: (context, index) {
                return (index != 0)
                    ? Padding(
                        padding: const EdgeInsets.fromLTRB(20.0, 10.0, 20.0, 0),
                        child: InkWell(
                          onTap: () {
                            setState(() {
                              _removeCategoryDialogBox(context, index);
                            });
                          },
                          child: Card(
                            child: SizedBox(
                              width: MediaQuery.of(context).size.width * 0.8,
                              child: Center(
                                child: Padding(
                                  padding: const EdgeInsets.all(10),
                                  child: Text(StateData.categoryList[index]),
                                ),
                              ),
                            ),
                          ),
                        ),
                      )
                    : Container();
              },
            ),
    );
  }
}
