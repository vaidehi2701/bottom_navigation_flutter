import 'package:flutter/material.dart';
import 'package:fancy_bottom_navigation/fancy_bottom_navigation.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  int initialPage = 0;

  GlobalKey bottomNavigationKey = GlobalKey();

  PageController pageController = PageController(
    initialPage: 0,
    keepPage: true,
  );

  Widget buildPageView() {
    return PageView(
      controller: pageController,
      onPageChanged: pageChanged,
      children: <Widget>[
        Red(),
        Blue(),
        Yellow(),
        Green(),
      ],
    );
  }

  @override
  void initState() {
    super.initState();
  }

  void pageChanged(int index) {
    setState(() {
      initialPage = index;
      bottomNavigationKey;
    });
  }

  void bottomTapped(int index) {
    setState(() {
      initialPage = index;
      pageController.animateToPage(index, duration: Duration(milliseconds: 500), curve: Curves.ease);
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Learn Bottom Navigation With Flash'),
      ),
      body: buildPageView(),
      bottomNavigationBar: FancyBottomNavigation(
        initialSelection: 0,
        //currentSelected: initialPage,
        key: bottomNavigationKey,
        onTabChangedListener: (index) {
          bottomTapped(index);
        },
        tabs: [
          TabData(
              iconData: Icons.home,
              title: "Home",
          ),
          TabData(
            iconData: Icons.work,
            title: "Your Job",
          ),
          TabData(
              iconData: Icons.mail,
              title: "Chat"
          ),
          TabData(
            iconData: Icons.notifications,
            title: "Notification",
          ),
        ],


      ),
//      bottomNavigationBar: BottomNavigationBar(
//        currentIndex: bottomSelectedIndex,
//        onTap: (index) {
//          bottomTapped(index);
//        },
//        items: buildBottomNavBarItems(),
//      ),
    );
  }
}



class Red extends StatefulWidget {
  @override
  _RedState createState() => _RedState();
}

class _RedState extends State<Red> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: Center(child: Text('Home Page',
      style: TextStyle(
        color: Colors.white,
        fontSize: 25
      ))),
    );
  }
}

class Blue extends StatefulWidget {
  @override
  _BlueState createState() => _BlueState();
}

class _BlueState extends State<Blue> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.blueAccent,
      child: Center(child: Text('Your Job Page',
          style: TextStyle(
              color: Colors.white,
              fontSize: 25
          ))),
    );
  }
}
class Green extends StatefulWidget {
  @override
  _GreenState createState() => _GreenState();
}

class _GreenState extends State<Green> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.greenAccent,
      child: Center(child: Text('Notification Page',
          style: TextStyle(
              color: Colors.black,
              fontSize: 25
          ))),
    );
  }
}
class Yellow extends StatefulWidget {
  @override
  _YellowState createState() => _YellowState();
}

class _YellowState extends State<Yellow> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.yellowAccent,
      child: Center(child: Text('Chat Page',
          style: TextStyle(
              color: Colors.black,
              fontSize: 25
          ))),
    );
  }
}