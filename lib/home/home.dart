import 'package:flutter/material.dart';
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

  convertData() {
    setState(() {
      convert = Convert(inputTextFormFieldController);
      outputTexTFormFieldController.text = convert.convertModelToDto();
    });
  }

  clearData(){
    setState(() {
      inputTextFormFieldController.clear();
      outputTexTFormFieldController.clear();
    });
  }
  @override
  Widget build(BuildContext context) {
    return Column(children: [
      Container(
          margin: EdgeInsets.zero,
          child: TextField(
              keyboardType: TextInputType.multiline,
              maxLines: 15,
              controller: inputTextFormFieldController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  hintText: 'Place model code here'))),
      const SizedBox(height: 4),
      Row(
        children: [
          ElevatedButton(
            onPressed: convertData,
            child: const Text('Submit'),
          ),
          const SizedBox(width: 8,),
          ElevatedButton(
            onPressed: clearData,
            child: const Text('Clear'),
          ),
        ],
      ),
      Container(
          margin: const EdgeInsets.fromLTRB(0, 75, 0, 0),
          child: TextField(
              keyboardType: TextInputType.multiline,
              maxLines: 15,
              controller: outputTexTFormFieldController,
              decoration: const InputDecoration(
                  border: OutlineInputBorder(), hintText: 'New Code here')))
    ]);
  }
}