import 'package:flutter/material.dart';
import 'package:frontend/views/community_center_view.dart';
import 'package:frontend/views/dashboard.dart';
import 'package:frontend/views/house_view.dart';
import 'package:frontend/views/manager_view.dart';
import 'package:frontend/views/park_view.dart';
import 'package:frontend/views/security_view.dart';
import 'package:frontend/views/shopping_center_view.dart';
import 'package:frontend/views/street_view.dart';
import 'package:frontend/views/zone_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/dashboard',
              routes: {
                '/dashboard': (context) => const  MyDashboard(), //in lib>authentication>services
                '/houseView': (context) => const HouseView(),
                '/securityView': (context) => const SecurityView(),
                '/communityCenterView': (context) => const CommunityCenterView(),
                '/shoppingCenterView': (context) => const ShoppingCenterView(),
                '/parkView': (context) => const ParkView(),
                '/zoneView': (context) => const ZoneView(),
                '/managerView': (context) => const ManagerView(),
                '/streetView': (context) => const StreetView(),
              },
    );
  }
}
