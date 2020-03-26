import 'package:exemplo_musica/metodo2_page.dart';
import 'package:flutter/material.dart';
import 'metodo1_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _pageController = new PageController();
  var _selectedIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Row(
            children: <Widget>[
              Icon(Icons.play_circle_outline),
              Text('Player de Musica Flutter')
            ],
          ),
        ),
        bottomNavigationBar: BottomNavigationBar(
          items: const <BottomNavigationBarItem>[
            BottomNavigationBarItem(
              icon: Icon(Icons.music_note),
              title: Text('Método 1'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.music_video),
              title: Text('Método 2'),
            ),
            BottomNavigationBarItem(
              icon: Icon(Icons.library_music),
              title: Text('Método 3'),
            ),
          ],
          currentIndex: _selectedIndex,
          selectedItemColor: Colors.amber[800],
          onTap: (index) {
            switch (index) {
              case 0:
                _selectedIndex = 0;
                break;
              case 1:
                _selectedIndex = 1;
                break;
            }
            setState(() {
              _pageController.jumpToPage(_selectedIndex);
            });
          },
        ),
        body: PageView(
          controller: _pageController,
          physics: AlwaysScrollableScrollPhysics(),
          children: <Widget>[
            Metodo1Page(),
            Metodo2Page(),
          ],
        ));
  }
}
