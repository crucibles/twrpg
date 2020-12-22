import 'package:flutter/material.dart';

class Empty extends StatefulWidget {
  State createState() => EmptyState();
}

class EmptyState extends State<Empty> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: SafeArea(
          child: LayoutBuilder(
            builder: (BuildContext context, BoxConstraints constraints) {
              return Container(
                width: constraints.maxWidth,
                height: constraints.maxHeight,
                child: Center(
                  child: Text("LOL")
                )
              );
            },
          ),
        )
    );
  }

}
