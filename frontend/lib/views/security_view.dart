import 'package:flutter/material.dart';
import 'package:frontend/widgets/button.dart';
import 'package:frontend/widgets/input_field.dart';
import 'package:frontend/widgets/my_table.dart';

class SecurityView extends StatelessWidget {
  const SecurityView({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController gateNumber = TextEditingController();
    final headers = [
      'Guard ID',
      'Guard Name',
      'Gate Number',
      'Guard CNIC',
      'Shift'
    ];

    final rows = List.generate(
      8,
      (index) => [
        'ID $index',
        'Name $index',
        'Gate Num $index',
        'CNIC 23343434${index + 2}',
        index.isEven ? 'Morning' : 'Evening',
      ],
    );

    final headersLog = [
      'Visitor Name',
      'Visitor Phone Number',
      'Arrival Time',
      'Departure Time',
      'Date',
    ];
    final rowsLog = List.generate(
      8,
      (index) => [
        'Name $index',
        'PhnNum $index',
        '12:0$index',
        '15:0${index + 2}',
        '1$index/3/2024'
      ],
    );

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: const Padding(
            padding: EdgeInsets.symmetric(
              vertical: 20,
            ),
            child: Padding(
              padding: EdgeInsets.only(top: 20.0),
              child: Text(
                'Security Management',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
          ),
          bottom: const TabBar(
            tabs: [
              Tab(
                text: 'Guards',
                icon: Icon(Icons.security),
              ),
              Tab(
                text: 'Gate Log Entries',
                icon: Icon(Icons.report),
              ),
            ],
          ),
        ),
        body: TabBarView(children: [
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
            child: MyTable(headers: headers, rows: rows)
          ),
          Padding(
            padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    SizedBox(width: 400,child: MyInputField(hintText: 'Enter Gate number', obscureText: false, controller: gateNumber)),
                    const SizedBox(width: 40,),
                    MyButton(text: 'Ok', onPressed: (){}, width: 100, height: 40),

                  ],
                ),
                const SizedBox(height: 40,),
                MyTable(headers: headersLog, rows: rowsLog)
              ],
            ), 
            
          ),
        ]),
        bottomSheet: Builder(
          builder: (context) {
            // Obtain the TabController from the DefaultTabController
            final tabController = DefaultTabController.of(context);

            return ValueListenableBuilder<double>(
              valueListenable:
                  tabController.animation!, // Listen to tab index changes
              builder: (context, animationValue, child) {
                final currentIndex =
                    animationValue.round(); // Determine the current tab index
                final buttonTextAdd =
                    currentIndex == 0 ? 'Add Guard' : 'Add Entry';
                final buttonActionAdd = currentIndex == 0 ? () => addGuard(context) : () => addEntry(context);

                final buttonTextEdit =
                    currentIndex == 0 ? 'Edit Guard' : 'Edit Entry';
                final buttonActionEdit =
                    currentIndex == 0 ? () => {} : () => {};

                final double width = currentIndex == 0 ? 200: 300;

                return Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: MyButton(
                        text: buttonTextAdd,
                        onPressed: buttonActionAdd,
                        color: Colors.green[400]!,
                        width: width,
                        height: 50,
                      ),
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: MyButton(
                        text: buttonTextEdit,
                        onPressed: buttonActionEdit,
                        color: Colors.orange[200]!,
                        width: width,
                        height: 50,
                      ),
                    ),
                    if (currentIndex == 0)
                    const SizedBox(
                      width: 20,
                    ),
                    if (currentIndex == 0)
                    Padding(
                      padding: const EdgeInsets.only(bottom: 30),
                      child: MyButton(
                        text: 'Delete Guard',
                        onPressed: ()=>deleteGuard(context),
                        color: Colors.red[300]!,
                        width: width,
                        height: 50,
                      ),
                    ),
                  ],
                );
              },
            );
          },
        ),
      ),
    );
  }

  void addGuard(BuildContext context) {
    TextEditingController fName = TextEditingController();
    TextEditingController lName = TextEditingController();
    TextEditingController gateNumber = TextEditingController();
    TextEditingController guardCNIC = TextEditingController();
    TextEditingController shift = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: const Text('Add Guard'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                MyInputField(
                    hintText: 'First Name',
                    obscureText: false,
                    controller: fName),
                const SizedBox(height: 20,),
                MyInputField(
                    hintText: 'Last Name',
                    obscureText: false,
                    controller: lName),
                const SizedBox(height: 20,),
                MyInputField(
                    hintText: 'Gate Number',
                    obscureText: false,
                    controller: gateNumber),
                const SizedBox(height: 20,),
                MyInputField(
                    hintText: 'Guard CNIC',
                    obscureText: false,
                    controller: guardCNIC),
                const SizedBox(height: 20,),
                MyInputField(
                    hintText: 'Shift (Morning/Evening)',
                    obscureText: false,
                    controller: shift),
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

  void deleteGuard(BuildContext context){
     TextEditingController houseOwnerID = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: const Text('Delete Guard'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                MyInputField(
                    hintText: 'Guard ID',
                    obscureText: false,
                    controller: houseOwnerID),
                const SizedBox(height: 20,),
              ],
            ),
            actions: [
              MyButton(text: 'Cancel', onPressed: (){ Navigator.pop(context);}, width: 100, height: 40, color: Colors.red[300]!,),
              const SizedBox(width: 20,),
              MyButton(text: 'OK', onPressed: (){Navigator.pop(context);deleteConfirmation(context);}, width: 100, height: 40, color: Colors.green[400]!,),
            ],
          );
      },
    );
  }

  void deleteConfirmation(BuildContext context){

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            content: const Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20, vertical: 30),
                  child: Text('Are you sure you want to delete?', style: TextStyle(fontSize: 20),),
                ),
                SizedBox(height: 20,),
              ],
            ),
            actions: [
              
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const SizedBox(width: 20,),
                  MyButton(text: 'Cancel', onPressed: (){ Navigator.pop(context);}, width: 100, height: 40, color: Colors.red[300]!,),
                  MyButton(text: 'OK', onPressed: (){Navigator.pop(context);}, width: 100, height: 40, color: Colors.green[400]!,),
                  const SizedBox(width: 20,),
                ],
              )
            ],
          );
      },
    );
  }

  void addEntry(BuildContext context) {
    TextEditingController fName = TextEditingController();
    TextEditingController lName = TextEditingController();
    TextEditingController phnNum = TextEditingController();
    TextEditingController arrivalTime = TextEditingController();
    TextEditingController deptTime = TextEditingController();
    TextEditingController date = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: const Text('Add Entry'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                MyInputField(
                    hintText: 'First Name',
                    obscureText: false,
                    controller: fName),
                const SizedBox(height: 20,),
                MyInputField(
                    hintText: 'Last Name',
                    obscureText: false,
                    controller: lName),
                const SizedBox(height: 20,),
                MyInputField(
                    hintText: 'Phone Number',
                    obscureText: false,
                    controller: phnNum),
                const SizedBox(height: 20,),
                MyInputField(
                    hintText: 'Arrival Time',
                    obscureText: false,
                    controller: arrivalTime),
                const SizedBox(height: 20,),
                MyInputField(
                    hintText: 'Departure Time',
                    obscureText: false,
                    controller: deptTime),
                const SizedBox(height: 20,),
                MyInputField(
                    hintText: 'Date (DD/MM/YY)',
                    obscureText: false,
                    controller: date),
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
