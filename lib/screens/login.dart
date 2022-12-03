import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../authentication.dart';
import 'homepage.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  int _counter = 0;
  bool isSigningIn = false;
  final Future<SharedPreferences> _sharedPrefs =
      SharedPreferences.getInstance();

  goToDashBoard() {
    Navigator.pop(context);
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MyHomePage(title: "hii")),
    );
  }

  setUser(User _user) async {
    final SharedPreferences sharedPrefs = await _sharedPrefs;

    // TODO save user to backend
    setState(() {
      sharedPrefs.setString('name', _user.displayName!).then((bool success) {
        print("updated Name: ${sharedPrefs.get('name')}");
        goToDashBoard();
      });
    });
  }

  void _incrementCounter() {
    setState(() {
      // This call to setState tells the Flutter framework that something has
      // changed in this State, which causes it to rerun the build method below
      // so that the display can reflect the updated values. If we changed
      // _counter without calling setState(), then the build method would not be
      // called again, and so nothing would appear to happen.
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    // This method is rerun every time setState is called, for instance as done
    // by the _incrementCounter method above.
    //
    // The Flutter framework has been optimized to make rerunning build methods
    // fast, so that you can just rebuild anything that needs updating rather
    // than having to individually change instances of widgets.
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 30.0, right: 30, top: 80),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Image(
              height: 150,
              image: AssetImage('images/fluck-logo.png'),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            Text(
              'Sign in with your credentials',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: Colors.white,
              elevation: 30,
              child: Container(
                padding: EdgeInsets.only(left: 15),
                height: 50,
                child: const TextField(
                  obscureText: false,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                      icon: Icon(Icons.person),
                      hintText: 'Username',
                      border: InputBorder.none),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 5)),
            Card(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10)),
              color: Colors.white,
              elevation: 30,
              child: Container(
                padding: EdgeInsets.only(left: 15),
                height: 50,
                child: const TextField(
                  obscureText: true,
                  style: TextStyle(fontSize: 20),
                  decoration: InputDecoration(
                      icon: Icon(Icons.password),
                      hintText: 'Password',
                      border: InputBorder.none),
                ),
              ),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 20)),
            Row(children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    Navigator.pop(context);
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const MyHomePage(title: "hii")),
                    );
                  },
                  child: Text(
                    'Sign in',
                    style: TextStyle(fontSize: 18),
                  ),
                  style: ElevatedButton.styleFrom(
                      elevation: 30,
                      fixedSize: Size.fromHeight(50),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10))),
                ),
              )
            ]),
            Padding(padding: EdgeInsets.symmetric(vertical: 8)),
            Row(
              children: [
                Text(
                  'I dont remember my password',
                  style: TextStyle(
                      fontSize: 18,
                      color: Colors.indigo,
                      decoration: TextDecoration.underline),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 5)),
            Row(children: [
              Expanded(
                child: ElevatedButton(
                  onPressed: () {
                    print('ji');
                  },
                  child: Text(
                    "Don't have an account? Signup",
                    style: TextStyle(fontSize: 18, color: Colors.indigo),
                  ),
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.white70,
                      fixedSize: Size.fromHeight(50),
                      shape: RoundedRectangleBorder(
                          side: BorderSide(color: Colors.indigo, width: 3),
                          borderRadius: BorderRadius.circular(10))),
                ),
              )
            ]),
            Padding(padding: EdgeInsets.symmetric(vertical: 5)),
            Divider(
              height: 2,
              thickness: 2,
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 5)),
            Text(
              "or",
              style: TextStyle(fontSize: 18),
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 10)),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 45,
                    child: FutureBuilder(
                      builder: (context, snapshot) {

                          return ElevatedButton(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Image(
                                    height: 25,
                                    width: 25,
                                    image: AssetImage('images/google.png')),
                                Expanded(
                                  child: Text(
                                    isSigningIn
                                        ? "Please wait .."
                                        : "Sign in with Google",
                                    textAlign: TextAlign.center,
                                    style: TextStyle(
                                        color: Colors.black87, fontSize: 18),
                                  ),
                                ),
                                Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 15))
                              ],
                            ),
                            onPressed: isSigningIn
                                ? () {}
                                : () async {
                                    setState(() {
                                      isSigningIn = true;
                                    });

                                    User? user =
                                        await Authentication.signInWithGoogle(
                                            context: context);

                                    setState(() {
                                      isSigningIn = false;
                                    });

                                    if (user != null) {
                                      await setUser(user);
                                    }
                                  },
                            style: ElevatedButton.styleFrom(
                                backgroundColor: isSigningIn
                                    ? Colors.white12
                                    : Colors.white),
                          );
                      },
                    ),
                  ),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.symmetric(vertical: 5)),
            Row(
              children: [
                Expanded(
                  child: Container(
                    height: 45,
                    // width: MediaQuery.of(context).size.width * 0.4,
                    child: ElevatedButton(
                      child: Row(
                        children: [
                          Image(
                              height: 25,
                              width: 25,
                              image: AssetImage('images/apple.png')),
                          Expanded(
                            child: Text(
                              "Sign in with Apple",
                              textAlign: TextAlign.center,
                              style:
                                  TextStyle(color: Colors.white, fontSize: 18),
                            ),
                          ),
                          Padding(padding: EdgeInsets.symmetric(horizontal: 15))
                        ],
                      ),
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                          backgroundColor:
                              isSigningIn ? Colors.black87 : Colors.black),
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ));

  }
}
