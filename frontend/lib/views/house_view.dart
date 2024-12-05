import 'package:flutter/material.dart';
import 'package:frontend/requests/house_owner_req.dart';
import 'package:frontend/widgets/button.dart';
import 'package:frontend/widgets/input_field.dart';
import 'package:frontend/widgets/my_table.dart';

class HouseView extends StatefulWidget {
  const HouseView({super.key});

  @override
  State<HouseView> createState() => _HouseViewState();
}

class _HouseViewState extends State<HouseView> {
  @override
  Widget build(BuildContext context) {
    final headers = [
      'House Number',
      'Street Number',
      'House Owner ID',
      'Number of Rooms',
      'Household Size',
      'On Rent?',
      'Maintenance Charge ID'
    ];

    final rows = List.generate(
      8,
      (index) => [
        'House $index',
        'Street $index',
        'Owner $index',
        '${index + 2} Rooms',
        '${index + 1} People',
        index.isEven ? 'Yes' : 'No',
        'MTCH ${index + 1}',
      ],
    );

    final headersOwner = [
      'Owner ID',
      'Owner Name',
      'Owner Phone Number',
      'Owner CNIC',
      'Owner Email',
    ];
    final rowsOwner = List.generate(
      8,
      (index) => [
        'Owner $index',
        'Name $index',
        'PhnNum $index',
        '4220238${index + 2}',
        'Owner $index email'
      ],
    );

    final headersMtch = [
      'Maintenance Charge ID',
      'Maintenance Charge Amount',
      'Maintenance Charge Month',
      'Maintenance Charge Status',
    ];
    final rowsMtch = List.generate(
      8,
      (index) => [
        'ID $index',
        'Amount $index',
        'Month $index',
        'Status ${index + 2}',
      ],
    );

    return DefaultTabController(
      length: 3,
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
                'House Management',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
          ),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Houses', icon: Icon(Icons.house),),
              Tab(text: 'House Owners', icon: Icon(Icons.person),), 
              Tab(text: 'Maintenance Charges', icon: Icon(Icons.money),), 
            ],
          ),
        ),
        body: TabBarView(
          children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
              child: MyTable(headers: headers, rows: rows)),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
              child: MyTable(headers: headersOwner, rows: rowsOwner)),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
              child: MyTable(headers: headersMtch, rows: rowsMtch)),
            ]
            

          ),
        bottomSheet: Builder(
  builder: (context) {
    // Obtain the TabController from the DefaultTabController
    final tabController = DefaultTabController.of(context);
    
    return ValueListenableBuilder<double>(
      valueListenable: tabController.animation!, // Listen to tab index changes
      builder: (context, animationValue, child) {
        final currentIndex = animationValue.round(); // Determine the current tab index
        final buttonTextAdd = currentIndex == 0 ? 'Add House' 
                              : currentIndex == 1 ? 'Add Owner'
                              : 'Add Maintenance Charge';
        final buttonActionAdd = currentIndex == 0 ? () => addHouse(context) : currentIndex == 1 ? () => addOwner(context): ()=> addMCTH(context);

        final buttonTextEdit = currentIndex == 0 ? 'Edit House' 
                              : currentIndex == 1 ?  'Edit Owner'
                              : 'Edit Maintenance Charge';
        final buttonActionEdit = currentIndex == 0 ? () => editHouse(context) : currentIndex == 1 ? () => editOwner(context) : ()=>editMtch(context);

        final double width = currentIndex==1? 200:300;

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
            const SizedBox(width: 20,),
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
            if(currentIndex==1)
              const SizedBox(width: 20,),
            if(currentIndex==1)
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: MyButton(
                  text: 'Delete Owner',
                  onPressed: () => deleteOwner(context),
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

  void addHouse(BuildContext context) {
    TextEditingController houseNumber = TextEditingController();
    TextEditingController streetNumber = TextEditingController();
    TextEditingController houseOwnerID = TextEditingController();
    TextEditingController numberOfRms = TextEditingController();
    TextEditingController householdSize = TextEditingController();
    TextEditingController onRent = TextEditingController();
    TextEditingController mtchID = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: const Text('Add House'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                MyInputField(
                    hintText: 'House Number',
                    obscureText: false,
                    controller: houseNumber),
                const SizedBox(height: 20,),
                MyInputField(
                    hintText: 'Street Number',
                    obscureText: false,
                    controller: streetNumber),
                const SizedBox(height: 20,),
                MyInputField(
                    hintText: 'House Owner ID',
                    obscureText: false,
                    controller: houseOwnerID),
                const SizedBox(height: 20,),
                MyInputField(
                    hintText: 'Number of Rooms',
                    obscureText: false,
                    controller: numberOfRms),
                const SizedBox(height: 20,),
                MyInputField(
                    hintText: 'Household Size',
                    obscureText: false,
                    controller: householdSize),
                const SizedBox(height: 20,),
                MyInputField(
                    hintText: 'On Rent? Enter True/False',
                    obscureText: false,
                    controller: onRent),
                const SizedBox(height: 20,),
                MyInputField(
                    hintText: 'Maintenance Charge ID',
                    obscureText: false,
                    controller: mtchID),
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

  void editHouse(BuildContext context) {
    TextEditingController houseNumber = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: const Text('Edit House'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                MyInputField(
                    hintText: 'House Number',
                    obscureText: false,
                    controller: houseNumber),
                const SizedBox(height: 20,),
              ],
            ),
            actions: [
              MyButton(text: 'Cancel', onPressed: (){ Navigator.pop(context);}, width: 100, height: 40, color: Colors.red[300]!,),
              const SizedBox(width: 20,),
              MyButton(text: 'OK', onPressed: (){Navigator.pop(context); selectAttributetoEdit(context, 'house');}, width: 100, height: 40, color: Colors.green[400]!,),
            ],
          );
      },
    );
  }

  void addOwner(BuildContext context) {
    TextEditingController houseNumber = TextEditingController();
    TextEditingController streetNumber = TextEditingController();
    TextEditingController houseOwnerID = TextEditingController();
    TextEditingController numberOfRms = TextEditingController();
    TextEditingController householdSize = TextEditingController();
    TextEditingController onRent = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: const Text('Add Owner'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                MyInputField(
                    hintText: 'First Name',
                    obscureText: false,
                    controller: houseNumber),
                const SizedBox(height: 20,),
                MyInputField(
                    hintText: 'Last Name',
                    obscureText: false,
                    controller: streetNumber),
                const SizedBox(height: 20,),
                MyInputField(
                    hintText: 'House Owner ID',
                    obscureText: false,
                    controller: houseOwnerID),
                const SizedBox(height: 20,),
                MyInputField(
                    hintText: 'Number of Rooms',
                    obscureText: false,
                    controller: numberOfRms),
                const SizedBox(height: 20,),
                MyInputField(
                    hintText: 'Household Size',
                    obscureText: false,
                    controller: householdSize),
                const SizedBox(height: 20,),
                MyInputField(
                    hintText: 'On Rent? Enter True/False',
                    obscureText: false,
                    controller: onRent),
                const SizedBox(height: 20,),
              ],
            ),
            actions: [
              MyButton(text: 'Cancel', onPressed: ()async{ 
                Navigator.pop(context); 
                await HouseRequests().fetchHouseOwners();
                }, width: 100, height: 40, color: Colors.red[300]!,),
              const SizedBox(width: 20,),
              MyButton(text: 'OK', onPressed: (){Navigator.pop(context);}, width: 100, height: 40, color: Colors.green[400]!,),
            ],
          );
      },
    );
  }

  void editOwner(BuildContext context) {
    TextEditingController houseOwnerID = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: const Text('Edit Owner'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                MyInputField(
                    hintText: 'House Owner ID',
                    obscureText: false,
                    controller: houseOwnerID),
                const SizedBox(height: 20,),
              ],
            ),
            actions: [
              MyButton(text: 'Cancel', onPressed: (){ Navigator.pop(context);}, width: 100, height: 40, color: Colors.red[300]!,),
              const SizedBox(width: 20,),
              MyButton(text: 'OK', onPressed: (){Navigator.pop(context);selectAttributetoEdit(context, 'owner');}, width: 100, height: 40, color: Colors.green[400]!,),
            ],
          );
      },
    );
  }

   void addMCTH(BuildContext context) {
    TextEditingController mtchID = TextEditingController();
    TextEditingController mtchAmount = TextEditingController();
    TextEditingController mtchMonth = TextEditingController();
    TextEditingController mtchStatus = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: const Text('Add House'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                MyInputField(
                    hintText: 'Maintenance Charge ID',
                    obscureText: false,
                    controller: mtchID),
                const SizedBox(height: 20,),
                MyInputField(
                    hintText: 'Maintenance Charge Amount',
                    obscureText: false,
                    controller: mtchAmount),
                const SizedBox(height: 20,),
                MyInputField(
                    hintText: 'Maintenance Charge Month',
                    obscureText: false,
                    controller: mtchMonth),
                const SizedBox(height: 20,),
                MyInputField(
                    hintText: 'Maintenance Charge Status',
                    obscureText: false,
                    controller: mtchStatus),
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

  void editMtch(BuildContext context) {
    TextEditingController mtchID = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: const Text('Edit Maintenance Charge'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                MyInputField(
                    hintText: 'Charge ID',
                    obscureText: false,
                    controller: mtchID),
                const SizedBox(height: 20,),
              ],
            ),
            actions: [
              MyButton(text: 'Cancel', onPressed: (){ Navigator.pop(context);}, width: 100, height: 40, color: Colors.red[300]!,),
              const SizedBox(width: 20,),
              MyButton(text: 'OK', onPressed: (){Navigator.pop(context); selectAttributetoEdit(context, 'mtch');}, width: 100, height: 40, color: Colors.green[400]!,),
            ],
          );
      },
    );
  }

  void selectAttributetoEdit(BuildContext context, String entityToEdit) async{
    final List<String> attributes = (entityToEdit == 'house')?['House Owner ID','Number of Rooms','Household Size','On Rent']:(entityToEdit == 'mtch')?['Amount','Month','Status']:['Phone Number', 'Email'];
    String initialVal = (entityToEdit == 'house')?'House Owner ID':(entityToEdit == 'mtch')?'Amount': 'Phone Number';

    showDialog(
      context: context, 
      builder: (context) {
        return AlertDialog(
          title: const Text('Select Attribute to Edit'),
          content: Padding(
            padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
            child: FittedBox(
                    fit:  BoxFit.scaleDown,
                    child: SizedBox(
                      width: 200,
                      child: DropdownButtonFormField(
                        isDense: true,
                        decoration: const InputDecoration(
                          border: OutlineInputBorder()
                        ),
                        enableFeedback: true,
                        value: initialVal,
                        items: attributes.map((attribute) => DropdownMenuItem(value: attribute , child: Text(attribute, overflow: TextOverflow.ellipsis,))).toList(), 
                        onChanged: (value) {
                          initialVal = value!;
                        },
                      ),
                    ),
                  ),
          ),
            actions: [
              MyButton(text: 'Cancel', onPressed: (){ Navigator.pop(context);}, width: 100, height: 40, color: Colors.red[300]!,),
              const SizedBox(width: 20,),
              MyButton(text: 'OK', onPressed: (){Navigator.pop(context); enterNewValue(context, initialVal);}, width: 100, height: 40, color: Colors.green[400]!,),
            ],
        );
      },
    );
  }

  void enterNewValue(BuildContext context, String attribute){
    final TextEditingController controller = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: const Text('Enter New Value'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                MyInputField(
                    hintText: attribute,
                    obscureText: false,
                    controller: controller),
                const SizedBox(height: 20,),
              ]
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

  void deleteOwner(BuildContext context){
     TextEditingController houseOwnerID = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: const Text('Delete Owner'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                MyInputField(
                    hintText: 'House Owner ID',
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
}


