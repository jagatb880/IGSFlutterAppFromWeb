import 'package:indian_genius_search/intro_slide_image.dart';
import 'package:indian_genius_search/user_preference.dart';
import 'package:flutter/material.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Indian Genius Search',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var status;

  @override
  void initState() {
    super.initState();
    getUserData();
  }

  getUserData() async {
    await UserPreferences.init();
    status = await UserPreferences.getFirstTimeUser();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: IntroSlidePage(),
      // body: FutureBuilder<bool>(
      //   future: status,
      //   builder: (BuildContext context, AsyncSnapshot<bool> snapshot) {
      //     if (snapshot.hasData) {
      //       return WebPage();
      //     } else {
      //       return IntroSliderPage();
      //     }
      //   },
      // ),
    );
  }
}
