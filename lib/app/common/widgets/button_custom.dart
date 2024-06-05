import 'package:aims_college/app/utils/animations.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class CustomButton extends StatefulWidget {
  const CustomButton(
      {super.key,
      this.onPressed,
      this.btnColor,
      required this.btnText,
      this.width,
      this.btIcon});

  @override
  _CustomButtonState createState() => _CustomButtonState();

  final Function()? onPressed;
  final Color? btnColor;
  final String btnText;
  final double? width;
  final IconData? btIcon;
}

class _CustomButtonState extends State<CustomButton> {
  bool isButtonDisabled = false;

  Future<void> onClick() async {
    if (!isButtonDisabled) {
      if (widget.onPressed != null) {
        await widget.onPressed!();
      }

      // Disable the button
      setState(() {
        isButtonDisabled = true;
      });

      // Enable the button after 10 seconds
      await Future.delayed(const Duration(milliseconds: 200), () {
        setState(() {
          isButtonDisabled = false;
        });
      });
    } else {}
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 35,
      // width: 150,
      child: ElevatedButton(
        onPressed: onClick,
        // Disable the button if isButtonDisabled is true
        // style: ElevatedButton.styleFrom(
        //   backgroundColor: isButtonDisabled ? Colors.grey : null,
        // ),
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all(widget.btnColor),
          shape: MaterialStateProperty.all(const RoundedRectangleBorder(
              borderRadius: BorderRadius.all(Radius.circular(10)))),
        ),
        child: isButtonDisabled
            ? Lottie.asset(
                Animations.dotAnimaiton,
              )
            : (widget.btIcon == null)
                ? Text(
                    widget.btnText,
                    style: const TextStyle(color: Colors.white, fontSize: 18),
                  )
                : Center(
                    child: Icon(
                    widget.btIcon,
                    color: Colors.white,
                  )),
      ).marginOnly(top: 5),
    );
  }
}
