import 'package:flutter/material.dart';
import 'package:frontend/widgets/button.dart';
import 'package:frontend/widgets/input_field.dart';
import 'package:frontend/widgets/my_table.dart';

class ShoppingCenterView extends StatefulWidget {
  const ShoppingCenterView({super.key});

  @override
  State<ShoppingCenterView> createState() => _HouseViewState();
}

class _HouseViewState extends State<ShoppingCenterView> {
  @override
  Widget build(BuildContext context) {
    final headers = [
      'Shopping Center ID',
      'Manager ID',
      'Shopping Center Name',
      'Number of Shops',
    ];

    final rows = List.generate(
      8,
      (index) => [
        'Shopping Center $index',
        'Manager $index',
        'Name $index',
        '${index + 2}',
      ],
    );

    final shopsHeader = [
      'Shop ID',
      'Shop Name',
      'Shop Description',
      'Shopping Center ID',
      'Shop Owner ID',
    ];
    final shopsRows = List.generate(
      8,
      (index) => [
        'Shop $index',
        'Name $index',
        'Description $index',
        'Center ID ${index + 2}',
        'Owner $index'
      ],
    );

    final ownersHeader = [
      'Owner ID',
      'Owner Name',
      'Owner CNIC',
      'Owner Phone Number',
      'Owner Email'
    ];
    final ownersRows = List.generate(
      8,
      (index) => [
        'Owner $index',
        'Name $index',
        'CNIC $index',
        'Phone Number ${index + 2}',
        'Email $index'
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
                'Shopping Center Management',
                style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
              ),
            ),
          ),
          bottom: const TabBar(
            tabs: [
              Tab(text: 'Shopping Center', icon: Icon(Icons.business),),
              Tab(text: 'Shops', icon: Icon(Icons.shopping_cart),), 
              Tab(text: 'Shop Owners', icon: Icon(Icons.person),), 
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
              child: MyTable(headers: shopsHeader, rows: shopsRows)),
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
              child: MyTable(headers: ownersHeader, rows: ownersRows)),
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
        final buttonTextAdd = currentIndex == 0 ? 'Add Shopping Center' : 
                              currentIndex == 1 ?'Add Shop'
                              : 'Add Owner';
        final buttonActionAdd = currentIndex == 0 ? () => addShoppingCenter(context) : 
                                currentIndex == 1 ? () => addShop(context)
                                : () => addOwner(context);

        final buttonTextEdit = currentIndex == 0 ? 'Edit Shopping Center': 
                               currentIndex == 1 ?'Edit Shop'
                               : 'Edit Owner';
        final buttonActionEdit = currentIndex == 0 ? () => editShoppingCenter(context) : 
                                 currentIndex == 1 ? () => editShop(context)
                                 : () => editOwner(context);

