import 'package:flutter/material.dart';

import '../../Data/FetchingData/CoinbaseProvider.dart';

/// Coin Buttons
///
/// Either show a button to open sockets for ETH and BTC
/// or shows a button to close the socket connections
class CoinButtons extends StatefulWidget {
  final CoinbaseProvider provider;

  const CoinButtons({required this.provider, Key? key}) : super(key: key);

  @override
  _CoinButtonsState createState() => _CoinButtonsState();
}

class _CoinButtonsState extends State<CoinButtons> {
  bool _showBitcoin = false;

  @override
  void reassemble() {
    super.reassemble();
    widget.provider.closeBitcoin();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        children: [
          if (!_showBitcoin)
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: CoinButton(
                    isSocketOpen: _showBitcoin,
                    title: "BTC",
                    backgroundColor: Colors.orange,
                    onTap: (isSocketOpen) {
                      if (!isSocketOpen) {
                        widget.provider.openBitcoin();
                        setState(() => _showBitcoin = true);
                      }
                    },
                  ),
                ),
              ],
            ),
          if (_showBitcoin)
            MaterialButton(
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
                widget.provider.closeBitcoin();
                //  widget.provider.closeBitcoin();
              },
            )
        ],
      ),
    );
  }
}

class CoinButton extends StatelessWidget {
  final bool isSocketOpen;
  final String title;
  final Function(bool) onTap;
  final Color backgroundColor;

  const CoinButton({
    required this.isSocketOpen,
    required this.title,
    required this.onTap,
    required this.backgroundColor,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialButton(
      onPressed: () => !isSocketOpen ? onTap(isSocketOpen) : null,
      color: backgroundColor,
      child: Row(
        children: [
          if (!isSocketOpen)
            const Icon(
              Icons.close,
              color: Colors.red,
            ),
          if (isSocketOpen)
            const Icon(
              Icons.check,
              color: Colors.green,
            ),
          Text(title),
        ],
      ),
    );
  }
}
