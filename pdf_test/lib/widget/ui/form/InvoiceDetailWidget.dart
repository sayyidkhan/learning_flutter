import 'package:flutter/material.dart';
import 'package:flutter_datetime_picker/flutter_datetime_picker.dart';

class InvoiceDetailWidget extends StatelessWidget {
  //date range
  static DateTime minYear;
  static DateTime maxYear;

  static var _invoiceNumber;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Column(
          children: <Widget>[
            _buildTextField(
              labelText: "Invoice No",
              textFieldMaxLength: 10,
              errorMessage: 'Invoice Number is Required',
              inputValue: _invoiceNumber,
              validationRequired: true,
            ),
          ],
        ),
      ],
    );
  }

  Widget _buildTextField({
    String labelText,
    int textFieldMaxLength,
    String errorMessage,
    Object inputValue,
    bool validationRequired = false,
  }) {
    if (validationRequired) {
      return TextFormField(
        decoration: InputDecoration(labelText: labelText),
        maxLength: textFieldMaxLength,
        validator: (String value) {
          return value.isEmpty ? errorMessage : null;
        },
        onSaved: (String value) {
          inputValue = value;
        },
      );
    }
    return TextFormField(
      decoration: InputDecoration(labelText: labelText),
      maxLength: textFieldMaxLength,
      onSaved: (String value) {
        inputValue = value;
      },
    );
  }


}


