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
         !string.trim().contains(Constants.EMBEDDED_ID) && !string.trim().contains(Constants.GENERATED_VALUE) &&
         !string.trim().contains(Constants.JOIN_COLUMN) && !string.trim().contains(Constants.JSON_BACK_REF) &&
         !string.trim().contains(Constants.JSON_MANAGED_REF) && !string.trim().contains(Constants.MANY_TO_ONE) &&
         !string.trim().contains(Constants.NOT_NULL) && !string.trim().contains(Constants.ORACLE_TYPE_ATTRIBUTE) &&
         !string.trim().contains(Constants.ORG_SPRING_DATA_ANNOTATION_ID) && !string.trim().contains(Constants.SEQ_GENERATOR) &&
         !string.trim().contains(Constants.TRANSIENT) && !string.trim().contains(Constants.XML_JAVA_TYPE_ADAPTER) &&
         !string.trim().contains(Constants.XML_TRANSIENT) && string.isNotEmpty){

        newList.add(string.trim());

      }
    }
    buffer.writeAll(newList, "\n");

    return buffer.toString();
  }
}