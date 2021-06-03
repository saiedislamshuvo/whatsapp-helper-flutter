import 'package:flutter/material.dart';

class AppDialog {
  static showWhatsAppFailedAlert(BuildContext context) {
    return showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: Text(
            "Alert",
            style: TextStyle(
              color: Theme.of(context).accentColor,
              fontSize: 18
            ),
          ),
          content: Text(
            "WhatsApp can't open this number",
            style: TextStyle(
              color: Colors.black,
              fontSize: 14
            ),
          ),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: OutlinedButton(
                onPressed: () => Navigator.of(context).pop(),
                child: Text(
                  "Close",
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          ],
        );
      }
    );
  }
}