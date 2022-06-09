import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_app/screens/music_app.dart';
import 'package:flutter_app/screens/quizzler.dart';

import 'dashboard.dart';
import 'my_drawer_header.dart';
import 'notifications.dart';
import 'privacy_policy.dart';
import 'screens/ask_me_anything.dart';
import 'screens/bi_card.dart';
import 'screens/columns_and_rows.dart';
import 'screens/dice_app.dart';
import 'screens/images_and_snack_bar.dart';
import 'send_feedback.dart';
import 'settings.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var currentPage = DrawerSections.dashboard;

  @override
  Widget build(BuildContext context) {
    Widget container = DashboardPage();
    Color appBarColor = Colors.teal;
    Text title = const Text("Basheer App");
    bool centerTitle = false;
    bool _ifHideAppBar = false;
    if (currentPage == DrawerSections.dashboard) {
      container = DashboardPage();
      title = const Text("Dashboard");
      appBarColor = Colors.teal;
    } else if (currentPage == DrawerSections.imagesAndSnackBar) {
      container = const ImagesAndSnackBar();
      title = const Text("Images And SnackBar");
    } else if (currentPage == DrawerSections.columnsAndRows) {
      container = const ColumnsAndRows();
      title = const Text("Columns And Rows");
    } else if (currentPage == DrawerSections.biCard) {
      container = const BiCard();
      title = const Text("Bi Card");
    } else if (currentPage == DrawerSections.diceApp) {
      container = const DiceApp();
      title = const Text("Dice App", textAlign: TextAlign.center);
      appBarColor = Colors.red;
      centerTitle = true;
    } else if (currentPage == DrawerSections.askMeAnything) {
      container = const AskMeAnything();
      title = const Text("Ask Me Anything");
      appBarColor = Colors.blue;
    } else if (currentPage == DrawerSections.musicApp) {
      container = const MusicAppPage();
      title = const Text("Music App");
      appBarColor = Colors.grey;
    } else if (currentPage == DrawerSections.quizzler) {
      container = const QuizzlerPage();
      title = const Text("Quizzler App");
      appBarColor = Colors.grey.shade900;
      // _ifHideAppBar = true;
    } else if (currentPage == DrawerSections.settings) {
      container = SettingsPage();
      title = const Text("Settings");
    } else if (currentPage == DrawerSections.notifications) {
      container = NotificationsPage();
      title = const Text("Notifications");
    } else if (currentPage == DrawerSections.privacyPolicy) {
      container = PrivacyPolicyPage();
      title = const Text("Privacy Policy");
    } else if (currentPage == DrawerSections.sendFeedback) {
      container = SendFeedbackPage();
      title = const Text("Send Feedback");
    } else if (currentPage == DrawerSections.about) {
      // currentPage = currentPage;
      // container = const AboutListTile(
      //   icon: Icon(
      //     Icons.info,
      //   ),
      //   child: Text('About app'),
      //   applicationIcon: Icon(
      //     Icons.local_play,
      //   ),
      //   applicationName: 'Basheer App',
      //   applicationVersion: '1.0.0',
      //   applicationLegalese: '© 2022 Basheer Inc.',
      //   aboutBoxChildren: [
      //     ///Content goes here...
      //     Text('Hallo'),
      //   ],
      // );
      // title = const Text("About");

    }
    return Scaffold(
      appBar: _ifHideAppBar ? null :  AppBar(
        backgroundColor: appBarColor,
        // title: const Text("Basheer App"),
        // leading: IconButton(
        //   onPressed: () {},
        //   icon: const Icon(Icons.list),
        // ),
        title: title,
        // centerTitle: currentPage == DrawerSections.lesson_4 ? true : false,
        centerTitle: centerTitle,
        // actions: [
        //   IconButton(
        //     icon: const Icon(Icons.settings),
        //     onPressed: () {},
        //   ),
        //   // add more IconButton
        // ],
      ),
      body: container,
      drawer: Drawer(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const MyHeaderDrawer(),
              myDrawerList(),
            ],
          ),
        ),
      ),
    );
  }

  Widget myDrawerList() {
    return Container(
      padding: const EdgeInsets.only(
        top: 15,
      ),
      child: Column(
        // shows the list of menu drawer
        children: [
          menuItem(1, "Dashboard", Icons.dashboard_outlined,
              currentPage == DrawerSections.dashboard ? true : false),
          const Divider(),
          menuItem(2, "Images And SnackBar", Icons.image,
              currentPage == DrawerSections.imagesAndSnackBar ? true : false),
          menuItem(3, "Columns And Rows", Icons.event,
              currentPage == DrawerSections.columnsAndRows ? true : false),
          menuItem(4, "Bi Card", Icons.portrait_outlined,
              currentPage == DrawerSections.biCard ? true : false),
          menuItem(5, "Dice App", Icons.gamepad_outlined,
              currentPage == DrawerSections.diceApp ? true : false),
          menuItem(6, "Ask Me Anything", Icons.quiz_outlined,
              currentPage == DrawerSections.askMeAnything ? true : false),
          menuItem(7, "Music App", Icons.music_note_outlined,
              currentPage == DrawerSections.musicApp ? true : false),
          menuItem(8, "Quizzler App", Icons.quiz_outlined,
              currentPage == DrawerSections.quizzler ? true : false),
          const Divider(),
          menuItem(9, "Settings", Icons.settings_outlined,
              currentPage == DrawerSections.settings ? true : false),
          menuItem(10, "Notifications", Icons.notifications_outlined,
              currentPage == DrawerSections.notifications ? true : false),
          const Divider(),
          menuItem(11, "Privacy policy", Icons.privacy_tip_outlined,
              currentPage == DrawerSections.privacyPolicy ? true : false),
          menuItem(12, "Send feedback", Icons.feedback_outlined,
              currentPage == DrawerSections.sendFeedback ? true : false),
          menuItemAbout(
              13,
              "About - Long Press",
              Icons.info_outline,
              currentPage == DrawerSections.about ? true : false,
              'Basheer App',
              '1.0',
              const Icon(Icons.adb),
              '© 2022 Basheer Inc.', [
            const Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Text('Hallo from here :)'),
            )
          ]),
        ],
      ),
    );
  }

  Widget menuItem(int id, String title, IconData icon, bool selected) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onTap: () {
          Navigator.pop(context);
          setState(() {
            if (id == 1) {
              currentPage = DrawerSections.dashboard;
            } else if (id == 2) {
              currentPage = DrawerSections.imagesAndSnackBar;
            } else if (id == 3) {
              currentPage = DrawerSections.columnsAndRows;
            } else if (id == 4) {
              currentPage = DrawerSections.biCard;
            } else if (id == 5) {
              currentPage = DrawerSections.diceApp;
            } else if (id == 6) {
              currentPage = DrawerSections.askMeAnything;
            } else if (id == 7) {
              currentPage = DrawerSections.musicApp;
            } else if (id == 8) {
              currentPage = DrawerSections.quizzler;
            } else if (id == 9) {
              currentPage = DrawerSections.settings;
            } else if (id == 10) {
              currentPage = DrawerSections.notifications;
            } else if (id == 11) {
              currentPage = DrawerSections.privacyPolicy;
            } else if (id == 12) {
              currentPage = DrawerSections.sendFeedback;
            } else if (id == 13) {
              currentPage = DrawerSections.about;
            }
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget menuItemAbout(
      int id,
      String title,
      IconData icon,
      bool selected,
      String applicationName,
      String applicationVersion,
      Widget? applicationIcon,
      String applicationLegalese,
      List<Widget>? aboutBoxChildren) {
    return Material(
      color: selected ? Colors.grey[300] : Colors.transparent,
      child: InkWell(
        onLongPress: () {
          // Navigator.pop(context);
          showAboutDialog(
            context: context,
            applicationName: applicationName,
            applicationVersion: applicationVersion,
            applicationIcon: applicationIcon,
            applicationLegalese: applicationLegalese,
            children: aboutBoxChildren,
          );
          setState(() {
            if (id == 11) {
              // currentPage = DrawerSections.about;
            }
          });
        },
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Row(
            children: [
              Expanded(
                child: Icon(
                  icon,
                  size: 20,
                  color: Colors.black,
                ),
              ),
              Expanded(
                flex: 3,
                child: Text(
                  title,
                  style: const TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

enum DrawerSections {
  dashboard,
  imagesAndSnackBar,
  columnsAndRows,
  biCard,
  diceApp,
  askMeAnything,
  musicApp,
  quizzler,
  settings,
  notifications,
  privacyPolicy,
  sendFeedback,
  about,
}
