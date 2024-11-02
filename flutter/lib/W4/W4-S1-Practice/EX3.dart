import 'package:flutter/material.dart';

enum ButtonType { primary, secondary, disabled }

enum IconPosition { left, right }

class CustomButton extends StatelessWidget {
  final String label;
  final IconData icon;
  final IconPosition iconPosition;
  final ButtonType buttonType;

  const CustomButton({
    super.key,
    required this.label,
    required this.icon,
    this.iconPosition = IconPosition.left,
    this.buttonType = ButtonType.primary,
  });

  @override
  Widget build(BuildContext context) {
    Color buttonColor;
    switch (buttonType) {
      case ButtonType.primary:
        buttonColor = Colors.blue;
        break;
      case ButtonType.secondary:
        buttonColor = Colors.green;
        break;
      case ButtonType.disabled:
      default:
        buttonColor = Colors.grey;
        break;
    }
    TextStyle textStyle = TextStyle(
      color: buttonType == ButtonType.disabled ? Colors.black38 : Colors.white,
    );
    List<Widget> buttonContent = iconPosition == IconPosition.left
        ? [
            Icon(icon, color: textStyle.color),
            const SizedBox(width: 8),
            Text(label, style: textStyle)
          ]
        : [
            Text(label, style: textStyle),
            const SizedBox(width: 8),
            Icon(icon, color: textStyle.color)
          ];
    return SizedBox(
      width: 500,
      height: 50,
      child: ElevatedButton(
        onPressed: buttonType == ButtonType.disabled ? null : () {},
        style: ElevatedButton.styleFrom(
          backgroundColor: buttonColor,
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
        ),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.center,
          children: buttonContent,
        ),
      ),
    );
  }
}

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: const Text("Custom Buttons")),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomButton(
                label: "Submit",
                icon: Icons.check,
                iconPosition: IconPosition.left,
                buttonType: ButtonType.primary,
              ),
              const SizedBox(height: 16),
              CustomButton(
                label: "Time",
                icon: Icons.access_time,
                iconPosition: IconPosition.right,
                buttonType: ButtonType.secondary,
              ),
              const SizedBox(height: 16),
              CustomButton(
                label: "Account",
                icon: Icons.account_circle,
                iconPosition: IconPosition.right,
                buttonType: ButtonType.disabled,
              ),
            ],
          ),
        ),
      ),
    ),
  );
}
