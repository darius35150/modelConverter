import 'package:flutter/material.dart';
import 'package:vector_math/vector_math.dart';

import '../constants/constants.dart';

class Convert {
  var inputTextFormFieldController = TextEditingController();

  Convert(this.inputTextFormFieldController);

  String convertModelToDto(){

    List list = inputTextFormFieldController.text.trim().split("\n").toList();
    List newList = [];
    StringBuffer buffer = StringBuffer();

    for(String string in list) {
      if(!string.trim().contains(Constants.COLUMN) && !string.trim().contains(Constants.ID) &&
         !string.trim().contains(Constants.ONE_TO_MANY) && !string.trim().contains(Constants.JSON_REF) &&
         string.isNotEmpty){
        newList.add(string.trim());
      }
    }
    buffer.writeAll(newList, "\n");

    return buffer.toString();
  }
}