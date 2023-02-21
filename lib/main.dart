// ignore_for_file: non_constant_identifier_names

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:ipl_auction/data.dart';

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
        primarySwatch: Colors.teal,
      ),
      home: const MyHomePage(title: 'IPL Auction Portal Goonj'),
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
  num current_bid = 0;

  setStartingBid() {
    setState(() {
      current_bid = (Players.players != null && Players.players.isNotEmpty)
          ? Players.players[player_no - 1].basePrice
          : 0;
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
      current_bid = current_bid + 10;
    });
  }

  decrementCurrentBid() {
    setState(() {
        current_bid = current_bid - 10;
    });
  }

  @override
  void initState() {
    super.initState();
    loadData();
  }

  loadData() async {
    await Future.delayed(Duration(seconds: 2));
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
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
        ),
        body: Row(
          // mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Expanded(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircleAvatar(
                      radius: 210,
                      backgroundColor: Colors.teal,
                      child: CircleAvatar(
                        backgroundImage: AssetImage((Players.players != null &&
                                Players.players.isNotEmpty)
                            ? Players.players[player_no - 1].imageAddress
                            : 'assets/2.jpg'),
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
                            (Players.players != null &&
                                    Players.players.isNotEmpty)
                                ? Players.players[player_no - 1].name
                                : 'Starting Now',
                            style: TextStyle(fontSize: 35, color: Colors.green),
                          ),
                          Text(
                            'Player No. $player_no',
                            style: const TextStyle(fontSize: 25),
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
                        style: TextStyle(fontSize: 35, color: Colors.green),
                      ),
                      Text(
                        (Players.players != null && Players.players.isNotEmpty)
                            ? '${Players.players[player_no - 1].basePrice.toString()} lac'
                            : 'Starting Now',
                        style: TextStyle(fontSize: 30),
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
                          const Text(
                            'Current Bid',
                            style: TextStyle(fontSize: 35, color: Colors.green),
                          ),
                          Text(
                            current_bid.toString(),
                            style: TextStyle(fontSize: 30),
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
                ],
              ),
            ),
          ],
        ));
  }
}
