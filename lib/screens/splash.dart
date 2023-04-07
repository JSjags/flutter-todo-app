import "package:flutter/material.dart";
import "package:todo_list/screens/home.dart";

class Splash extends StatefulWidget {
  const Splash({Key? key}) : super(key: key);

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome()async {
    await Future.delayed(Duration(seconds: 2), () {});
    Navigator.push(context, MaterialPageRoute(builder: (context) => Home(),));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.deepPurple,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              child: const Icon(
                Icons.list_alt,
                color: Colors.amber,
                size: 100.0,
              ),
            ),
            Text("ToDos App", style: TextStyle(color: Colors.white, fontFamily: "TiltWarp", fontSize: 40.0),)
          ],
        )
      ),
    );
  }
}
