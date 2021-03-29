import 'package:flutter/material.dart';

/// Classe generica para criação do botão de login
/// usada para facilitar a implementação do codigo
class AppButton extends StatelessWidget {
  final String text;
  final Function onPressed;
  final bool showProgress;

  AppButton(this.text, {this.onPressed, this.showProgress = false});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 45,
      // ignore: deprecated_member_use
      child: RaisedButton(
        color: Colors.green,
        child: showProgress
        ? Center(
          child: CircularProgressIndicator(
            valueColor: AlwaysStoppedAnimation<Color>(Colors.white),
          ),
        )
        : Text(
          text,
          style: TextStyle(
            color: Colors.white,
            fontSize: 22,
          ),
        ),
        onPressed: onPressed,
      ),
    );
  }
}
