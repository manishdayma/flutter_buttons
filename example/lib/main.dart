import 'package:flutter_buttons/flutter_buttons.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Buttons Demo',
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
      ),
      home: const ButtonPage(),
    );
  }
}

class ButtonPage extends StatefulWidget {
  const ButtonPage({Key? key}) : super(key: key);

  @override
  State<ButtonPage> createState() => _ButtonPageState();
}

class _ButtonPageState extends State<ButtonPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Button Demo"),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisSize: MainAxisSize.min,
        children: [
          Button(
            borderRadius: 10,
            bgColor: Colors.blueAccent,
            margin: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 20,
            ),
            onPressed: () {
              showSnack(context, "I am button Pressed");
            },
            child: const Text("I am Button"),
          ),
          Button(
            borderRadius: 0,
            bgColor: Colors.blueAccent,
            margin: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 20,
            ),
            onPressed: () {
              showSnack(context, "I am button Pressed");
            },
            child: const Text("I am Button without radius"),
          ),
          BorderButton(
            borderRadius: 10,
            borderColor: Colors.blueAccent,
            margin: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 20,
            ),
            onPressed: () {
              showSnack(context, "I am border button Pressed");
            },
            child: const Text("I am Border Button"),
          ),
          BorderButton(
            borderRadius: 0,
            borderColor: Colors.blueAccent,
            margin: const EdgeInsets.symmetric(
              horizontal: 10,
              vertical: 20,
            ),
            onPressed: () {
              showSnack(context, "I am border button Pressed");
            },
            child: const Text("I am Border Button without radius"),
          ),
          const SizedBox(height: 20),
          Center(
            child: SliderButton(
              buttonColor: Colors.blueGrey,
              alignLabel: Alignment.center,
              action: () {
                ///Do something here
                showSnack(context, "Slider button action triggered");
              },
              label: const Text(
                "Slide to Right",
                style: TextStyle(
                  color: Color(0xff4a4a4a),
                  fontWeight: FontWeight.w500,
                  fontSize: 17,
                ),
              ),
              icon: const Text(
                "x",
                style: TextStyle(
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                  fontSize: 44,
                ),
              ),
            ),
          ),
          const SizedBox(height: 20),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RoundedIconButton(
                borderColor: Colors.red,
                borderWidth: 3,
                child: const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Icon(
                    Icons.message,
                    size: 30.0,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  showSnack(context, "Rounded Icon border button Pressed");
                },
              ),
              RoundedIconButton(
                borderColor: Colors.red,
                bgColor: Colors.red,
                borderWidth: 0,
                child: const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Icon(
                    Icons.home,
                    size: 30.0,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  showSnack(context, "Rounded Icon border button Pressed");
                },
              ),
              RoundedIconButton(
                borderColor: Colors.red,
                bgColor: Colors.red,
                borderWidth: 0,
                child: const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Text(
                    "H",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
                onPressed: () {
                  showSnack(context, "Rounded Icon border button Pressed");
                },
              ),
            ],
          ),
          const SizedBox(height: 30),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              RectIconButton(
                borderColor: Colors.red,
                borderWidth: 3,
                child: const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Icon(
                    Icons.message,
                    size: 30.0,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  showSnack(context, "Rectangle Icon border button Pressed");
                },
              ),
              RectIconButton(
                borderColor: Colors.red,
                borderWidth: 0,
                bgColor: Colors.red,
                child: const Padding(
                  padding: EdgeInsets.all(15.0),
                  child: Icon(
                    Icons.home,
                    size: 30.0,
                    color: Colors.white,
                  ),
                ),
                onPressed: () {
                  showSnack(context, "Rectangle Icon border button Pressed");
                },
              ),
              RectIconButton(
                borderColor: Colors.red,
                borderWidth: 0,
                bgColor: Colors.amber,
                child: const Padding(
                  padding: EdgeInsets.symmetric(
                    vertical: 10,
                    horizontal: 15,
                  ),
                  child: Text(
                    "H",
                    style: TextStyle(
                      fontSize: 30,
                      color: Colors.white,
                    ),
                  ),
                ),
                onPressed: () {
                  showSnack(context, "Rectangle Icon border button Pressed");
                },
              ),
            ],
          )
        ],
      ),
    );
  }

  showSnack(context, text) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(text),
        backgroundColor: Colors.blue,
        duration: const Duration(milliseconds: 500),
      ),
    );
  }
}
