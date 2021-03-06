# UD DESIGN

**ud_design package helps developing responsive Flutter applications.**

Note: This package is still under development. Try not to use same value for mobile, tab and desktop or large devices. Always check for updated version.

## Usage:

### Add dependency：

Please check the latest version before installation.

```yaml
dependencies:
  flutter:
    sdk: flutter
  ud_design: ^0.0.8
```

### Add the following import to your Dart code:

```dart
import 'package:ud_design/ud_design.dart';
```

### Initialization:

You must call **UdDesign.init()** and pass **context** in a **Widget build()** function and it should be inside a **MaterialApp**, Not Before **MaterialApp**.

**Example:**

```dart
void  main() {
  runApp(MyApp());
}

class  MyApp  extends  StatelessWidget {
  @override
  Widget  build(BuildContext context) {
    return  MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Home(),
    );
  }
}

class  Home  extends  StatelessWidget {
  @override
  Widget  build(BuildContext context) {
  //Initializing UdDesign!
    UdDesign.init(context);
    return  Scaffold();
  }
}
```

## Responsiveness

- To make responsive design using point or pt values, use **UdDesign.pt()** and pass point or pt value. Larger devices or screens like laptop will use default value of Flutter. So responsiveness using **UdDesign.pt()** will work on mobile, tabs and and mini laptops.

- For responsiveness you can use **UdDesign.blocksXaxis()** by passing how much screen portion you want to use in horizontal (X) axis in the range of **0% - 100%**. You can use this method on any devices or screens based on your need.

- For responsiveness you can use **UdDesign.blocksYaxis()** by passing how much screen portion you want to use in vertical (Y) axis in the range of **0% - 100%**. You can use this method on any devices or screens based on your need.

- For responsive font size, use **UdDesign.fontSize()** and pass value. Larger devices or screens like laptop will use default value of Flutter. So responsive fonts using **UdDesign.fontSize()** will work on mobile, tabs and and mini laptops.

- To get device type use **UdDesign.deviceType** or call **UdDesign.getDeviceType()**.

- For device orientation update use **UdDesign.orientation**. Landscape orientation will change **UdDesign.deviceType** value based on screen width.

  **Check [example](https://pub.dev/packages/ud_design/example) page for code examples**

## Contributors

**Muhammad Shajedul Islam** <br>
www.shajedulislam.dev <br>
info@shajedulislam.dev

<br>

**Fatima Mostafa** <br>
the.fatimamostafa@gmail.com
