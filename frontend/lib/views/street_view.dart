import 'package:flutter/material.dart';
import 'package:frontend/widgets/button.dart';
import 'package:frontend/widgets/input_field.dart';
import 'package:frontend/widgets/my_table.dart';

class StreetView extends StatelessWidget {
  const StreetView({super.key});

  @override
  Widget build(BuildContext context) {
    final headers = [
      'Street ID',
      'Street Type',
      'Number of Houses',
      'Street Light Count',
      'Zone ID',
    ];

    final rows = List.generate(
      8,
      (index) => [
        'Street $index',
        'Type $index',
        '${index + 20}',
        '${index + 37}',
        'Zone ${index + 2}',
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
              'Street Management',
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 25),
            ),
          ),
        ),
      ),
      body: Padding(
          padding: const EdgeInsets.only(top: 30, left: 30, right: 30),
          child: MyTable(headers: headers, rows: rows)),
      bottomSheet: Row(
        children: [
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: MyButton(
              text: 'Add Street',
              onPressed: ()=>addStreet(context),
              color: Colors.green[400]!,
              width: 300,
              height: 50,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          Padding(
            padding: const EdgeInsets.only(bottom: 30),
            child: MyButton(
              text: 'Edit Street',
              onPressed: ()=> editStreet(context),
              color: Colors.orange[200]!,
              width: 300,
              height: 50,
            ),
          ),
          const SizedBox(
            width: 20,
          ),
          // Padding(
          //   padding: const EdgeInsets.only(bottom: 30),
          //   child: MyButton(
          //     text: 'Delete Community Center',
          //     onPressed: ()=> deleteComCenter(context),
          //     color: Colors.red[300]!,
          //     width: 200,
          //     height: 50,
          //   ),
          // ),
        ],
      ),
    );
  }

  void addStreet(BuildContext context) {
    TextEditingController streetType = TextEditingController();
    TextEditingController numOfHouses = TextEditingController();
    TextEditingController streetLightCount = TextEditingController();
    TextEditingController zoneID = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: const Text('Add Street'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                MyInputField(
                    hintText: 'Street Type',
                    obscureText: false,
                    controller: streetType),
                const SizedBox(height: 20,),
                MyInputField(
                    hintText: 'Number of Houses',
                    obscureText: false,
                    controller: numOfHouses),
                const SizedBox(height: 20,),
                MyInputField(
                    hintText: 'Number of Street Lights',
                    obscureText: false,
                    controller: streetLightCount),
                const SizedBox(height: 20,),
                MyInputField(
                    hintText: 'Zone ID',
                    obscureText: false,
                    controller: zoneID),
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

   void editStreet(BuildContext context) {
    TextEditingController streetID = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: const Text('Edit Street'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                MyInputField(
                    hintText: 'Street ID',
                    obscureText: false,
                    controller: streetID),
                const SizedBox(height: 20,),
              ],
            ),
            actions: [
              MyButton(text: 'Cancel', onPressed: (){ Navigator.pop(context);}, width: 100, height: 40, color: Colors.red[300]!,),
              const SizedBox(width: 20,),
              MyButton(text: 'OK', onPressed: (){Navigator.pop(context); selectAttributetoEdit(context);}, width: 100, height: 40, color: Colors.green[400]!,),
            ],
          );
      },
    );
  }

  void selectAttributetoEdit(BuildContext context) async{
    final List<String> attributes = ['Street Type','Number of Houses','Street Light Count', 'Zone ID'];
    String initialVal = 'Street Type';

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

  void deleteComCenter(BuildContext context){
     TextEditingController centerID = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: const Text('Delete Community Center'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                MyInputField(
                    hintText: 'Center ID',
                    obscureText: false,
                    controller: centerID),
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
