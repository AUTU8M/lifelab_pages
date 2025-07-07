import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class PereiiiiDll extends StatelessWidget {
  final String balloonAssetPath;
  final String coinAssetPath;
  final String productName;
  final int redeemPoints;
  final VoidCallback? onTap;

  const PereiiiiDll({
    super.key,
    this.balloonAssetPath = 'assets/balloon.png',
    this.coinAssetPath = "assets/coin.svg",
    required this.productName,
    required this.redeemPoints,
    this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Container(
          width: double.infinity,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            border: Border.all(
              color: const Color.fromRGBO(128, 145, 143, 0.2),
              width: 1,
            ),
            boxShadow: [
              BoxShadow(
                color: const Color.fromARGB(51, 109, 107, 107),
                blurRadius: 6,
                offset: const Offset(0, 3),
              ),
            ],
          ),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              // Main Product Container
              Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(14),
                  color: Colors.white,
                ),
                child: Column(
                  children: [
                    // Image Container with pink background
                    Container(
                      width: double.infinity,
                      height: 170,
                      decoration: const BoxDecoration(
                        color: Color(0xFFFFB6C1), // Light pink color
                        borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(14),
                          topRight: Radius.circular(14),
                        ),
                      ),
                      child: ClipRRect(
                        borderRadius: const BorderRadius.only(
                          topLeft: Radius.circular(14),
                          topRight: Radius.circular(14),
                        ),
                        child: Image.asset(
                          balloonAssetPath,
                          fit: BoxFit.cover,
                          width: double.infinity,
                          height: double.infinity,
                        ),
                      ),
                    ),

                    // Product Name Section with blue background
                    Container(
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(
                        vertical: 12,
                        horizontal: 16,
                      ),
                      decoration: const BoxDecoration(
                        color: Color(0xFF6B73FF), // Blue color
                      ),
                      child: Text(
                        productName,
                        style: const TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ],
                ),
              ),

              // Redeem Container (Outside the product container)
              Container(
                width: double.infinity,
                padding: const EdgeInsets.symmetric(
                  vertical: 12,
                  horizontal: 16,
                ),
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(14),
                    bottomRight: Radius.circular(14),
                  ),
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      'Redeem With ',
                      style: TextStyle(
                        color: Color(0xFF6B73FF),
                        fontSize: 14,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                    Text(
                      '$redeemPoints ',
                      style: const TextStyle(
                        color: Color(0xFF6B73FF),
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    SvgPicture.asset(
                      coinAssetPath,
                      width: 20,
                      height: 20,
                      fit: BoxFit.contain,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
