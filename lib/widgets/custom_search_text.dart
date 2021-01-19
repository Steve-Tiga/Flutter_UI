import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterstudy/util/colors.dart';

class CustomSearchText extends StatelessWidget {
  final String text;
  final bool enable;
  final VoidCallback callback;
  final TextEditingController controller;

  const CustomSearchText(
      {this.text, this.enable, this.callback, this.controller});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.all(12),
      decoration: ShapeDecoration(
          shadows: [
            BoxShadow(
              color: Colors.grey,
              offset: Offset(
                0.0, // Move to right 10  horizontally
                1.0, // Move to bottom 5 Vertically
              ),
            )
          ],
          color: Colors.white,
          shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(16)),
              side: BorderSide(color: Colors.grey, width: 1))),
      child: TextField(
        onTap: callback,
        readOnly: !enable,
        enableInteractiveSelection: enable,
        autofocus: false,
        controller: controller,
        enableSuggestions: enable,
        decoration: InputDecoration(
            hintText: text,
            hintStyle: TextStyle(
                fontSize: 16, fontWeight: FontWeight.w500, color: Colors.grey),
            contentPadding: EdgeInsets.all(12),
            enabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(6))),
            disabledBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(6))),
            focusedBorder: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(6))),
            border: OutlineInputBorder(
                borderSide: BorderSide.none,
                borderRadius: BorderRadius.all(Radius.circular(6))),
            suffixIcon: Padding(
              padding: const EdgeInsets.all(6.0),
              child: Icon(Icons.search),
            )),
      ),
    );
  }
}
