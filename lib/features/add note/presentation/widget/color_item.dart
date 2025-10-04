import 'package:flutter/material.dart';

class ColorItem extends StatelessWidget {
  const ColorItem({
    super.key,
    this.onTap,
    required this.selectedColor,
    required this.color,
  });
  final Function()? onTap;
  final int selectedColor;
  final Color color;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 4.0),
      child: InkWell(
        splashColor: Colors.transparent,
        onTap: onTap,
        child:
            (selectedColor == color.toARGB32())
                ? CircleAvatar(
                  backgroundColor: Colors.purple,
                  radius: 22,
                  child: CircleAvatar(
                    backgroundColor: color,
                    child: Icon(Icons.check, color: Colors.green),
                  ),
                )
                : CircleAvatar(backgroundColor: color),
      ),
    );
  }
}
