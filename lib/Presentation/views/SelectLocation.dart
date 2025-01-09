import 'package:flutter/material.dart';
import 'package:food/themes/colors.dart';

class SelectLocation extends StatefulWidget {
  const SelectLocation({super.key});

  @override
  State<SelectLocation> createState() => _SelectLocationState();
}

class _SelectLocationState extends State<SelectLocation> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        body: Column(
          children: [
            SizedBox(
              height: 8,
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(0, 8, 160, 0),
              child: GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const SelectLocation()));
                },
                child: Container(
                  width: 40,
                  height: 40,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(
                      color: AppColors.navyBlue,
                      width: 0.8,
                    ),
                  ),
                  child: Center(
                      child: Padding(
                    padding: EdgeInsets.fromLTRB(10, 0, 5, 0),
                    child: Icon(
                      Icons.arrow_back_ios,
                      color: Colors.black,
                      size: 18,
                    ),
                  )),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(110, 30, 0, 0),
              child: RichText(
                textAlign: TextAlign.center,
                text: TextSpan(
                  text: 'Select Location',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.w600,
                    color: Colors.black,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
