import 'package:flutter/material.dart';

class SimpleInputField extends StatefulWidget {
  final TextEditingController controller;
  final String title;
  final String hintText;
  final IconData? iconData;
  const SimpleInputField({Key? key, required this.controller, required this.title, required this.hintText, this.iconData}) : super(key: key);

  @override
  State<SimpleInputField> createState() => _SimpleInputFieldState();
}

class _SimpleInputFieldState extends State<SimpleInputField> {

  static const Color containerColor = Color(0xffF5F8FB);
  static const Color textBlack = Color(0xff232323);
  static const Color textLightBlack = Color(0xff717171);
  static const Color clearButtonColor = Color(0xffFF7511);


  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(widget.title, style: const TextStyle(
            fontSize: 18, fontWeight: FontWeight.w700, color: textBlack)),
        const SizedBox(height: 5),
        TextFormField(
          controller: widget.controller,
          keyboardType: TextInputType.number,
          decoration: InputDecoration(
            hintText: widget.hintText,
            hintStyle: const TextStyle(fontSize: 13,
                fontWeight: FontWeight.w400,
                color: textLightBlack),
            suffixIcon: widget.iconData != null ? Icon(
              widget.iconData, color: textLightBlack,) : Text(""),
            // suffixIcon:Icon(widget.iconData ?? Icons.abc_outlined, color: textLightBlack,),
            filled: true,
            fillColor: containerColor,


            border: OutlineInputBorder(
              borderSide: const BorderSide(width: 0, color: Colors.transparent),
              borderRadius: BorderRadius.circular(5),
            ),
            enabledBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 0, color: Colors.transparent),
              borderRadius: BorderRadius.circular(5),
            ),
            focusedBorder: OutlineInputBorder(
              borderSide: const BorderSide(width: 0, color: Colors.transparent),
              borderRadius: BorderRadius.circular(5),
            ),

          ),
          onFieldSubmitted: (value) {
            if (value.isEmpty) {
              widget.controller.text = "0.00";
            }
            widget.controller.text = value.toString();
            setState(() {});
          },

          onSaved: (value) {
            widget.controller.text = value.toString();
            setState(() {});
          },


          validator: (value) {
            if (value == null || value.isEmpty) {
              return "Please enter a valid amount";
            }
            return null;
          },


        ),
      ],
    );
  }
}
