import 'package:flutter/material.dart';
import 'package:instagram/screens/activity_screen.dart';
import 'package:instagram/screens/add_content.dart';
import 'package:instagram/screens/home_screen.dart';
import 'package:instagram/screens/search_screen.dart';
import 'package:instagram/screens/user_profile_screen.dart';

class MainScreen extends StatefulWidget {
  const MainScreen({Key? key}) : super(key: key);

  @override
  State<MainScreen> createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> {
  int _selectedBottomNavigationItem = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.transparent,
        extendBody: true,
        bottomNavigationBar: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(15),
              topLeft: Radius.circular(15),
            ),
          ),
          child: ClipRRect(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(15),
              topLeft: Radius.circular(15),
            ),
            child: BottomNavigationBar(
              type: BottomNavigationBarType.fixed,
              backgroundColor: Color(0xff1CF2E),
              currentIndex: _selectedBottomNavigationItem,
              onTap: (int index) {
                setState(() {
                  _selectedBottomNavigationItem = index;
                });
              },
              showSelectedLabels: false,
              showUnselectedLabels: false,
              items: [
                BottomNavigationBarItem(
                  icon: Image.asset('images/icon_home.png'),
                  activeIcon: Image.asset('images/icon_active_home.png'),
                  label: 'item1',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset('images/icon_search.png'),
                  activeIcon:
                      Image.asset('images/icon_search_navigation_active.png'),
                  label: 'item2',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset('images/icon_add_navigation.png'),
                  activeIcon:
                      Image.asset('images/icon_add_navigation_active.png'),
                  label: 'item3',
                ),
                BottomNavigationBarItem(
                  icon: Image.asset('images/icon_activity_navigation.png'),
                  activeIcon:
                      Image.asset('images/icon_activity_navigation_active.png'),
                  label: 'item4',
                ),
                BottomNavigationBarItem(
                  icon: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: Color(0xffC5C5C5),
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: Image.asset('images/item2.png'),
                      ),
                    ),
                  ),
                  activeIcon: Container(
                    width: 30,
                    height: 30,
                    decoration: BoxDecoration(
                      border: Border.all(
                        width: 2,
                        color: Color(0xff35383),
                      ),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(6),
                      child: FittedBox(
                        fit: BoxFit.cover,
                        child: Image.asset('images/profile.jpg'),
                      ),
                    ),
                  ),
                  label: 'item5',
                ),
              ],
            ),
          ),
        ),
        body: IndexedStack(
          index: _selectedBottomNavigationItem,
          children: getLayout(),
        ));
  }

  List<Widget> getLayout() {
    return <Widget>[
      HomeScreen(),
      SearchScreen(),
      AddContentScreen(),
      ActivityScreen(),
      UserProfileScreen(),
    ];
  }
}
