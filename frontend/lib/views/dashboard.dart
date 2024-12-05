import 'package:flutter/material.dart';
import 'package:frontend/widgets/my_tile.dart';

// ignore: must_be_immutable
class MyDashboard extends StatefulWidget {
  const MyDashboard({super.key});

  @override
  State<MyDashboard> createState() => _MyDashboardState();
}

class _MyDashboardState extends State<MyDashboard> {
  List<Color> colorsLight = [
    // const Color.fromARGB(255, 208, 234, 255),
    // const Color.fromARGB(255, 157, 211, 255),
    const Color.fromARGB(255, 203, 231, 255),
    const Color.fromARGB(255, 69, 171, 255),
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: MediaQuery.sizeOf(context).height,
            width: MediaQuery.sizeOf(context).width,
            decoration: const BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/bg_image.jpg'),
                fit: BoxFit.cover,
              ),
            ),
          ),
          Positioned(
              top: MediaQuery.sizeOf(context).height * 0.1,
              left: MediaQuery.sizeOf(context).width * 0.15,
              child: const Text(
                'Weclome to HSMS!',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 50,
                    color: Colors.white),
              )),
          Positioned(
              top: MediaQuery.sizeOf(context).height * 0.3,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width - 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyTile(
                          onTap: () {
                            Navigator.pushNamed(
                                context, '/houseView');
                          },
                          colors: colorsLight,
                          text:
                              'House \nManagement'), // crud operations on houses
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.05,
                      ),
                      MyTile(
                          onTap: () {
                             Navigator.pushNamed(
                                context, '/streetView');
                          },
                          colors: colorsLight,
                          text: 'Streets'),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.05,
                      ),
                      MyTile(
                          onTap: () {
                            Navigator.pushNamed(context, '/zoneView');
                          },
                          colors: colorsLight,
                          text: 'Zone \nManagement'),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.05,
                      ),
                      MyTile(
                          onTap: () {
                            Navigator.pushNamed(
                                context, '/securityView');
                          },
                          colors: colorsLight,
                          text: 'Security \nManagement')
                    ],
                  ),
                ),
              )),
          Positioned(
              top: MediaQuery.sizeOf(context).height * 0.55,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: SizedBox(
                  width: MediaQuery.sizeOf(context).width - 40,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      MyTile(
                          onTap: () {
                            Navigator.pushNamed(
                                context, '/communityCenterView');
                          },
                          colors: colorsLight,
                          text: 'Community Center Management'),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.05,
                      ),
                      MyTile(
                          onTap: () {
                            Navigator.pushNamed(
                                context, '/shoppingCenterView');
                          },
                          colors: colorsLight,
                          text: 'Shopping Center Management'),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.05,
                      ),
                      MyTile(
                          onTap: () {
                             Navigator.pushNamed(
                                context, '/parkView');
                          },
                          colors: colorsLight,
                          text: 'Park \nManagement'),
                      SizedBox(
                        width: MediaQuery.sizeOf(context).width * 0.05,
                      ),
                      MyTile(
                          onTap: () {
                             Navigator.pushNamed(
                                context, '/managerView');
                          },
                          colors: colorsLight,
                          text: 'Managers'),
                    ],
                  ),
                ),
              )),
        ],
      ),
    );
  }
}
