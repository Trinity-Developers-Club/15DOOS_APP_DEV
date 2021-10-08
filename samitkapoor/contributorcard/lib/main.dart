import 'package:flutter/material.dart';

import '/screens/card_screen.dart';

void main() {
  runApp(const ContributorCard());
}

class ContributorCard extends StatelessWidget {
  const ContributorCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      debugShowCheckedModeBanner: false,
      home: CardScreen(),
    );
  }
}
