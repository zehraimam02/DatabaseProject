import 'package:flutter/material.dart';
import 'package:frontend/widgets/button.dart';
import 'package:frontend/widgets/input_field.dart';
import 'package:frontend/widgets/my_table.dart';

class CommunityCenterView extends StatelessWidget {
  const CommunityCenterView({super.key});

  @override
  Widget build(BuildContext context) {
    final headers = [
      'Center ID',
      'Name',
      'Street ID',
      'Manager ID',
    ];

    final rows = List.generate(
      8,
      (index) => [
        'Center $index',
        'Name $index',
        'Street $index',
        'Manager ID ${index + 2}',
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
              'Community Center Management',
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
              text: 'Add Community Center',
              onPressed: ()=>addComCenter(context),
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
              text: 'Edit Community Center',
              onPressed: ()=> editComCenter(context),
              color: Colors.orange[200]!,
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
              text: 'Delete Community Center',
              onPressed: ()=> deleteComCenter(context),
              color: Colors.red[300]!,
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

   void editComCenter(BuildContext context) {
    TextEditingController centerID = TextEditingController();

    showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
            title: const Text('Edit Community Center'),
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
              MyButton(text: 'OK', onPressed: (){Navigator.pop(context); selectAttributetoEdit(context);}, width: 100, height: 40, color: Colors.green[400]!,),
            ],
          );
      },
    );
  }

  void selectAttributetoEdit(BuildContext context) async{
    final List<String> attributes = ['Name','Street ID','Manager ID'];
    String initialVal = 'Name';

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
