import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../bottomnavbar.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

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
            ),
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
                            Padding(
                                padding: EdgeInsets.symmetric(horizontal: 5)),
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
        body: Center(
          // Center is a layout widget. It takes a single child and positions it
          // in the middle of the parent.
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
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
              Stack(children: [
                Container(
                  height: 300,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage("images/charminar.jpg"),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  child: Container(
                    height: 300,
                    decoration: BoxDecoration(
                      gradient: const LinearGradient(
                        colors: [Colors.black, Colors.transparent],
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        stops: [0, 0.6],
                        tileMode: TileMode.repeated,
                      ),
                    ),
                  ),
                ),
                Positioned(
                    child: Container(
                        padding: EdgeInsets.only(left: 20, top: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Welcome back,",
                              style:
                                  TextStyle(fontSize: 26, color: Colors.white),
                            ),
                            Text(
                              "Chandu",
                              style: TextStyle(
                                  fontSize: 42,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white),
                            ),

                            Text(
                              "Hope you're doing good :)",
                              style:
                              TextStyle(fontSize: 18, color: Colors.white),
                            ),

                          ],
                        ))),
                /*
                Positioned(
                  bottom: 10,
                  left: 10,
                  child: Container(
                    height: 100,
                    width: MediaQuery.of(context).size.width-20,
                    padding: EdgeInsets.all(10),
                    decoration: BoxDecoration(
                      color: Colors.white70,
                    ),
                    child: Text("hi"),

                  ),
                )

                 */
              ]),
              Card(
                  child: Container(
                    padding: EdgeInsets.all(10),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Not feeling well? Consult a doctor",
                          style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              )),Padding(
                            padding: const EdgeInsets.symmetric(vertical: 8.0),
                            child: Row(
                              children: [
                                Expanded(
                                        child: ElevatedButton(
                                          child: Text("Book an appointment",
                                          style: TextStyle(
                                            fontSize: 18
                                          ),),
                                          onPressed: (){},
                                          style: ElevatedButton.styleFrom(
                                            fixedSize: Size.fromHeight(50)
                                          ),
                                        ),
                                      ),
                              ],
                            ),
                          ),
                      ],
                    ),
                  ),
              ),
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Card(
                  child: Container(
                    height: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Facing an issue?",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            )),
                        Expanded(
                          child: Card(
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
                                    icon: Icon(Icons.search),
                                    hintText: 'Search for the problem',
                                    border: InputBorder.none),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                height: 100,
                width: MediaQuery.of(context).size.width,
                padding: EdgeInsets.all(10),
                decoration: BoxDecoration(
                  color: Colors.white,
                ),
                child: Card(
                  child: Container(
                    height: 100,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text("Facing an issue?",
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            )),
                        Expanded(
                          child: Card(
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
                                    icon: Icon(Icons.search),
                                    hintText: 'Search for the problem',
                                    border: InputBorder.none),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: _incrementCounter,
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ),
        bottomNavigationBar: BottomBar(
          selected: 0,
        ));
  }
}
