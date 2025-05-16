// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ipl_auction/data.dart'; 
import 'package:ipl_auction/widgets.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'IPL Auction Portal Goonj',
      theme: ThemeData(
        primarySwatch: Colors.deepOrange,
      ),
      home: const MyHomePage(title: 'Auction Portal'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var player_no = 1;
  num current_bid = 400;
  final darkYellow = const Color.fromARGB(255, 228, 90, 4);
  final controller = TextEditingController();

  setStartingBid() {
    setState(() {
      current_bid = (Players.players.isNotEmpty)
          ? Players.players[player_no - 1].basePrice
          : 400;
    });
  }

  incrementPlayerNo() {
    setState(() {
      if (player_no <= Players.players.length - 1) {
        player_no = player_no + 1;
      }
    });
    setStartingBid();
  }

  decrementPlayerNo() {
    setState(() {
      if (player_no >= 2) {
        player_no = player_no - 1;
      }
    });
    setStartingBid();
  }

  incrementCurrentBid() {
    setState(() {
      if (current_bid < 100) {
        current_bid = current_bid + 10;
      } else if (current_bid < 500) {
        current_bid = current_bid + 20;
      } else if (current_bid < 1000) {
        current_bid = current_bid + 50;
      } else {
        current_bid = current_bid + 100;
      }
    });
  }

  decrementCurrentBid() {
    setState(() {
      if (current_bid >= 10) current_bid = current_bid - 10;
    });
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(const Duration(seconds: 2));
    var playersJson = await rootBundle.loadString("assets/data.json");
    var decodedData = jsonDecode(playersJson);
    var playersJsonList = decodedData["players"];
    Players.players = List.from(playersJsonList)
        .map(
          (playerMap) => Player.fromMap(playerMap),
        )
        .toList();
    // print(playersJsonList);
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    final screenSize = MediaQuery.of(context).size;
    return Scaffold(
        extendBodyBehindAppBar: true,
        appBar: AppBar(
          title: Text(widget.title, textScaleFactor: 1.5),
          backgroundColor: Colors.transparent,
          // elevation: 1,
        ),
        body: Container(
          decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/pics/bg.png'),
              fit: BoxFit.cover,
            ),
          ),
          child: Row(
            // mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SizedBox(
                          width: screenSize.width * 0.125,
                          child: TextField(
                            onChanged: (value) {
                              try {
                                if (value == '') {
                                  value = '1';
                                }
                                setState(() {
                                  var temp = int.parse(value);
                                  if (temp <= 191 && temp >= 1) {
                                    player_no = temp;
                                  }
                                });
                                setStartingBid();
                              } catch (e) {
                                // ignore: avoid_print
                                print(e);
                              }
                            },
                            style: const TextStyle(color: Colors.white),
                            cursorColor: Colors.white,
                            decoration: inpDecor.copyWith(
                              hintText: 'Player No.',
                              hintStyle: const TextStyle(
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
                    CircleAvatar(
                        radius: 205,
                        backgroundColor: Colors.deepOrange,
                        child: CircleAvatar(
                          backgroundImage: AssetImage(
                              (Players.players.isNotEmpty)
                                  ? Players.players[player_no - 1].pathOfImage
                                  : 'assets/pics/1.jpg'),
                          // backgroundImage: AssetImage('assets/2.jpg'),
                          // backgroundImage: NetworkImage(
                          //   'https://i.guim.co.uk/img/media/1059b0efc3c2dd88ff36f911575f89c250d48afc/226_456_1394_836/master/1394.jpg?width=620&quality=45&dpr=2&s=none'
                          // ),
                          radius: 200,
                        )),
                    const SizedBox(
                      height: 45,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                          onPressed: decrementPlayerNo,
                          child: const Icon(Icons.arrow_back_sharp),
                        ),
                        const SizedBox(width: 40),
                        Column(
                          children: [
                            Text(
                              '$player_no',
                              style: const TextStyle(
                                  fontSize: 25, color: Colors.white),
                            ),
                            Text(
                              (Players.players.isNotEmpty)
                                  ? Players.players[player_no - 1].playerName
                                  : 'Starting Now',
                              style: TextStyle(fontSize: 35, color: darkYellow),
                            ),
                          ],
                        ),
                        const SizedBox(width: 40),
                        ElevatedButton(
                          onPressed: incrementPlayerNo,
                          child: const Icon(Icons.arrow_forward_sharp),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Base Price',
                          style: TextStyle(fontSize: 35, color: darkYellow),
                        ),
                        Text(
                          (Players.players.isNotEmpty)
                              ? '${Players.players[player_no - 1].basePrice.toString()} lac'
                              : '400 lac',
                          style: const TextStyle(
                              fontSize: 30, color: Colors.white),
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Column(
                          children: [
                            ElevatedButton(
                              onPressed: incrementCurrentBid,
                              child: const Icon(Icons.add),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Text(
                              'Current Bid',
                              style: TextStyle(fontSize: 35, color: darkYellow),
                            ),
                            Text(
                              '${current_bid.toString()} lac',
                              style: const TextStyle(
                                  fontSize: 30, color: Colors.white),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            ElevatedButton(
                              onPressed: decrementCurrentBid,
                              child: const Icon(Icons.remove),
                            ),
                          ],
                        ),
                      ],
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        Column(
                          children: [
                            Text(
                              'Rating',
                              style: TextStyle(fontSize: 35, color: darkYellow),
                            ),
                            Text(
                              (Players.players.isNotEmpty)
                                  ? '${Players.players[player_no - 1].rating.toString()} pts'
                                  : '97 pts',
                              style: const TextStyle(
                                  fontSize: 30, color: Colors.white),
                            ),
                          ],
                        ),
                        Column(
                          children: [
                            Text(
                              'Role',
                              style: TextStyle(fontSize: 35, color: darkYellow),
                            ),
                            Text(
                              (Players.players.isNotEmpty)
                                  ? Players.players[player_no - 1].playerRole
                                      .toString()
                                  : 'Wicketkeeper',
                              style: const TextStyle(
                                  fontSize: 30, color: Colors.white),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ),
        ));
  }
}
