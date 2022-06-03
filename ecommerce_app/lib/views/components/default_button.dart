import 'package:flutter/material.dart';
import '../../size_config.dart';

class DefaultButton extends StatefulWidget {
  final String text;
  final VoidCallback? onPressed;
  final Color backgroundColor;
  final bool isLoading;

  const DefaultButton({
    Key? key,
    required this.text,
    required this.onPressed,
    required this.backgroundColor,
    required this.isLoading,
  }) : super(key: key);

  @override
  State<DefaultButton> createState() => _DefaultButtonState();
}

class _DefaultButtonState extends State<DefaultButton> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: getProportionateScreenHeight(context, 56),
      child: TextButton(
        style: TextButton.styleFrom(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
          primary: Colors.white,
          backgroundColor: widget.backgroundColor,
        ),
        onPressed: widget.onPressed,
        child: !widget.isLoading
            ? Text(
                widget.text,
                style: TextStyle(
                  fontSize: getProportionateScreenWidth(context, 18),
                  color: Colors.white,
                ),
              )
            : const CircularProgressIndicator(
                color: Colors.white,
              ),
      ),
    );
  }
}
