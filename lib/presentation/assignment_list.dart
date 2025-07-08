import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class AssignmentList extends StatelessWidget {
  final String imagePath;
  final String assignmentName;
  final int coinsEarned;
  final String coinLabel;

  const AssignmentList({
    super.key,
    this.imagePath = 'assets/balloon.png',
    this.assignmentName = 'Product Name',
    this.coinsEarned = 0,
    this.coinLabel = 'Coins earned for assignment',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6),
      height: 100, // Fixed height
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: Colors.white,
        boxShadow: [
          BoxShadow(
            color: Color.fromRGBO(101, 116, 249, 0.08),
            blurRadius: 8,
            offset: Offset(0, 4),
          ),
        ],
      ),
      child: Row(
        children: [
          // Left image
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imagePath,
              width: 140, // Increased width
              height: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 10),

          // Right content
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Product name (top)
                Text(
                  assignmentName,
                  style: TextStyle(
                    color: Color.fromRGBO(101, 116, 249, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                // Coin info (bottom)
                Row(
                  children: [
                    Text(
                      '+${coinsEarned.toString()}',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Colors.green,
                      ),
                    ),
                    SizedBox(width: 4),
                    SvgPicture.asset('assets/coin.svg', height: 16),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
