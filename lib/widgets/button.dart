import 'package:flutter/material.dart';

class AppButton extends StatelessWidget {
  String text;
  Function onPressed;
  bool showProgress;

  AppButton(this.text, {this.onPressed, this.showProgress = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      child: RaisedButton(
        color: Colors.green,
        child: showProgress
        ? Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.black),
          ),
        )
        : Text(
          text,
          style: TextStyle(
            color: Colors.black,
            fontSize: 22,
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
