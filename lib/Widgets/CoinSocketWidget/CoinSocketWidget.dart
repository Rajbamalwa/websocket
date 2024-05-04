import 'package:flutter/material.dart';

import '../../Data/FetchingData/CoinbaseProvider.dart';

class CloseSocketsWidget extends StatelessWidget {
  const CloseSocketsWidget({
    Key? key,
    required this.provider,
  }) : super(key: key);

  final CoinbaseProvider provider;

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      color: Colors.red,
      child: const Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Icon(
            Icons.warning,
            color: Colors.white,
          ),
          SizedBox(
            width: 12.0,
          ),
          Text(
            "CLOSE SOCKETS",
            style: TextStyle(
              color: Colors.white,
            ),
          )
        ],
      ),
      onPressed: () {
        provider.closeBitcoin();
        // provider.closeEthereum();
      },
    );
  }
}
