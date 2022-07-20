import 'package:flutter/material.dart';
import 'package:flutter_app/apps/bitcoin/bitcoin_main.dart';
import 'package:flutter_app/apps/bmi/bmi.dart';
import 'package:flutter_app/apps/clima/weather_main.dart';
import 'package:flutter_app/apps/quizzler/quizzler.dart';
import 'package:flutter_app/apps/test/test.dart';
import 'package:flutter_app/apps/xylophone/music_app.dart';

import 'apps/destini/destini.dart';
import 'apps/dicee/dice_app.dart';
import 'apps/flash_chat/chat_main.dart';
import 'apps/iamrichandiampoor/columns_and_rows.dart';
import 'apps/iamrichandiampoor/images_and_snack_bar.dart';
import 'apps/magic8ball/ask_me_anything.dart';
import 'apps/micard/bi_card.dart';
import 'dashboard.dart';
import 'my_drawer_header.dart';
import 'notifications.dart';
import 'privacy_policy.dart';
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
      // theme: const HomePage().createState().useNormalTheme ? null :  ThemeData.dark(),
      // theme: ThemeData.dark().copyWith(
      //   primaryColor: const Color(0xFF0A0E21),
      //   scaffoldBackgroundColor: const Color(0xFF0A0E21),
      // ),
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with TickerProviderStateMixin {
  var currentPage = DrawerSections.chat;
  late TabController tabController;

  @override
  void initState() {
    tabController = TabController(length: 3, vsync: this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    Widget container = DashboardPage();
    Color appBarColor = Colors.teal;
    Text title = const Text("Basheer App");
    bool centerTitle = false;
    bool _ifHideAppBar = false;
    bool _ifShowAppBarTabs = false;

    if (currentPage == DrawerSections.dashboard) {
      container = DashboardPage();
      title = const Text("Dashboard");
      appBarColor = Colors.teal;
      _ifShowAppBarTabs = true;
    } else if (currentPage == DrawerSections.imagesAndSnackBar) {
      container = const ImagesAndSnackBar();
      title = const Text("Images And SnackBar");
      _ifShowAppBarTabs = true;
    } else if (currentPage == DrawerSections.columnsAndRows) {
      container = const ColumnsAndRows();
      title = const Text("Columns And Rows");
      _ifShowAppBarTabs = true;
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
    } else if (currentPage == DrawerSections.destini) {
      container = const DestiniPage();
      title = const Text("Destini App");
      _ifHideAppBar = true;
    } else if (currentPage == DrawerSections.bmi) {
      container = const BMIPage();
      _ifHideAppBar = true;
    } else if (currentPage == DrawerSections.weather) {
      container = const WeatherPage();
      title = const Text("Weather App");
      _ifHideAppBar = true;
    } else if (currentPage == DrawerSections.bitcoin) {
      container =  const BitcoinTickerPage();
      title = const Text("Bitcoin App");
      _ifHideAppBar = true;
    } else if (currentPage == DrawerSections.chat) {
      container =  const FlashChat();
      title = const Text("Flash Chat App");
      _ifHideAppBar = true;
    } else if (currentPage == DrawerSections.test) {
      container = TestPage();
      title = const Text("Test");
      _ifHideAppBar = true;
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

    }
    return Scaffold(
      appBar: _ifHideAppBar
          ? null
          : AppBar(
              backgroundColor: appBarColor,
              title: title,
              centerTitle: centerTitle,
              bottom: _ifShowAppBarTabs ? getTabBar() : null,
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

  TabBar getTabBar() {
    return TabBar(
      indicatorColor: Colors.white,
      tabs: const <Tab>[
        Tab(
          text: 'Dashboard',
        ),
        Tab(
          text: 'Images',
        ),
        Tab(
          text: 'Columns & Row',
        ),
      ],
      // setup the controller
      controller: tabController,
      onTap: (index) {
        setState(() {
          currentPage = DrawerSections.values[index];
        });
      },
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
          menuItem(9, "Destini App", Icons.quiz_outlined,
              currentPage == DrawerSections.destini ? true : false),
          menuItem(10, "BMI CALCULATOR", Icons.calculate_outlined,
              currentPage == DrawerSections.bmi ? true : false),
          menuItem(11, "Weather App", Icons.sunny_snowing,
              currentPage == DrawerSections.weather ? true : false),
          menuItem(12, "Bitcoin Ticker App", Icons.currency_bitcoin,
              currentPage == DrawerSections.bitcoin ? true : false),
          menuItem(13, "Flash Chat App", Icons.chat,
              currentPage == DrawerSections.chat ? true : false),
          const Divider(),
          menuItem(14, "Test", Icons.android,
              currentPage == DrawerSections.test ? true : false),
          menuItem(15, "Settings", Icons.settings_outlined,
              currentPage == DrawerSections.settings ? true : false),
          menuItem(16, "Notifications", Icons.notifications_outlined,
              currentPage == DrawerSections.notifications ? true : false),
          const Divider(),
          menuItem(17, "Privacy policy", Icons.privacy_tip_outlined,
              currentPage == DrawerSections.privacyPolicy ? true : false),
          menuItem(18, "Send feedback", Icons.feedback_outlined,
              currentPage == DrawerSections.sendFeedback ? true : false),
          menuItemAbout(
            19,
            "About - Long Press",
            Icons.info_outline,
            currentPage == DrawerSections.about ? true : false,
            'Basheer App',
            '1.0',
            const Icon(Icons.adb),
            '© 2022 Basheer Inc.',
            [
              const Padding(
                padding: EdgeInsets.only(top: 20.0),
                child: Text('Hallo from here :)'),
              )
            ],
          ),
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
              currentPage = DrawerSections.destini;
            } else if (id == 10) {
              currentPage = DrawerSections.bmi;
            } else if (id == 11) {
              currentPage = DrawerSections.weather;
            } else if (id == 12) {
              currentPage = DrawerSections.bitcoin;
            } else if (id == 13) {
              currentPage = DrawerSections.chat;
            } else if (id == 14) {
              currentPage = DrawerSections.test;
            } else if (id == 15) {
              currentPage = DrawerSections.settings;
            } else if (id == 16) {
              currentPage = DrawerSections.notifications;
            } else if (id == 17) {
              currentPage = DrawerSections.privacyPolicy;
            } else if (id == 18) {
              currentPage = DrawerSections.sendFeedback;
            } else if (id == 19) {
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
  destini,
  bmi,
  weather,
  bitcoin,
  chat,
  test,
  settings,
  notifications,
  privacyPolicy,
  sendFeedback,
  about,
}
