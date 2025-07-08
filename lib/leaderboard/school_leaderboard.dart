import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:lifelab_pages/leaderboard/teacher_leaderboard.dart';

class SchoolLeaderboardScreen extends StatefulWidget {
  const SchoolLeaderboardScreen({super.key});

  @override
  State<SchoolLeaderboardScreen> createState() =>
      _SchoolLeaderboardScreenState();
}

class _SchoolLeaderboardScreenState extends State<SchoolLeaderboardScreen> {
  int? _selectedIndex;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: const DecorationImage(
            image: AssetImage('assets/backround.png'),
            fit: BoxFit.cover,
            colorFilter: ColorFilter.mode(
              Color.fromRGBO(
                255,
                255,
                255,
                0.50,
              ), // slightly less overlay for more brightness
              BlendMode.modulate,
            ),
          ),
        ),
        child: Column(
          children: [
            AppBar(
              backgroundColor: Colors.transparent,
              elevation: 0,
              leading: IconButton(
                icon: const Icon(Icons.arrow_back, color: Colors.black),
                onPressed: () => Navigator.of(context).pop(),
              ),
              title: const Text(
                'Leaderboard',
                style: TextStyle(
                  color: Color(0xFF8A8A86),
                  fontWeight: FontWeight.bold,
                  fontSize: 19,
                ),
              ),
              actions: [
                InkWell(
                  onTap: () {},
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 12.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        SvgPicture.asset('assets/filter.svg', height: 27),
                        const SizedBox(height: 2),
                        const Text(
                          'Filter',
                          style: TextStyle(
                            fontSize: 13,
                            color: Color(0xFF8A8A86),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),

            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 20.0,
                vertical: 10.0,
              ),
              child: Row(
                children: [
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder:
                                (context) => const TeacherLeaderboardScreen(),
                          ),
                        );
                      },
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.white,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      child: const Text(
                        'Teachers',
                        style: TextStyle(
                          color: Color.fromRGBO(101, 116, 249, 1),
                        ),
                      ),
                    ),
                  ),
                  const SizedBox(width: 10),
                  Expanded(
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color.fromRGBO(101, 116, 249, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(6),
                        ),
                      ),
                      child: const Text(
                        'Schools',
                        style: TextStyle(color: Colors.white),
                      ),
                    ),
                  ),
                ],
              ),
            ),

            const SizedBox(height: 10),

            Padding(
              padding: const EdgeInsets.only(
                bottom: 18.0,
              ), // Increased bottom padding for more gap
              child: SizedBox(
                height: 170,
                child: Stack(
                  clipBehavior: Clip.none,
                  alignment: Alignment.topCenter,
                  children: [
                    // 2nd place (left)
                    Positioned(
                      top: 60,
                      left: 20,
                      child: LeaderboardTopThree(
                        rank: '2',
                        badgeAsset: 'assets/2.png',
                        schoolName: 'Abc School',
                        score: '1000',
                        isSecond: true,
                      ),
                    ),
                    // 1st place (center)
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: LeaderboardTopThree(
                        rank: '1',
                        badgeAsset: 'assets/1.png',
                        schoolName: 'Abc School',
                        score: '2000',
                      ),
                    ),
                    // 3rd place (right)
                    Positioned(
                      top: 60,
                      right: 20,
                      child: LeaderboardTopThree(
                        rank: '3',
                        badgeAsset: 'assets/3.png',
                        schoolName: 'Abc School',
                        score: '500',
                        isThird: true,
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(height: 16),
            const SizedBox(height: 8),

            Expanded(
              child: NotificationListener<ScrollNotification>(
                onNotification: (_) => false,
                child: ListView.builder(
                  padding: EdgeInsets.zero,
                  itemCount: 4,
                  itemBuilder: (context, index) {
                    return GestureDetector(
                      onTap: () {
                        setState(() {
                          _selectedIndex = index;
                        });
                      },
                      child: LeaderboardListItem(
                        rank: (index + 4).toString(),
                        schoolName: 'Abc School',
                        score: '2000',
                        isSelected: _selectedIndex == index,
                      ),
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class LeaderboardTopThree extends StatelessWidget {
  final String rank;
  final String badgeAsset;
  final String schoolName;
  final String score;
  final String iconAsset;
  final bool isSecond;
  final bool isThird;

  const LeaderboardTopThree({
    super.key,
    required this.rank,
    required this.badgeAsset,
    required this.schoolName,
    required this.score,
    this.iconAsset = 'assets/school.png',
    this.isSecond = false,
    this.isThird = false,
  });

  @override
  Widget build(BuildContext context) {
    final double size = isSecond || isThird ? 70 : 90;
    final double fontSize = isSecond || isThird ? 16 : 18;
    final double badgeSize = isSecond || isThird ? 40 : 50;
    final double badgeTop = isSecond || isThird ? -12 : -15;
    final double badgeLeft = isSecond || isThird ? -6 : -7;

    return Column(
      children: [
        Stack(
          clipBehavior: Clip.none,
          alignment: Alignment.center,
          children: [
            SizedBox(
              width: size,
              height: size,
              child: ClipOval(
                child: Container(
                  color: Colors.blue.shade100,
                  child: SizedBox(
                    width: size / 2,
                    height: size / 2,
                    child: Image.asset(iconAsset, fit: BoxFit.contain),
                  ),
                ),
              ),
            ),
            Positioned(
              top: badgeTop,
              left: badgeLeft,
              child: Image.asset(badgeAsset, height: badgeSize),
            ),
          ],
        ),
        const SizedBox(height: 8),
        Text(
          schoolName,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: fontSize,
            color: const Color.fromRGBO(101, 116, 249, 1),
          ),
        ),
        const SizedBox(height: 4),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text(
              score,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 15,
                color: Colors.black,
              ),
            ),
            const SizedBox(width: 4),
            Align(
              alignment: Alignment.center,
              child: SvgPicture.asset('assets/coin.svg', height: 18),
            ),
          ],
        ),
      ],
    );
  }
}

class LeaderboardListItem extends StatelessWidget {
  final String rank;
  final String schoolName;
  final String score;
  final String iconAsset;
  final bool isSelected;

  const LeaderboardListItem({
    super.key,
    required this.rank,
    required this.schoolName,
    required this.score,
    this.iconAsset = 'assets/school.png',
    this.isSelected = false,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 5),
      padding: const EdgeInsets.all(10),
      decoration: BoxDecoration(
        color:
            isSelected
                ? const Color.fromRGBO(120, 182, 218, 0.18)
                : Colors.white,
        borderRadius: BorderRadius.circular(15),
        border:
            isSelected
                ? Border.all(color: Colors.blue.shade800, width: 2)
                : null,
        boxShadow: [
          BoxShadow(
            color: Colors.grey.withOpacity(0.08),
            blurRadius: 6,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Row(
        children: [
          SizedBox(
            width: 40,
            height: 40,
            child: ClipOval(
              child: Container(
                color: Colors.blue.shade100,
                child: SizedBox(
                  width: 20,
                  height: 20,
                  child: Image.asset(iconAsset, fit: BoxFit.contain),
                ),
              ),
            ),
          ),
          Container(
            margin: const EdgeInsets.symmetric(horizontal: 10),
            width: 1,
            height: 30,
            color: const Color.fromARGB(255, 117, 109, 109),
          ),
          Text(
            '${rank}th',
            style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Color.fromRGBO(101, 116, 249, 1),
            ),
          ),
          const SizedBox(width: 15),
          Expanded(
            child: Text(
              schoolName,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 13,
                color: Color.fromRGBO(101, 116, 249, 1),
              ),
              overflow: TextOverflow.ellipsis,
            ),
          ),
          const SizedBox(width: 10),
          Text(score, style: const TextStyle(fontWeight: FontWeight.bold)),
          const SizedBox(width: 4),
          SvgPicture.asset('assets/coin.svg', height: 18),
        ],
      ),
    );
  }
}
