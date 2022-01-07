import 'package:flutter/material.dart';
import 'package:modals/modals.dart';

import 'app_router.gr.dart';

void main() => runApp(const MyApp());

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  final _appRouter = AppRouter();

  @override
  Widget build(BuildContext context) {
    return MaterialApp.router(
      routerDelegate: _appRouter.delegate(
        navigatorObservers: () => [
          RouteObserver<ModalRoute<dynamic>>(),
        ],
      ),
      routeInformationParser: _appRouter.defaultRouteParser(),
      theme: ThemeData.dark(),
      title: 'Material App',
    );
  }
}

class ModalButton extends StatefulWidget {
  const ModalButton({Key? key}) : super(key: key);

  @override
  _ModalButtonState createState() => _ModalButtonState();
}

class _ModalButtonState extends State<ModalButton> {
  String name = 'ModalName';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: GestureDetector(
          onTap: () {
            showModal(
              ModalEntry.anchored(
                context,
                tag: name,
                anchorTag: name + 'Anchor',
                anchorAlignment: Alignment.bottomCenter,
                modalAlignment: Alignment.topCenter,
                barrierDismissible: true,
                barrierColor: Colors.blue,
                removeOnPop: true,
                removeOnPushNext: true,
                child: Container(
                  height: 300,
                  width: 300,
                  color: Colors.amberAccent,
                  child: const Text('Modal'),
                ),
                offset: const Offset(0, 8),
              ),
            );
            setState(() {});
          },
          child: ModalAnchor(
            tag: name + 'Anchor',
            child: const Card(
              child: Padding(
                padding: EdgeInsets.all(8.0),
                child: Text('Press'),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
