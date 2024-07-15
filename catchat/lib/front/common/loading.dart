import 'package:flutter/material.dart';

class Loading extends StatelessWidget {
  const Loading();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 24.0),
      child: SizedBox(
        height: 30,
        child: Center(
          child: Image.asset('asset/image/loading_144.gif'),
        ),
      ),
    );
  }
}
