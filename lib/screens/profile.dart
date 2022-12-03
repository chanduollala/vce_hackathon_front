import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:google_fonts/google_fonts.dart';
import '../authentication.dart';
import '../bottomnavbar.dart';
import '../main.dart';
import 'homepage.dart';
import 'login.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}

class _ProfilePageState extends State<ProfilePage> {
  int _counter = 0;

  bool _isloggingOut = false;

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
    final Future<SharedPreferences> _sharedPrefs =
        SharedPreferences.getInstance();
    goToLoginPage() {
      Navigator.pop(context);
      Navigator.push(
        context,
        MaterialPageRoute(builder: (context) => const LoginPage(title: "hii")),
      );
    }

    Future<void> removeUserData() async {
      final SharedPreferences sharedPrefs = await _sharedPrefs;

      // TODO save user to backend
      setState(() {
        sharedPrefs.setString('name', "").then((bool success) {
          print("User logged out");
          goToLoginPage();
        });
      });
    }

    return Scaffold(
      appBar: AppBar(
          //leading: Icon(Icons.menu),
          title: Text('Fluck'),
          actions: [
            IconButton(onPressed: () {}, icon: Icon(Icons.notifications)),
            IconButton(onPressed: () {}, icon: Icon(Icons.call)),
            IconButton(
                onPressed: () {},
                icon: Icon(Icons.account_balance_wallet_outlined))
          ],
          bottom: PreferredSize(
              preferredSize: Size.fromHeight(30),
              child: Container(
                padding: EdgeInsets.only(left: 10, right: 10, bottom: 8),
                child: Container(
                  padding: EdgeInsets.only(left: 15),
                  height: 35,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(20)),
                  child: const TextField(
                    obscureText: false,
                    decoration: InputDecoration(
                        icon: Icon(Icons.search),
                        hintText: 'Search anything',
                        border: InputBorder.none),
                  ),
                ),
              ))),
      drawer: Drawer(
        backgroundColor: Colors.white,
        width: MediaQuery.of(context).size.width * 0.9,
        child: Column(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.black87,
              ),
              child: Stack(children: [
                Container(
                  height: 200,
                ),
                Positioned(
                    child: Container(
                  height: 80,
                  width: 80,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    image: DecorationImage(
                      image: AssetImage("images/charminar.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                )),
                Positioned(
                    left: 90,
                    top: 5,
                    child: Container(
                      height: 80,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text("Chandrashekar Ollala",
                              style: TextStyle(
                                  fontSize: 20,
                                  // fontWeight: FontWeight.bold,
                                  color: Colors.white)),
                          Text("chandrashekarollala10@gmail.com",
                              style: TextStyle(
                                  fontSize: 14,
                                  // fontWeight: FontWeight.bold,
                                  color: Colors.white54)),
                          Padding(
                            padding: const EdgeInsets.only(top: 8.0),
                            child: Row(
                              children: [
                                Container(
                                  height: 20,
                                  width: 30,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      image: DecorationImage(
                                          image: NetworkImage(
                                              "https://www.worldometers.info//img/flags/small/tn_us-flag.gif"),
                                          fit: BoxFit.cover)),
                                ),
                                Text(
                                  '  United States Citizen',
                                  style: TextStyle(color: Colors.white),
                                )
                              ],
                            ),
                          )
                        ],
                      ),
                    )),
                Positioned(
                    top: 90,
                    child: Container(
                      width: MediaQuery.of(context).size.width * 0.8,
                      child: Row(
                        children: [
                          Expanded(
                            child: Container(
                              // width: MediaQuery.of(context).size.width * 0.4,
                              child: ElevatedButton(
                                child: Text(
                                  "View Profile",
                                  style: TextStyle(color: Colors.black),
                                ),
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white),
                              ),
                            ),
                          ),
                          Padding(padding: EdgeInsets.symmetric(horizontal: 5)),
                          Expanded(
                            child: Container(
                              // width: MediaQuery.of(context).size.width * 0.4,
                              child: ElevatedButton(
                                child: Text(
                                  "View Profile",
                                  style: TextStyle(color: Colors.black),
                                ),
                                onPressed: () {},
                                style: ElevatedButton.styleFrom(
                                    backgroundColor: Colors.white),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ))
              ]),
            ),
            /*
            Container(
              height: 60,
              padding: EdgeInsets.symmetric(horizontal: 10),
              decoration: BoxDecoration(
                gradient: const LinearGradient(
                  colors: [Colors.purple, Colors.blueAccent, Colors.yellow],
                  begin: Alignment.bottomLeft,
                  end: Alignment.topRight,
                  stops: [0.2, 0.5, 0.85],
                  tileMode: TileMode.repeated,
                ),
              ),
              child: Row(
                children: [
                  Icon(Icons.location_pin, color: Colors.white,),
                  Text("You are exploring: ",
                      style: TextStyle(
                          fontSize: 20,
                          color: Colors.white
                      )
                  ),
                  Expanded(
                    child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                            backgroundColor: Colors.white70,
                            shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.all(Radius.circular(10))
                            )
                        ),
                        onPressed: (){},
                        child: Text("Hyderabad", style: TextStyle(
                            color: Colors.black
                        ),)
                    ),
                  )

                ],
              ),
            ),
             */

            ListTile(
              leading: Icon(Icons.document_scanner),
              title: const Text('Your documents'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            Divider(
              height: 2,
              thickness: 2,
              color: Colors.black12,
            ),
            ListTile(
              leading: Icon(Icons.wallet_outlined),
              title: const Text('Wallet Money'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            Divider(
              height: 2,
              thickness: 2,
              color: Colors.black12,
            ),
            ListTile(
              leading: Icon(Icons.event),
              title: const Text('Events in the city'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
            Divider(
              height: 2,
              thickness: 2,
              color: Colors.black12,
            ),
            ListTile(
              leading: Icon(Icons.schedule),
              title: const Text('Your schedule'),
              onTap: () {},
            ),
            Divider(
              height: 2,
              thickness: 2,
              color: Colors.black12,
            ),
            ListTile(
              leading: Icon(Icons.hotel),
              title: const Text('Hotels & Accommodation'),
              onTap: () {},
            ),
            Divider(
              height: 2,
              thickness: 2,
              color: Colors.black12,
            ),
            ListTile(
              leading: Icon(Icons.fastfood),
              title: const Text('Eats'),
              onTap: () {},
            ),
            Divider(
              height: 2,
              thickness: 2,
              color: Colors.black12,
            ),
            Spacer(),
            ListTile(
              title: Text('Item 2'),
              onTap: () {
                // Update the state of the app.
                // ...
              },
            ),
          ],
        ),
      ),
      body: SingleChildScrollView(
        physics: BouncingScrollPhysics(),
        child: Container(
          height: MediaQuery.of(context).size.height,
          padding: EdgeInsets.only(
            top: 30,
            right: 15,
            left: 15,
          ),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                FutureBuilder(builder: (context, snapshot) {
                  // if (snapshot.hasData) {
                  if (true) {
                    return Column(
                      children: [
                        Align(
                          alignment: Alignment.topCenter,
                          child: Stack(
                            children: [
                              CircleAvatar(
                                radius: 76,
                                backgroundColor: Colors.black54,
                                child: CircleAvatar(
                                  radius: 72,
                                  backgroundColor: Colors.white,
                                  child: CircleAvatar(
                                    radius: 69,
                                    backgroundImage: NetworkImage(
                                        "https://media-exp1.licdn.com/dms/image/C5603AQHq8Npl1dgeyg/profile-displayphoto-shrink_800_800/0/1657644580184?e=2147483647&v=beta&t=olKz-CMg7U3nQbbDisHO1qDf3xzXxYRXHSUxP0GgGOM"),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 5,
                        ),
                        Text(
                          "Chandrashekar Ollala",
                          style: GoogleFonts.openSans(
                            fontSize: 20,
                            fontWeight: FontWeight.w700,
                            color: Colors.black,
                          ),
                        ),
                        Text(
                          "chandrashekarollala10@gmail.com",
                          style: GoogleFonts.openSans(
                            fontSize: 15,
                            fontWeight: FontWeight.w600,
                            color: Colors.black54,
                          ),
                        ),
                      ],
                    );
                  } else {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                }),
                SizedBox(
                  height: 5,
                ),
                MaterialButton(
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => MyHomePage(title: "kk")));
                  },
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(25),
                      gradient: LinearGradient(
                        colors: <Color>[
                          Color(0xFF0D47A1),
                          Color(0xFF1976D2),
                          Color(0xFF42A5F5),
                        ],
                      ),
                    ),
                    margin:
                        EdgeInsets.only(left: 0, right: 0, bottom: 10, top: 5),
                    width: MediaQuery.of(context).size.width * 0.5,
                    height: 35,
                    child: Center(
                      child: const Text(
                        'Edit Profile',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                Divider(
                  color: Colors.grey,
                ),
                ListTile(
                  leading: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {},
                    child: Container(
                      width: 48,
                      height: 48,
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      alignment: Alignment.center,
                      child: CircleAvatar(
                        backgroundColor: Color(0xFF0D47A1),
                        child: const Icon(
                          Icons.settings,
                          color: Colors.white,
                          size: 30,
                        ),
                      ),
                    ),
                  ),
                  trailing: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {},
                    child: Container(
                      width: 48,
                      height: 48,
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                  title: const Text(
                    "Settings",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  dense: false,
                ),
                ListTile(
                  leading: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {},
                    child: Container(
                      width: 48,
                      height: 48,
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      alignment: Alignment.center,
                      child: const CircleAvatar(
                        backgroundColor: Color(0xFF0D47A1),
                        child: Icon(
                          Icons.rotate_left_rounded,
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ),
                  trailing: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {},
                    child: Container(
                      width: 48,
                      height: 48,
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                  title: const Text(
                    "Previous Orders",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  dense: false,
                ),
                ListTile(
                  leading: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {},
                    child: Container(
                      width: 48,
                      height: 48,
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      alignment: Alignment.center,
                      child: const CircleAvatar(),
                    ),
                  ),
                  trailing: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {},
                    child: Container(
                      width: 48,
                      height: 48,
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                  title: const Text(
                    "User Mangement",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  dense: false,
                ),
                Divider(
                  color: Colors.grey,
                ),
                ListTile(
                  leading: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {},
                    child: Container(
                      width: 48,
                      height: 48,
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      alignment: Alignment.center,
                      child: const CircleAvatar(),
                    ),
                  ),
                  trailing: GestureDetector(
                    behavior: HitTestBehavior.translucent,
                    onTap: () {},
                    child: Container(
                      width: 48,
                      height: 48,
                      padding: const EdgeInsets.symmetric(vertical: 4.0),
                      alignment: Alignment.center,
                      child: Icon(
                        Icons.arrow_forward_ios,
                        color: Colors.black,
                        size: 20,
                      ),
                    ),
                  ),
                  title: const Text(
                    "About Us",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  dense: false,
                ),
                ListTile(
                  onTap: () async {
                    setState(() {
                      _isloggingOut = true;
                    });
                    await Authentication.signOut(context: context);
                    setState(() {
                      _isloggingOut = false;
                    });
                    removeUserData();
                  },
                  leading: Container(
                    width: 48,
                    height: 48,
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    alignment: Alignment.center,
                    child: CircleAvatar(
                      backgroundColor: Color(0xFF0D47A1),
                      child: const Icon(
                        Icons.logout_rounded,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  trailing: Container(
                    width: 48,
                    height: 48,
                    padding: const EdgeInsets.symmetric(vertical: 4.0),
                    alignment: Alignment.center,
                    child: Icon(
                      Icons.arrow_forward_ios,
                      color: Colors.black,
                      size: 20,
                    ),
                  ),
                  title: const Text(
                    "Logout",
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  dense: false,
                ),
              ]),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
      bottomNavigationBar: BottomBar(
          selected:
              4), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
