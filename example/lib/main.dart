import 'package:flutter/material.dart';
import 'package:ud_design/ud_design.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    //Initializing UdDesign!
    UdDesign.init(context);

    //Getting device type to use it on purpose
    UdDeviceType devType = UdDesign.getDeviceType();

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ud_design',
          style: TextStyle(
            color: Colors.white,
            //Setting 20 as a responsive font size
            fontSize: UdDesign.fontSize(20),
          ),
        ),
        backgroundColor: Colors.black87,
      ),
      body: SingleChildScrollView(
        padding: EdgeInsets.all(UdDesign.pixels(16)),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              //Setting 315px responsive width
              width: UdDesign.pixels(315),
              child: Text(
                //Text will be shown beased on device orientation
                UdDesign.orientation == Orientation.portrait
                    ? 'Device orientation in potrait mode'
                    : 'Device orientation changed to landscape mode and font size changed because of it',
                style: TextStyle(
                  color: Colors.black87,
                  //Setting responsive font size but will be changed based on device type
                  fontSize: UdDesign.fontSize(
                    devType == UdDeviceType.mobile ? 16 : 14,
                  ),
                ),
              ),
            ),
            SizedBox(
              //Using 10% of the screen vertically
              height: UdDesign.blocksYaxis(10),
            ),
            Container(
              //Setting 315px responsive width
              width: UdDesign.pixels(315),
              //Setting 45px responsive height
              height: UdDesign.pixels(45),
              child: RaisedButton(
                color: Colors.black87,
                child: Text(
                  'Button',
                  style: TextStyle(
                    color: Colors.white,
                    //Setting 16 as a responsive font size
                    fontSize: UdDesign.fontSize(16),
                  ),
                ),
                onPressed: () {},
              ),
            ),
            SizedBox(
              //Using 10% of the screen vertically
              height: UdDesign.blocksYaxis(10),
            ),
            Container(
              alignment: Alignment.center,
              //Using 84% of the screen horizontally
              width: UdDesign.blocksXaxis(84),
              //Using 40% of the screen horizontally
              height: UdDesign.blocksXaxis(40),
              color: Colors.black87,
              child: Text(
                'Container',
                style: TextStyle(
                  color: Colors.white,
                  //Setting 16 as a responsive font size
                  fontSize: UdDesign.fontSize(16),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
