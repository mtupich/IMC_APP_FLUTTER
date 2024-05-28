import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:hello_world_app/drawer_list.dart';
import 'package:hello_world_app/pages/hello_listview.dart';
import 'package:hello_world_app/pages/hello_page2.dart';
import 'package:hello_world_app/pages/hello_page3.dart';
import 'package:hello_world_app/widgets/blue_button.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text("Hello Maria"),
          bottom: TabBar(
            tabs: [Tab(text: "TAB 1"), Tab(text: "TAB 2"), Tab(text: "TAB 3")],
          ),
        ),
        body: TabBarView(
          children: [
            _body(context),
            Container(
              color: Colors.green,
            ),
            Container(
              color: Colors.red,
            ),
          ],
        ),
        drawer: DrawerList(),
      ),
    );
  }
}

_body(context) {
  return Container(
    color: Colors.white,
    child: Column(
      children: [
        _text(),
        _pageView(),
        _buttons(context),
      ],
    ),
  );
}

_text() {
  return const Text("Hello Maria",
      style: TextStyle(
          fontSize: 30,
          fontWeight: FontWeight.bold,
          fontStyle: FontStyle.italic,
          decoration: TextDecoration.underline,
          decorationColor: Colors.red));
}

_img(String imgName) {
  return Image.asset(
    imgName,
    // fit: BoxFit.cover,
  );
}

_button(String text, BuildContext context, VoidCallback onPressed) {
  return BlueButton(text: text, onPressed: onPressed);
}

_buttons(BuildContext context) {
  return Column(
    children: [
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          BlueButton(
              text: "ListView",
              onPressed: () =>
                  _onClickNavigator(context, const HelloListview())),
          BlueButton(
              text: "Page 2",
              onPressed: () => _onClickNavigator(context, const HelloPage2())),
          BlueButton(
              text: "Page 3",
              onPressed: () => _onClickNavigator(context, const HelloPage3())),
        ],
      ),
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          BlueButton(text: "Snack", onPressed: () => _onClickSnack(context)),
          BlueButton(text: "Dialog", onPressed: () => _onClickDialog(context)),
          BlueButton(text: "Toast", onPressed: () => _onClickToast(context)),
        ],
      ),
    ],
  );
}

Container _pageView() {
  return Container(
    margin: const EdgeInsets.all(24),
    height: 300,
    child: PageView(
      children: [
        _img("assets/images/dog1.png"),
        _img("assets/images/dog2.png"),
        _img("assets/images/dog3.png"),
        _img("assets/images/dog4.png"),
        _img("assets/images/dog5.png"),
      ],
    ),
  );
}

void _onClickNavigator(BuildContext context, Widget page) {
  Navigator.push(
    context,
    MaterialPageRoute(builder: (context) => page),
  );
}

_onClickSnack(BuildContext context) {
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
    content: Text("Teste"),
    action: SnackBarAction(
        label: "OK",
        onPressed: () {
          print("passei aqui");
        }),
    backgroundColor: Colors.grey.shade400,
  ));
}

_onClickDialog(BuildContext context) {
  showDialog(
      barrierDismissible: false,
      context: context,
      builder: (context) {
        return AlertDialog(
          title: Text("Testando"),
          actions: [
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("cancelar")),
            TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: Text("OK"))
          ],
        );
      });
}

_onClickToast(BuildContext context) {
  Fluttertoast.showToast(
      msg: "This is Center Short Toast",
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.BOTTOM,
      timeInSecForIosWeb: 1,
      backgroundColor: Colors.red,
      textColor: Colors.white,
      fontSize: 16.0);
}
