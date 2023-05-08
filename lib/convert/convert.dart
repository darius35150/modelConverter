import 'package:flutter/material.dart';

import '../constants/constants.dart';

class Convert {
  var inputTextFormFieldController = TextEditingController();

  Convert(this.inputTextFormFieldController);

  String convertModelToDto(){

      // for(int i = 0; i < inputTextFormFieldController.text.length; i++){
        String result = inputTextFormFieldController.text.replaceAll(Constants.ID, "").replaceAll(Constants.COLUMN, "").replaceAll(Constants.JSON_REF, "");
        print(result);
      // }

    return "";
  }
}