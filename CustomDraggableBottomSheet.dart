

import 'package:flutter/material.dart';
bool isSwipeUp =false;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: Home(),
    );
  }
}

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SafeArea(
      child: GestureDetector(onPanEnd: (details) {
                  print(details.velocity.pixelsPerSecond.dy.toString());
                  print(details.velocity.pixelsPerSecond.dx.toString());
                  if (details.velocity.pixelsPerSecond.dy > -100) {
                    setState(() {
                      isSwipeUp = true;
                    });
                  } else {
                    setState(() {
                      isSwipeUp = false;
                    });
                  }
                },

        child: Scaffold(
          body: Container(
            color: Colors.black26,
            height: size.height,
            width: size.width,
            child: Stack(
              children: [
                MainPage(),
                AnimatedPositioned(
                  curve: Curves.decelerate,
                  duration: const Duration(milliseconds: 400),
                    top: !isSwipeUp? size.height *0.5:size.height * 0.8,
                    child: GestureDetector(
                      onPanEnd: (details) {
                  print(details.velocity.pixelsPerSecond.dy.toString());
                  print(details.velocity.pixelsPerSecond.dx.toString());
                  if (details.velocity.pixelsPerSecond.dy > -100) {
                    setState(() {
                      isSwipeUp = true;
                    });
                  } else {
                    setState(() {
                      isSwipeUp = false;
                    });
                  }
                },
                      child: CustomBottomSheet()))
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.amber,
      child: const Center(child: Text("HomePage",style: TextStyle(color: Colors.white,fontSize: 22),),),
    );
  }
}

class CustomBottomSheet extends StatefulWidget {
  const CustomBottomSheet({Key? key}) : super(key: key);

  @override
  State<CustomBottomSheet> createState() => _CustomBottomSheetState();
}

class _CustomBottomSheetState extends State<CustomBottomSheet> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height * 0.5,
      width: size.width,
      decoration: const BoxDecoration(
          gradient: LinearGradient(colors: [
            Color.fromRGBO(26, 41, 128, 100),
            Color.fromRGBO(42, 178, 252, 100),
          ]),
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(50), topRight: Radius.circular(50))),
              child: Align(alignment: Alignment.topCenter,
              child: (isSwipeUp)
                    ? Icon(
                        Icons.expand_more_outlined,
                        size: 30,
                        color: Colors.white,
                      )
                    : Icon(
                        Icons.expand_less_outlined,
                        size: 30,
                        color: Colors.white,
                      ),
              ),
    );
  }
}
