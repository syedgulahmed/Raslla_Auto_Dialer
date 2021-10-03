import 'package:flutter/material.dart';

import 'instruction_screen.dart';

class InstructionScreenHome extends StatefulWidget {
  const InstructionScreenHome();

  @override
  _InstructionScreenHomeState createState() => _InstructionScreenHomeState();
}

class _InstructionScreenHomeState extends State<InstructionScreenHome> {
  int _currentIndex = 0;
  List _screens = [
    InstructionSceen(
      title: 'En la primera columna,',
      image: 'instructionScreen1.png',
      desc: 'Coloca todos los nombres de tus contactos.',
    ),
    InstructionSceen(
      title: 'En la segunda columna,',
      image: 'instructionScreen2.png',
      desc: 'Coloca todos los números de teléfono (Solo números).',
    ),
    InstructionSceen(
      title: "Eso es todo!",
      image: 'instructionScreen.png',
      desc: 'Ahora, guarda el archivo en tu móvil.',
    ),
  ];

  void onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Center(
          child: Text(
            'Carga un archivo XLS o CSV',
            style: TextStyle(
              color: Colors.blueAccent,
            ),
          ),
        ),
        elevation: 0,
        leading: Container(),
        leadingWidth: 0,
        backgroundColor: Colors.white70.withOpacity(1),
      ),
      bottomNavigationBar: Container(
        color: Colors.white70.withOpacity(1),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          mainAxisSize: MainAxisSize.min,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _currentIndex = 0;
                        });
                      },
                      icon: Icon(
                        Icons.circle,
                        size: 10,
                        color: (_currentIndex == 0)
                            ? Colors.blueAccent
                            : Colors.black,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _currentIndex = 1;
                        });
                      },
                      icon: Icon(
                        Icons.circle,
                        size: 10,
                        color: (_currentIndex == 1)
                            ? Colors.blueAccent
                            : Colors.black,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        setState(() {
                          _currentIndex = 2;
                        });
                      },
                      icon: Icon(
                        Icons.circle,
                        size: 10,
                        color: (_currentIndex == 2)
                            ? Colors.blueAccent
                            : Colors.black,
                      ),
                    )
                  ],
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    child: Text('No volver a mostrar'),
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: TextButton(
                    onPressed: () {
                      if (_currentIndex < 2) {
                        setState(() {
                          _currentIndex = _currentIndex + 1;
                        });
                      } else {
                        Navigator.pop(context);
                      }
                    },
                    child: (_currentIndex < 2) ? Text('Hecho') : Text('Finish'),
                  ),
                ),
              ],
            )
          ],
        ),
      ),
      body: _screens[_currentIndex],
    );
  }
}
