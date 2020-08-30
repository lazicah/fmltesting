import 'package:flutter/material.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:verify_app/core/constants/view_routes.dart';
import 'package:verify_app/ui/helpers/theme/ui_helper.dart';
import 'package:verify_app/ui/screens/homescreens/homepage.dart';
import 'package:verify_app/ui/screens/homescreens/settingspage.dart';

class HomeSceen extends StatefulWidget {
  @override
  _HomeSceenState createState() => _HomeSceenState();
}

class _HomeSceenState extends State<HomeSceen> {
  int _pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Home',
          style: TextStyle(fontSize: 15.0),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.notifications_none),
            onPressed: () {},
          ),
          SizedBox(
            width: UIhelper.kPaddingS,
          ),
          IconButton(
            padding: EdgeInsets.symmetric(vertical: 5.0),
            icon: CircleAvatar(
              backgroundImage: AssetImage('assets/images/chefavatar2.jpg'),
            ),
            onPressed: () {},
          ),
          SizedBox(
            width: UIhelper.kPaddingM,
          ),
        ],
      ),
      drawer: Theme(
        data: Theme.of(context)
            .copyWith(canvasColor: Theme.of(context).primaryColor),
        child: Drawer(
          child: ListTileTheme(
            style: ListTileStyle.drawer,
            textColor: Theme.of(context).cardColor,
            iconColor: Theme.of(context).cardColor,
            child: Column(
              children: [
                Expanded(
                  child: ListView(
                    shrinkWrap: true,
                    physics: BouncingScrollPhysics(),
                    children: [
                      DrawerHeader(
                        padding: EdgeInsets.symmetric(
                          horizontal: 24,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    'Hello',
                                    style: Theme.of(context)
                                        .textTheme
                                        .headline4
                                        .copyWith(color: Colors.white),
                                  ),
                                  Text(
                                    'Gary Simmons',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyText1
                                        .copyWith(color: Colors.white),
                                  )
                                ],
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pop(context);
                              },
                              child: Icon(
                                Icons.clear,
                                color: Colors.white,
                              ),
                            )
                          ],
                        ),
                      ),
                      ListTile(
                        leading: ImageIcon(
                            AssetImage('assets/images/instruction.png')),
                        title: Text('Instructions'),
                        onTap: () {
                          // Update the state of the app
                          // ...
                          // Then close the drawer
                          Navigator.pop(context);
                          Navigator.pushNamed(context, ViewRoutes.instructions);
                        },
                      ),
                      ListTile(
                        leading: Icon(Icons.notifications_none),
                        title: Text('Notifications'),
                        onTap: () {
                          // Update the state of the app
                          // ...
                          // Then close the drawer
                          Navigator.pop(context);
                          Navigator.pushNamed(
                              context, ViewRoutes.notifications);
                        },
                      ),
                      ListTile(
                        leading: Icon(MdiIcons.accountOutline),
                        title: Text('Verify Account'),
                        onTap: () {
                          // Update the state of the app
                          // ...
                          // Then close the drawer
                          Navigator.pop(context);
                          Navigator.pushNamed(context, ViewRoutes.verification);
                        },
                      ),
                    ],
                  ),
                ),
                ListTile(
                  leading: Icon(MdiIcons.exitToApp),
                  title: Text('Exit'),
                  onTap: () {
                    // Update the state of the app
                    // ...
                    // Then close the drawer
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            title: Text('Home'),
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            title: Text('Settings'),
          ),
        ],
        currentIndex: _pageIndex,
        onTap: (index) {
          setState(() {
            _pageIndex = index;
          });
        },
      ),
      body: PageView.builder(
        physics: NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) =>
            [HomePage(), SettingsPage()][_pageIndex],
      ),
    );
  }
}