        final double width = currentIndex==0? 300:200;

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
            if(currentIndex!=0)
              const SizedBox(width: 20,),
            if(currentIndex!=0)
              Padding(
                padding: const EdgeInsets.only(bottom: 30),
                child: MyButton(
                  text: currentIndex == 1 ? 'Delete Shop' : 'Delete Owner',
                  onPressed: currentIndex == 1 ? () => deleteShop(context):() => deleteOwner(context),
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

  void editShoppingCenter(BuildContext context) {
    TextEditingController shoppingCenterID = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: const Text('Edit Shopping Center'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                MyInputField(
                    hintText: 'Shopping Center ID',
                    obscureText: false,
                    controller: shoppingCenterID),
                const SizedBox(height: 20,),
              ],
            ),
            actions: [
              MyButton(text: 'Cancel', onPressed: (){ Navigator.pop(context);}, width: 100, height: 40, color: Colors.red[300]!,),
              const SizedBox(width: 20,),
              MyButton(text: 'OK', onPressed: (){Navigator.pop(context); selectAttributetoEdit(context, 'shoppingCenter');}, width: 100, height: 40, color: Colors.green[400]!,),
            ],
          );
      },
    );
  }

  void addShop(BuildContext context) {
    TextEditingController shopName = TextEditingController();
    TextEditingController shopDescription = TextEditingController();
    TextEditingController shoppingCenterID = TextEditingController();
    TextEditingController shopOwnerID = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: const Text('Add Shop'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                MyInputField(
                    hintText: 'Shop Name',
                    obscureText: false,
                    controller: shopName),
                const SizedBox(height: 20,),
                MyInputField(
                    hintText: 'Shop Description',
                    obscureText: false,
                    controller: shopDescription),
                const SizedBox(height: 20,),
                MyInputField(
                    hintText: 'Shopping Center ID',
                    obscureText: false,
                    controller: shoppingCenterID),
                const SizedBox(height: 20,),
                MyInputField(
                    hintText: 'shopOwnerID',
                    obscureText: false,
                    controller: shopOwnerID),
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

  void editShop(BuildContext context) {
    TextEditingController houseOwnerID = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: const Text('Edit Shop'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                MyInputField(
                    hintText: 'Shop ID',
                    obscureText: false,
                    controller: houseOwnerID),
                const SizedBox(height: 20,),
              ],
            ),
            actions: [
              MyButton(text: 'Cancel', onPressed: (){ Navigator.pop(context);}, width: 100, height: 40, color: Colors.red[300]!,),
              const SizedBox(width: 20,),
              MyButton(text: 'OK', onPressed: (){Navigator.pop(context);selectAttributetoEdit(context, 'shop');}, width: 100, height: 40, color: Colors.green[400]!,),
            ],
          );
      },
    );
  }

  void selectAttributetoEdit(BuildContext context, String entityToEdit) async{
    final List<String> attributes = (entityToEdit == 'shoppingCenter')?['Manager','Name','Number of Shops']:
                                    (entityToEdit == 'shop')?['Shop Name', 'Shop Description', 'Shopping Center ID', 'Shop Owner ID']
                                    : ['Owner Name','Owner CNIC', 'Phone Number','Owner email'];
    String initialVal = (entityToEdit == 'shoppingCenter')?'Manager': 
                        (entityToEdit == 'shop')?'Shop Name'
                        : 'Owner Name';

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

  void deleteShop(BuildContext context){
     TextEditingController houseOwnerID = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: const Text('Delete Shop'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                MyInputField(
                    hintText: 'Shop ID',
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

  void addOwner(BuildContext context) {
    TextEditingController name = TextEditingController();
    TextEditingController cnic = TextEditingController();
    TextEditingController phnNum = TextEditingController();
    TextEditingController email = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: const Text('Add Shop Owner'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                MyInputField(
                    hintText: 'Owner Name',
                    obscureText: false,
                    controller: name),
                const SizedBox(height: 20,),
                MyInputField(
                    hintText: 'Owner CNIC',
                    obscureText: false,
                    controller: cnic),
                const SizedBox(height: 20,),
                MyInputField(
                    hintText: 'Owner Phone Number',
                    obscureText: false,
                    controller: phnNum),
                const SizedBox(height: 20,),
                MyInputField(
                    hintText: 'Owner Email',
                    obscureText: false,
                    controller: email),
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

  void editOwner(BuildContext context) {
    TextEditingController shoppingCenterID = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: const Text('Edit Shop Owner'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                MyInputField(
                    hintText: 'Owner ID',
                    obscureText: false,
                    controller: shoppingCenterID),
                const SizedBox(height: 20,),
              ],
            ),
            actions: [
              MyButton(text: 'Cancel', onPressed: (){ Navigator.pop(context);}, width: 100, height: 40, color: Colors.red[300]!,),
              const SizedBox(width: 20,),
              MyButton(text: 'OK', onPressed: (){Navigator.pop(context); selectAttributetoEdit(context, 'shopOwner');}, width: 100, height: 40, color: Colors.green[400]!,),
            ],
          );
      },
    );
  }

  void deleteOwner(BuildContext context){
     TextEditingController shopOwnerID= TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: const Text('Delete Owner'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                MyInputField(
                    hintText: 'Owner ID',
                    obscureText: false,
                    controller: shopOwnerID ),
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
}


