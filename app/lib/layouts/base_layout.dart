import 'package:flutter/material.dart';

class BaseLayout extends StatefulWidget {
  final List<Widget> children;
  const BaseLayout({super.key, required this.children});

  @override
  State<BaseLayout> createState() => _BaseLayoutState();
}

class _BaseLayoutState extends State<BaseLayout> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: SafeArea(
        child: SizedBox(
          height: MediaQuery.of(context).size.height,
          width: MediaQuery.of(context).size.width,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                  child: Align(
                alignment: Alignment.bottomLeft,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: 20,
                      right: 20,
                      bottom: MediaQuery.of(context).size.height * 0.2),
                  child: RichText(
                    text: TextSpan(
                      style: DefaultTextStyle.of(context).style,
                      children: const [
                        TextSpan(
                          text: 'Hello',
                          style: TextStyle(
                              fontSize: 75,
                              color: Color.fromRGBO(237, 105, 90, 1),
                              decoration: TextDecoration.none),
                        ),
                        TextSpan(
                          text: '\ncopain,',
                          style: TextStyle(
                              fontSize: 75,
                              color: Color.fromRGBO(30, 45, 67, 1),
                              decoration: TextDecoration.none),
                        ),
                      ],
                    ),
                  ),
                ),
              )),
              ...widget.children
            ],
          ),
        ),
      ),
    );
  }
}
