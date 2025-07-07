import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'bought_product.dart'; // Import the BoughtProduct page

class Products extends StatelessWidget {
  const Products({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Text(
          'Products',
          style: TextStyle(
            color: const Color.fromARGB(255, 71, 70, 70),
            fontSize: 20,
            fontWeight: FontWeight.bold,
          ),
        ),
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.black, size: 30),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      body: Container(
        decoration: BoxDecoration(
          color: const Color(
            0xFFF7F8FA,
          ), // Soft off-white background for the whole screen
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 20.0),
          child: Column(
            children: [
              SizedBox(height: 10),
              Container(
                height: 50,
                width: double.infinity,
                decoration: BoxDecoration(
                  color: Colors.blueAccent,
                  borderRadius: BorderRadius.circular(7),
                ),
                child: Center(
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        'Life App Coin Balance ',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Text(
                        '500',
                        style: TextStyle(
                          color: Colors.amber,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      SizedBox(width: 6),
                      SizedBox(
                        height: 22,
                        width: 22,
                        child: Padding(
                          padding: EdgeInsets.only(bottom: 2),
                          child: SvgPicture.asset(
                            'assets/coin.svg',
                            height: 20,
                            width: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(height: 40),
              Container(
                width: double.infinity,
                height: 270,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20), // Rounded corners
                ),
                clipBehavior: Clip.antiAlias,
                child: Image.asset('assets/balloon.png', fit: BoxFit.cover),
              ),
              SizedBox(height: 30),
              Text(
                'Product Name',
                style: TextStyle(
                  color: Colors.blue,
                  fontSize: 23,
                  fontWeight: FontWeight.bold,
                ),
              ),
              SizedBox(height: 20),
              Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  SizedBox(width: 10),
                  Icon(
                    Icons.arrow_forward_ios_outlined,
                    size: 20,
                    color: Colors.black54,
                  ),
                  Text(
                    'Product Info 1',
                    style: TextStyle(
                      fontSize: 20,
                      color: const Color.fromARGB(221, 0, 0, 0),
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
              ),
              SizedBox(height: 10),
              Text(
                "Lorem ipsum, or lipsum as it is sometimes \nknown, is dummy text used in laying out \nprint, graphic or web designs",
                style: TextStyle(
                  fontSize: 14,
                  color: Colors.black,
                  height: 1.5,
                ),
              ),
              SizedBox(height: 20),
              Material(
                color: Colors.white30,
                borderRadius: BorderRadius.circular(7),
                child: InkWell(
                  borderRadius: BorderRadius.circular(7),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const BoughtProduct(),
                      ),
                    );
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(7),
                      border: Border.all(color: Colors.blue, width: 1),
                    ),
                    child: Center(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            'Redeem with  ',
                            style: TextStyle(
                              color: Colors.blueAccent,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '500',
                            style: TextStyle(
                              color: Colors.amber,
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(width: 6),
                          SizedBox(
                            height: 22,
                            width: 22,
                            child: Padding(
                              padding: EdgeInsets.only(bottom: 2),
                              child: SvgPicture.asset(
                                'assets/coin.svg',
                                height: 20,
                                width: 20,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
