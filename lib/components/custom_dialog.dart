import 'package:devpush/core/app_text_styles.dart';
import 'package:flutter/material.dart';

class CustomDialog extends StatelessWidget {
  final Color color;
  final Icon icon;
  final String title, description, buttonText;
  final Image image;

  CustomDialog({
    @required this.color,
    @required this.icon,
    @required this.title,
    @required this.description,
    @required this.buttonText,
    this.image,
  });

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(16),
      ),
      elevation: 0.0,
      backgroundColor: Colors.transparent,
      child: Stack(
        children: <Widget>[
          Container(
            padding: EdgeInsets.only(
              top: 44,
              bottom: 16,
              left: 16,
              right: 16,
            ),
            margin: EdgeInsets.only(top: 28),
            decoration: new BoxDecoration(
              color: Colors.white,
              shape: BoxShape.rectangle,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                  color: Colors.black26,
                  blurRadius: 10.0,
                  offset: const Offset(0.0, 10.0),
                ),
              ],
            ),
            child: Column(
              mainAxisSize: MainAxisSize.min, // To make the card compact
              children: <Widget>[
                Text(
                  title,
                  style: AppTextStyles.title,
                ),
                SizedBox(height: 16.0),
                Text(
                  description,
                  textAlign: TextAlign.center,
                  style: AppTextStyles.cardBody,
                ),
                SizedBox(height: 24.0),
                Align(
                  alignment: Alignment.bottomRight,
                  child: TextButton(
                    onPressed: () {
                      Navigator.of(context).pop(); // To close the dialog
                    },
                    child: Text(buttonText),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            left: 16,
            right: 16,
            child: CircleAvatar(
              backgroundColor: color,
              radius: 28,
              child: icon,
            ),
          ),
        ],
      ),
    );
  }
}
