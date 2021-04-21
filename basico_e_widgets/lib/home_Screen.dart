import 'package:basico_e_widgets/screens/hello_listview.dart';
import 'package:basico_e_widgets/screens/hello_page1.dart';
import 'package:basico_e_widgets/screens/hello_page2.dart';
import 'package:basico_e_widgets/screens/hello_page3.dart';
import 'package:basico_e_widgets/utils/nav.dart';
import 'package:basico_e_widgets/widgets/blue_button.dart';
import 'package:flutter/material.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Hello flutter"),
      ),
      body: SingleChildScrollView(
        child: _container(context),
      ),
    );
  }

  _container(BuildContext context) {
    return Container(
      color: Colors.white,
      child: Column(
        children: [
          _text(),
          _pageView(),
          _buttons(
            context,
          ),
        ],
      ),
    );
  }

  Container _pageView() {
    return Container(
      margin: EdgeInsets.only(top: 20, bottom: 40),
      height: 300,
      child: PageView(
        children: [
          _img("1"),
          _img("2"),
          _img("3"),
          _img("4"),
          _img("5"),
        ],
      ),
    );
  }

  Text _text() {
    return Text(
      "Hello Word",
      style: TextStyle(
        fontSize: 30,
        color: Colors.blue,
        fontWeight: FontWeight.bold,
        decoration: TextDecoration.underline,
        decorationColor: Colors.red,
        decorationStyle: TextDecorationStyle.dashed,
      ),
    );
  }

  _img(String imgNumber) {
    return Image.asset(
      "assets/images/dog$imgNumber.png",
      fit: BoxFit.cover,
    );
  }

  _button(BuildContext context, String text, Function onClick) {
    return BlueButton(
      text,
      onPressed: onClick,
    );
  }

  void _onClickNavigator(BuildContext context, Widget page) async {
    String s = await push(context, page);
    print(s);
  }

  _buttons(
    BuildContext context,
  ) {
    return Column(children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          BlueButton("ListView",
              onPressed: () => _onClickNavigator(context, HelloListView())),
          BlueButton("Page 2",
              onPressed: () => _onClickNavigator(context, HelloPage2())),
          BlueButton("Page 3",
              onPressed: () => _onClickNavigator(context, HelloPage3())),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          BlueButton("Snack", onPressed: () => _onClickSnack(context)),
          BlueButton("Dialog", onPressed: () => _onClickDialog(context)),
          BlueButton("Toast", onPressed: _onClikToast),
        ],
      )
    ]);
  }

  _onClickPage2() {}

  _onClickPageView() {}

  _onClickPage3() {}

  _onClickSnack(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text("Hello SnackBar"),
      duration: Duration(seconds: 2),
    ));
  }

  _onClickDialog(BuildContext context) {
    showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => WillPopScope(
              onWillPop: () async => false,
              child: AlertDialog(
                title: Text("Hello Alert"),
                actions: [
                  FlatButton(
                    child: Text("Cancelar"),
                    onPressed: () {
                      Navigator.pop(context);
                    },
                  ),
                  FlatButton(
                    child: Text("OK"),
                    onPressed: () {},
                  ),
                ],
              ),
            ));
  }

  _onClikToast() {}
}
