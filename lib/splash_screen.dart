import 'package:flutter/material.dart';
import 'package:flutterprjgroup3/category_list_screen.dart';

class SplashScreen extends StatefulWidget {
  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> with TickerProviderStateMixin {
  bool _animate = false;

  @override
  void initState() {
    super.initState();

    // Start animations shortly after build
    Future.delayed(Duration(milliseconds: 300), () {
      setState(() {
        _animate = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blue.shade50,
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // Animated Logo with Opacity and scale
              AnimatedOpacity(
                duration: Duration(milliseconds: 1000),
                opacity: _animate ? 1 : 0,
                child: AnimatedScale(
                  duration: Duration(milliseconds: 1000),
                  scale: _animate ? 1 : 0.5,
                  child: Image.asset('images/logo.png', width: 120, height: 120),
                ),
              ),

              SizedBox(height: 20),

              // TITLE with AnimatedSlide + AnimatedOpacity
              AnimatedSlide(
                offset: _animate ? Offset(0, 0) : Offset(0, 0.4),
                duration: Duration(milliseconds: 1000),
                curve: Curves.easeOut,
                child: AnimatedOpacity(
                  opacity: _animate ? 1 : 0,
                  duration: Duration(milliseconds: 1000),
                  child: Column(
                    children: [
                      Text(
                        'TriSpark Gadgets',
                        style: TextStyle(
                          fontSize: 32,
                          fontWeight: FontWeight.bold,
                          color: Colors.blueAccent,
                        ),
                      ),
                      SizedBox(height: 10),
                      Text(
                        'Your one-stop electronics store!',
                        textAlign: TextAlign.center,
                        style: TextStyle(fontSize: 16, color: Colors.black54),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 50),

              // BUTTON with AnimatedOpacity + Slide
              AnimatedSlide(
                duration: Duration(milliseconds: 1000),
                offset: _animate ? Offset(0, 0) : Offset(0, 1),
                child: AnimatedOpacity(
                  duration: Duration(milliseconds: 1000),
                  opacity: _animate ? 1 : 0,
                  child: ElevatedButton(
                    onPressed: () {
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => CategoryListScreen(),
                        ),
                      );
                    },
                    style: ElevatedButton.styleFrom(
                      foregroundColor: Colors.white,
                      backgroundColor: Colors.blueAccent,
                      padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(30),
                      ),
                    ),
                    child: Text('Get Started', style: TextStyle(fontSize: 18)),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
