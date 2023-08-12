import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';

class ButtonPrimary extends StatefulWidget {
  const ButtonPrimary({
    super.key,
    required this.onPressed,
    required this.text,
    required this.height,
    required this.width,
});
  final VoidCallback onPressed;
  final String text;
  final double height;
  final double width;

  @override
  State<ButtonPrimary> createState() => _ButtonPrimaryState();
}

class _ButtonPrimaryState extends State<ButtonPrimary> {
  bool isHover=false;
  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 200),
      decoration: BoxDecoration(
        color: isHover ? Colors.white30.withOpacity(0.6) : Colors.black12.withOpacity(0.6),
        border: Border.all(
          color: isHover ? Colors.black : Colors.white,
          width: 4,
        ),
        borderRadius: BorderRadius.circular(25),
      ),
      width: widget.width,
      height: widget.height,
      child: InkWell(
        borderRadius: BorderRadius.circular(25),
        onHover: (val){
          setState(() {
            isHover=val;
          });
        },
        onTap: widget.onPressed,
        child: Center(
          child: AutoSizeText(
            widget.text,
            style: TextStyle(
              color: isHover ? Colors.black : Colors.white,
              fontSize: 20,
            ),
            minFontSize: 5,
            maxLines: 1,
            stepGranularity: 1,
          ),
        ),

      ),
    );
  }
}
