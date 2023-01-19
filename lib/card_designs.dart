import 'package:flutter/material.dart';
import 'constants.dart';

class ItemCard extends StatelessWidget {
  ItemCard({@required this.cl, this.card, this.onPress});
  final Color cl;
  final Widget card;
  final Function onPress;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPress,
      child: Container(
        child: card,
        margin: EdgeInsets.all(15),
        decoration: BoxDecoration(
          color: cl,
          borderRadius: BorderRadius.circular(15.0),
        ),
      ),
    );
  }
}
