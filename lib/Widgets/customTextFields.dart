
import 'package:flutter/material.dart';
import 'dart:ui' as ui;

class FormTextField extends StatelessWidget {
  final IconData prefixIcon;
  final IconButton suffixIcon;
  final TextCapitalization capitalization;
  final String txtHint;
  final errorText;
  final bool txtIsSecure;
  final TextInputType keyboardType;
  final TextEditingController txtController;
  final Function validator;
  final Function onSaved;
  final Function onChanged;

  final Color enableBorderColor;
  final Color focusBorderColor;
  final Color textColor;

  FormTextField({this.errorText, this.prefixIcon, this.suffixIcon, this.capitalization = TextCapitalization.words, this.txtHint, this.txtIsSecure = false, this.keyboardType, this.txtController, this.validator, this.onSaved, this.onChanged,this.textColor,this.enableBorderColor,this.focusBorderColor,});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection:ui.TextDirection.rtl,
      child: TextFormField(
        style: TextStyle(fontSize: 14,color: Color(0xff5F5F5F)),
        textAlign: TextAlign.justify,
        textCapitalization: capitalization,
        textAlignVertical: TextAlignVertical.center,
        keyboardType: keyboardType,
        obscureText: txtIsSecure,
        controller: txtController,
        validator: validator,
        onSaved: onSaved,
        onChanged: onChanged,

        decoration: InputDecoration(
            contentPadding: EdgeInsets.symmetric(horizontal: 12, vertical: 6),
            //labelText: txtHint,
            prefixIcon: prefixIcon != null ? Container(transform: Matrix4.translationValues(0.0, 0.0, 0.0), child: Icon(prefixIcon, size: 16,color: Color(0xff5F5F5F),)) : null,
            suffixIcon: suffixIcon,
            hintText: txtHint,


            hintStyle: TextStyle(fontSize: 14,color: Color(0xff5F5F5F),fontWeight: FontWeight.w400),
            filled: true,

            fillColor: Theme.of(context).secondaryHeaderColor,
            errorText: errorText,
            border: new OutlineInputBorder(
              borderSide: BorderSide(
                width: 0,
                style: BorderStyle.none,
              ),
              borderRadius: const BorderRadius.all(
                const Radius.circular(20.0),
              ),
            )
            //border: InputBorder.none
          // focusedBorder: UnderlineInputBorder(
          //     borderSide: BorderSide(
          //         width: 1.3,
          //         style: BorderStyle.solid,
          //         color: Colors.white
          //         //color: Theme.of(context).primaryColor
          //     )
          // ),
          // enabledBorder: UnderlineInputBorder(
          //     borderSide: BorderSide(
          //         width: 1,
          //         style: BorderStyle.solid,
          //         color: Colors.grey.withOpacity(0.4)
          //     )
          // ),
        ),
      ),
    );
  }
}