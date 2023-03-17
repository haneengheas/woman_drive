// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';

import '../styles/colors.dart';
import '../styles/styles.dart';

class ButtonTemplate extends StatelessWidget {
  ButtonTemplate({
    Key? key,
    required this.color,
    required this.text1,
    required this.onPressed,
    this.text2 = "",
    this.text3 = "",
    this.minwidth,
    this.fontSize = 18,
  }) : super(key: key);
  Color color;
  String text1;
  String text2;
  String text3;
  double? minwidth;
  double fontSize;
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: MaterialButton(
        minWidth: minwidth,
        height: 50,
        onPressed: onPressed,
        color: color,
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        child: RichText(
            text: TextSpan(
                text: "",
                style: TextStyle(color: Colors.white, fontSize: fontSize),
                children: [
                  TextSpan(text: text1, style: AppTextStyles.button),
                  TextSpan(text: text2),
                  TextSpan(
                      text: text3,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                ])),
      ),
    );
  }
}

class CustomButtonTemplate extends StatelessWidget {
  double? width;
  double? height;
  void Function()? onPressed;
  String? text;
  Color? color;
  TextStyle? textStyle;

  CustomButtonTemplate({this.height,
    this.width,
    this.text,
    this.color,
    this.onPressed,
    this.textStyle,
    Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      child: MaterialButton(
          minWidth: width,
          height: height,
          onPressed: onPressed,
          color: color,
          shape:
          RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Text(
            text!,
            style: textStyle,
          )),
    );
  }
}

class TextFieldTemplate extends StatelessWidget {
  TextFieldTemplate({Key? key,
    required this.hintText,
    this.controller,
    this.obscureText = false,
    this.validator,
    this.icon,
    this.lines})
      : super(key: key);

  String hintText;
  TextEditingController? controller;
  bool obscureText;
  Function? validator;
  IconData? icon;
  int? lines;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: Directionality(
        textDirection: TextDirection.rtl,
        child: TextFormField(
          obscureText: obscureText,
          maxLines: lines,
          controller: controller,
          validator: (value) => validator!(value),
          decoration: InputDecoration(
              hintText: hintText,
              border: InputBorder.none,
              filled: true,
              fillColor: AppColors.white,
              prefixIcon: Icon(
                icon,
                color: AppColors.greyDark,
              ),
              labelStyle: const TextStyle(color: AppColors.grey, fontSize: 15),
              hintStyle:
              const TextStyle(color: AppColors.greyDark, fontSize: 15),
              enabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.black, width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              focusedBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.black, width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              errorBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.black, width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(15))),
              disabledBorder: const OutlineInputBorder(
                  borderSide: BorderSide(color: AppColors.black, width: 1),
                  borderRadius: BorderRadius.all(Radius.circular(15)))),
        ),
      ),
    );
  }
}

class BottomText extends StatelessWidget {
  const BottomText({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      child: RichText(
          textAlign: TextAlign.center,
          text: const TextSpan(
              text: "",
              style: TextStyle(
                color: Colors.black,
                fontSize: 18,
              ),
              children: [
                TextSpan(
                    text: "FCIS - ",
                    style: TextStyle(fontWeight: FontWeight.bold)),
                TextSpan(text: "Facult of comuters \n and informatoin science"),
              ])),
    );
  }
}

void showMyDialog(String message, BuildContext context) async {
  return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          //  backgroundColor: Colors.white,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          contentPadding: EdgeInsets.zero,
          title: const Text("Error"),
          content: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Text(message),
          ),
          actions: [
            Center(
              child: TextButton(
                  style: ButtonStyle(
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(25.0),
                          ))),
                  onPressed: () {
                    Navigator.pop(context, "ok");
                  },
                  child: const Text(
                    "ok",
                    style:
                    TextStyle(color: AppColors.primarycolor, fontSize: 22),
                  )),
            )
          ],
        );
      });
}

///

class NavigateToOption extends StatelessWidget {
  NavigateToOption({Key? key, required this.name, required this.onPressed})
      : super(key: key);
  String name;
  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8.0),
      child: SizedBox(
        height: 70,
        width: 320,
        child: Material(
          color: AppColors.pink,
          borderRadius: BorderRadius.circular(20),
          child: Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 20,
            ),
            child: Row(
              children: [
                Text(name,
                    style: const TextStyle(
                        fontSize: 30, fontWeight: FontWeight.bold)),
                const Spacer(),
                SizedBox(
                  width: 40,
                  height: 40,
                  child: MaterialButton(
                      padding: EdgeInsets.zero,
                      color: AppColors.primarycolor,
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10)),
                      onPressed: onPressed,
                      child: const Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                      )),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class TeamsName extends StatelessWidget {
  TeamsName({Key? key, required this.name, required this.onPressed})
      : super(key: key);
  String name;

  void Function()? onPressed;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10.0),
      child: SizedBox(
        height: 100,
        width: 1,
        child: MaterialButton(
            padding: const EdgeInsets.all(10),
            color: AppColors.grey,
            shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(20)),
            onPressed: onPressed,
            child: RichText(
              text: TextSpan(
                text: 'Team ',
                style: AppTextStyles.w300.apply(
                  color: Colors.black,
                ),
                children: <TextSpan>[
                  TextSpan(text: name, style: AppTextStyles.lrTitles),
                ],
              ),
            )),
      ),
    );
  }
}

class Header extends StatelessWidget {
  final String? text;
  TextStyle? style;

  Header({this.text, this.style, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
        child: Align(
          alignment: Alignment.centerRight,
          child: Text(text!, style: style),
        ));
  }
}

class Box extends StatelessWidget {
  double? height;
  double? width;
  String? text;
  TextStyle? style;
  Color? color;
  AlignmentGeometry ? dirction;

  Box({this.color, this.style, this.width, this.height, this.text, this.dirction, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      height: height,
      width: width,
      alignment: dirction,
      margin: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: color,

      ),
      child: Text(
        textDirection: TextDirection.rtl,
        text!,
        style: style,
      ),
    );
  }
}


class ProfileImage extends StatelessWidget {
  String ? name;

  String ? role;
  String ?image;

  void Function()? onTap;


   ProfileImage({ this.name, this.image, this.onTap, this.role, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding:
      const EdgeInsets.symmetric(horizontal: 20.0, vertical: 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Column(
            textDirection: TextDirection.rtl,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                name!,
                style: AppTextStyles.name,
              ),
              const SizedBox(
                height: 10,
              ),
              Text(
                role!,
                style: AppTextStyles.name,
              ),
            ],
          ),
          const SizedBox(
            width: 20,
          ),
          InkWell(
            onTap: onTap,
            child:  CircleAvatar(
              backgroundImage: AssetImage(image!),
              radius: 40,
            ),
          ),
        ],
      ),
    );
  }
}
