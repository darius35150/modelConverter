import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:model_converter/convert/convert.dart';

class MyWidget extends StatefulWidget {
  const MyWidget({super.key});

  @override
  State<MyWidget> createState() => _MyNewWidget();
}

class _MyNewWidget extends State<MyWidget> {
  final inputTextFormFieldController = TextEditingController();
  var outputTexTFormFieldController = TextEditingController();
  late Convert convert;
  double buttonElevation = 6;

  convertData() {
    setState(() {
      if(inputTextFormFieldController.text.isEmpty) {
        showDialog<void>(
          context: context,
          barrierDismissible: false,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('Model To Dto Converter'),
              content: const SingleChildScrollView(
                child: ListBody(
                  children: <Widget>[
                    Text('You must place model text before converting'),
                  ],
                ),
              ),
              actions: <Widget>[
                Center(
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor:const Color.fromARGB(255, 204, 228, 86)
                      ),
                      child: const Text('Ok',
                      style: TextStyle(
                        color: Colors.black87,
                        fontWeight: FontWeight.bold,
                        fontSize: 16
                      ),),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    )),
              ],
            );
          },
        );
      }else{
        convert = Convert(inputTextFormFieldController);
        outputTexTFormFieldController.text = convert.convertModelToDto();
      }
    });
  }

  clearData(){
    setState(() {
      inputTextFormFieldController.clear();
      outputTexTFormFieldController.clear();
    });
  }

  copyData() async{
    await Clipboard.setData(ClipboardData(text: outputTexTFormFieldController.text));
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          margin: const EdgeInsets.fromLTRB(0, 5, 0, 0),
          child: TextField(
              keyboardType: TextInputType.multiline,
              maxLines: 10,
              controller: inputTextFormFieldController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Place model code here',
                  hintStyle: TextStyle(color: Colors.grey)),
              style: const TextStyle(color: Colors.white),
          )
      ),
      const SizedBox(height: 2),
      Row(
        children: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor:const Color.fromARGB(255, 204, 228, 86)
            ),
            onPressed: convertData,
            child: const Text('Submit',
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: 16
            ),),
          ),
          const SizedBox(width: 8,),
          ElevatedButton(
          
            style: ElevatedButton.styleFrom(
              backgroundColor: const Color.fromARGB(255, 204, 228, 86)
            ),
            onPressed: clearData,
            child: const Text('Clear',
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: 16
            ),),
          ),
        ],
      ),
      Container(
          margin: const EdgeInsets.fromLTRB(0, 55, 0, 0),
          child: TextField(
              keyboardType: TextInputType.multiline,
              maxLines: 10,
              controller: outputTexTFormFieldController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), 
                  hintText: 'Converted Dto Code shows here',
                  hintStyle: TextStyle(color: Colors.grey)
              ),
              style: const TextStyle(color: Colors.white),
          )
      ),
            
      const SizedBox(height: 4,),
      Row(
      children: [ 
        ElevatedButton(
            style: ElevatedButton.styleFrom(
              elevation: buttonElevation,
              backgroundColor: const Color.fromARGB(255, 204, 228, 86)
            ),
            onPressed: copyData,
            child: const Text('Copy',
            style: TextStyle(
              color: Colors.black87,
              fontWeight: FontWeight.bold,
              fontSize: 16
            ),),
        )]),
    ]);
  }
}