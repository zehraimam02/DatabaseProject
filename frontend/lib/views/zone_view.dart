import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:frontend/widgets/button.dart';
import 'package:frontend/widgets/input_field.dart';
import 'package:frontend/widgets/my_table.dart';

class ZoneView extends StatelessWidget {
  const ZoneView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController zoneID = TextEditingController();

    final shCenter = [
      'Shopping Center',
    ];
    final ccCenter = [
      'Community Center',
    ];
    final park = [
      'Park',
    ];
    final rows = List.generate(
      8,
      (index) => [
        '$index',
      ],
    );

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Padding(
          padding: EdgeInsets.symmetric(
            vertical: 20,
          ),
          child: Padding(
            padding: EdgeInsets.only(top: 20.0),
            child: Text(
              'Zone Management',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
        ),
      ),
      body: Padding(
            padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 400,child: MyInputField(hintText: 'Enter Zone ID', obscureText: false, controller: zoneID)),
                    const SizedBox(width: 40,),
                    MyButton(text: 'Ok', onPressed: (){}, width: 100, height: 40),

                  ],
                ),
                const SizedBox(height: 40,),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  
                  children: [
                    Expanded(
                      child: 
                        MyTable(headers: shCenter, rows: rows),
                      
                    ),
                    const SizedBox(width: 20,),
                    Expanded(
                      child: 
                        MyTable(headers: ccCenter, rows: rows),
                      
                    ),
                    const SizedBox(width: 20,),
                    Expanded(
                      child: 
                        MyTable(headers: park, rows: rows),
                      
                    ),
                  ],
                )
              ],
            ), 
            
          ),
      bottomSheet: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: MyButton(
              text: 'Add Shopping Center',
              onPressed: ()=>addShoppingCenter(context),
              color: Colors.green[400]!,
              width: 200,
              height: 50,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: MyButton(
              text: 'Add Community Center',
              onPressed: ()=> addComCenter(context),
              color: Colors.green[400]!,
              width: 200,
              height: 50,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: MyButton(
              text: 'Add Park',
              onPressed: ()=> addPark(context),
              color: Colors.green[400]!,
              width: 200,
              height: 50,
            ),
          ),
        ],
      ),
    );
  }

  void addComCenter(BuildContext context) {
    TextEditingController name = TextEditingController();
    TextEditingController streetID = TextEditingController();
    TextEditingController managerID = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: const Text('Add Community Center'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                MyInputField(
                    hintText: 'Name',
                    obscureText: false,
                    controller: name),
                const SizedBox(height: 20,),
                MyInputField(
                    hintText: 'Street Number',
                    obscureText: false,
                    controller: streetID),
                const SizedBox(height: 20,),
                MyInputField(
                    hintText: 'Manager ID',
                    obscureText: false,
                    controller: managerID),
                const SizedBox(height: 20,),
              ],
            ),
            actions: [
              MyButton(text: 'Cancel', onPressed: (){ Navigator.pop(context);}, width: 100, height: 40, color: Colors.red[300]!,),
              const SizedBox(width: 20,),
              MyButton(text: 'OK', onPressed: (){Navigator.pop(context);}, width: 100, height: 40, color: Colors.green[400]!,),
            ],
          );
      },
    );
  }

  void addShoppingCenter(BuildContext context) {
    TextEditingController managerID = TextEditingController();
    TextEditingController shCenterName = TextEditingController();
    TextEditingController numberOfshops = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: const Text('Add Shopping Center'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                MyInputField(
                    hintText: 'Manager ID',
                    obscureText: false,
                    controller: managerID),
                const SizedBox(height: 20,),
                MyInputField(
                    hintText: 'Shopping Center Name',
                    obscureText: false,
                    controller: shCenterName),
                const SizedBox(height: 20,),
                MyInputField(
                    hintText: 'Number Of Shops',
                    obscureText: false,
                    controller: numberOfshops),
                const SizedBox(height: 20,),
              ],
            ),
            actions: [
              MyButton(text: 'Cancel', onPressed: (){ Navigator.pop(context);}, width: 100, height: 40, color: Colors.red[300]!,),
              const SizedBox(width: 20,),
              MyButton(text: 'OK', onPressed: (){Navigator.pop(context);}, width: 100, height: 40, color: Colors.green[400]!,),
            ],
          );
      },
    );
  }

  void addPark(BuildContext context) {
    TextEditingController managerID = TextEditingController();
    TextEditingController name = TextEditingController();
    TextEditingController size = TextEditingController();
    TextEditingController numOfBenches = TextEditingController();
    TextEditingController hasWalkingTrack = TextEditingController();
    TextEditingController numOfStreetLights = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: const Text('Add Park'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                MyInputField(
                    hintText: 'Manager ID',
                    obscureText: false,
                    controller: managerID),
                const SizedBox(height: 20,),
                MyInputField(
                    hintText: 'Park Name',
                    obscureText: false,
                    controller: name),
                const SizedBox(height: 20,),
                MyInputField(
                    hintText: 'Size',
                    obscureText: false,
                    controller: size),
                const SizedBox(height: 20,),
                MyInputField(
                    hintText: 'Number of Benches',
                    obscureText: false,
                    controller: numOfBenches),
                const SizedBox(height: 20,),
                MyInputField(
                    hintText: 'Has walking track? (True/False)',
                    obscureText: false,
                    controller: hasWalkingTrack),
                const SizedBox(height: 20,),
                MyInputField(
                    hintText: 'Number of Street Lights',
                    obscureText: false,
                    controller: numOfStreetLights),
                const SizedBox(height: 20,),
              ],
            ),
            actions: [
              MyButton(text: 'Cancel', onPressed: (){ Navigator.pop(context);}, width: 100, height: 40, color: Colors.red[300]!,),
              const SizedBox(width: 20,),
              MyButton(text: 'OK', onPressed: (){Navigator.pop(context);}, width: 100, height: 40, color: Colors.green[400]!,),
            ],
          );
      },
    );
  }
}