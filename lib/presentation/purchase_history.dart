import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PurchaseHistory extends StatelessWidget {
  const PurchaseHistory({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          "HOME",
          style: TextStyle(
            color: const Color.fromARGB(255, 71, 70, 70),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back, color: Colors.black, size: 30),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Container(
          decoration: BoxDecoration(
            color: const Color(
              0xFFF7F8FA,
            ), // Soft off-white background for the whole screen
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 70,
                      padding: const EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(7),
                        boxShadow: [
                          BoxShadow(
                            color: const Color.fromARGB(51, 109, 107, 107),
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Total coins Earned',
                            style: TextStyle(
                              fontSize: 14,
                              color: Color.fromRGBO(101, 116, 249, 1),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset('assets/coin.svg', height: 15),
                                const SizedBox(width: 4),
                                const Text(
                                  '700', // Placeholder amount
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      height: 70,
                      padding: const EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(7),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withValues(alpha: 0.2),
                            blurRadius: 6,
                            offset: const Offset(0, 3),
                          ),
                        ],
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            'Life App Coin Balance', // Changed to spent for the second box
                            style: TextStyle(
                              fontSize: 13,
                              color: Color.fromRGBO(101, 116, 249, 1),
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(height: 8),
                          Padding(
                            padding: const EdgeInsets.only(left: 12.0),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                SvgPicture.asset('assets/coin.svg', height: 15),
                                const SizedBox(width: 4),
                                const Text(
                                  '500', // Placeholder amount
                                  style: TextStyle(
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.amber,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              //blue container with text
              Container(
                height: 45,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Color.fromRGBO(73, 131, 238, 1),
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Center(
                  child: Text(
                    'Puchase History',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10),
              //LIst of purchased items
              Expanded(
                child: ListView.builder(
                  itemCount: 4,
                  itemBuilder:
                      (context, index) => PurchaseHistoryItem(
                        imagePath: 'assets/balloon.png',
                        productName: 'Product Name',
                        coinsSpent: 200,
                      ),
                ),
              ),
              SizedBox(height: 8),
              Text(
                "Make magic moments with these products",
                style: TextStyle(
                  color: Color.fromRGBO(73, 131, 238, 1),
                  fontSize: 16,
                  fontWeight: FontWeight.w600,
                ),
                textAlign: TextAlign.left,
              ),
              SizedBox(height: 10),
              // LowBalance Item (formerly MagicProductItem)
              LowBalance(
                imagePath: 'assets/balloon.png',
                productName: 'Product Name',
                coinsSpent: 150,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class PurchaseHistoryItem extends StatelessWidget {
  final String imagePath;
  final String productName;
  final int coinsSpent;
  final String coinLabel;

  const PurchaseHistoryItem({
    super.key,
    required this.imagePath,
    required this.productName,
    required this.coinsSpent,
    this.coinLabel = 'Coin spent for product',
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
                // Product name
                Text(
                  productName,
                  style: TextStyle(
                    color: Color.fromRGBO(101, 116, 249, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),

                // Coin info box
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromRGBO(101, 116, 249, 1),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),
                  child: Column(
                    crossAxisAlignment:
                        CrossAxisAlignment.center, // Center horizontally
                    children: [
                      Text(
                        coinLabel,
                        style: TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(101, 116, 249, 1),
                        ),
                        textAlign: TextAlign.center,
                      ),
                      SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          SvgPicture.asset('assets/coin.svg', height: 16),
                          SizedBox(width: 4),
                          Text(
                            coinsSpent.toString(),
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class LowBalance extends StatelessWidget {
  final String imagePath;
  final String productName;
  final int coinsSpent;
  final String coinLabel;

  const LowBalance({
    super.key,
    required this.imagePath,
    required this.productName,
    required this.coinsSpent,
    this.coinLabel = 'You need ',
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(vertical: 6),
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
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: Image.asset(
              imagePath,
              width: 140,
              height:
                  100, // Use a fixed height for the image to match the card and avoid layout issues
              fit: BoxFit.cover,
            ),
          ),
          SizedBox(width: 10),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  productName,
                  style: TextStyle(
                    color: Color.fromRGBO(101, 116, 249, 1),
                    fontWeight: FontWeight.bold,
                    fontSize: 15,
                  ),
                ),
                SizedBox(height: 6),
                Container(
                  width: double.infinity,
                  padding: EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                  decoration: BoxDecoration(
                    border: Border.all(
                      color: Color.fromRGBO(101, 116, 249, 1),
                      width: 1,
                    ),
                    borderRadius: BorderRadius.circular(8),
                    color: Colors.white,
                  ),

                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RichText(
                        textAlign: TextAlign.center,
                        text: TextSpan(
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: FontWeight.w600,
                            color:
                                Colors.grey, // Set all text to grey by default
                          ),
                          children: [
                            TextSpan(text: 'You need '),
                            WidgetSpan(
                              alignment: PlaceholderAlignment.middle,
                              child: Row(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  Text(
                                    '$coinsSpent',
                                    style: TextStyle(
                                      color:
                                          Colors
                                              .amber, // Amber color for coin spent
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13,
                                    ),
                                  ),
                                  SizedBox(width: 2),
                                  SvgPicture.asset(
                                    'assets/coin.svg',
                                    height: 14,
                                  ),
                                ],
                              ),
                            ),
                            TextSpan(text: '\nmore coins'),
                          ],
                        ),
                      ),
                      SizedBox(height: 4),
                    ],
                  ),
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: () {},
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Color.fromRGBO(73, 131, 238, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(8),
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 6,
                      ), // Decreased vertical padding
                      minimumSize: Size(
                        0,
                        32,
                      ), // Minimum height for a more compact button
                      elevation: 0,
                    ),
                    child: Text(
                      'assign Challange',
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 14, // Slightly smaller font
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
