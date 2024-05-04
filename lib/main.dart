import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:web_socket_channel/web_socket_channel.dart';
import 'package:web_socket_project/Views/HomePage.dart';

import 'Data/FetchingData/CoinbaseProvider.dart';
import 'Services/CoinbaseRequest.dart';

/*
void main(List<String> arguments) async {

  /// Create the WebSocket channel
  final channel = WebSocketChannel.connect(
    Uri.parse('wss://ws-feed.pro.coinbase.com'),
  );

  channel.sink.add(
    jsonEncode(
      {
        "type": "subscribe",
        "channels": [
          {
            "name": "ticker",
            "product_ids": [
              "BTC-EUR",
            ]
          }
        ]
      },
    ),
  );

  /// Listen for all incoming data
  channel.stream.listen(
    (data) {
      print(data);
    },
    onError: (error) => print(error),
  );*/
void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Web Socket',
      home: CoinbaseProApp(),
    );
  }
}

class CoinbaseProApp extends StatelessWidget {
  late final CoinbaseProvider _provider;

  CoinbaseProApp({Key? key})
      : _provider = CoinbaseProvider(),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomePage(provider: _provider),
    );
  }
}
