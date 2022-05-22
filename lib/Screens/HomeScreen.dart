import 'dart:async';

import 'package:flutter/material.dart';
import 'package:snakegame/Game/GameControl.dart';
import 'package:snakegame/const.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  GameControl gameControl = GameControl();
  int foodInt = 0;
  int snakeLocation = 0;
  late Timer timer;

  @override
  void initState() {
    timer = Timer.periodic(Duration(seconds: 1), ((timer) {
      setState(() {
        snakeLocation++;
      });
    }));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: backColor,
        body: Column(
          children: [
            Expanded(
              child: GestureDetector(
                onPanUpdate: ((details) {
                  if (timer.isActive) {
                    timer.cancel();
                  }
                  if (details.delta.dy > 0) {
                    timer = Timer.periodic(Duration(seconds: 1), ((timer) {
                      setState(() {
                        snakeLocation = snakeLocation + 20;
                      });
                    }));
                  } else if (details.delta.dx > 0) {
                    timer = Timer.periodic(Duration(seconds: 1), ((timer) {
                      setState(() {
                        snakeLocation++;
                      });
                    }));
                  } else if (details.delta.dx < 0) {
                    timer = Timer.periodic(Duration(seconds: 1), ((timer) {
                      setState(() {
                        snakeLocation--;
                      });
                    }));
                  } else if (details.delta.dy < 0) {
                    timer = Timer.periodic(Duration(seconds: 1), ((timer) {
                      setState(() {
                        snakeLocation = snakeLocation - 20;
                      });
                    }));
                  }
                }),
                child: GridView.builder(
                    physics: NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.all(24),
                    itemCount: 1000,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 20, crossAxisSpacing: 5),
                    itemBuilder: (context, index) {
                      return Container(
                        margin: EdgeInsets.only(top: 5),
                        decoration: BoxDecoration(
                            color:
                                index == snakeLocation ? snakeColor : gridColor,
                            borderRadius: BorderRadius.circular(2)),
                        width: 40,
                      );
                    }),
              ),
            ),
            TextButton(onPressed: () {}, child: Text("İlerle")),
            TextButton(
                onPressed: () {
                  setState(() {
                    foodInt = gameControl.foodCreater();
                  });
                },
                child: Text("Food"))
          ],
        ),
      ),
    );
  }
}
