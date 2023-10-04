import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:meals_app/categories.dart';
import 'package:meals_app/screens/favorites.dart';
import './mainDrawer.dart';

class TabsScreen extends StatefulWidget {
  const TabsScreen({Key? key}) : super(key: key);

  @override
  State<TabsScreen> createState() => _TabsScreenState();
}

class _TabsScreenState extends State<TabsScreen> {
  final List<Map<String, Widget>> pages = [
    {'page': Categories(), 'title': Text('Categories')},
    {'page': Favorite(), 'title': Text('Favorties')}
  ];
  int selectedIndex = 0;
  void selectedPage(int index) {
    setState(() {
      selectedIndex = index;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: pages[selectedIndex]['title'],
      ),
      drawer: MainDrawer(),
      body: pages[selectedIndex]['page'],
      bottomNavigationBar: BottomNavigationBar(
          onTap: selectedPage,
          backgroundColor: Color.fromARGB(255, 185, 18, 157),
          unselectedItemColor: Color.fromARGB(255, 228, 225, 217),
          selectedItemColor: Color.fromARGB(255, 250, 246, 19),
          currentIndex: selectedIndex,
          items: [
            BottomNavigationBarItem(
                icon: Icon(Icons.category), label: 'Category'),
            BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorite')
          ]),
    );
  }
}







// top tab bar**********************************************
//  Widget build(BuildContext context) {
//     return DefaultTabController(
//       length: 2,
//       child: Scaffold(
//         appBar: AppBar(
//           title: Text('Meals'),
//           bottom: TabBar(tabs: [
//             Tab(
//               icon: Icon(Icons.category),
//               text: 'Category',
//             ),
//             Tab(
//               icon: Icon(Icons.star),
//               text: 'Favorites',
//             )
//           ]),
//         ),
//         body: TabBarView(children: [Categories(), Favorite()]),
//       ),
//     );
//   }