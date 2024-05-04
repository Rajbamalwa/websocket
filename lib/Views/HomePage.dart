import 'package:flutter/material.dart';

import '../Data/FetchingData/CoinbaseProvider.dart';
import '../Widgets/CoinButton/CoinButton.dart';
import '../Widgets/CoinValue/CoinValue.dart';

class HomePage extends StatefulWidget {
  final CoinbaseProvider provider;
  const HomePage({Key? key, required this.provider}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Expanded(
            child: CoinValue(
              provider: widget.provider,
            ),
          ),
          CoinButtons(
            provider: widget.provider,
          ),
        ],
      ),
    );
  }
}
