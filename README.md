# UD DESIGN

**ud_design package helps developing responsive Flutter applications.**

Note: This package is still under development. Try not to use same value for both Mobile and Tablet devices. Do not use this package for Desktop or Web platform now. We are working on it.


## Usage:

### Add dependency：

Please check the latest version before installation.

```yaml
dependencies:
  flutter:
    sdk: flutter
  ud_design: ^0.0.3
```

### Add the following import to your Dart code:

```dart
import 'package:ud_design/ud_design.dart';
```


### Initialization:

You must call **UdDesign.init()** and pass **context** in a **Widget build** function and it should be inside **MaterialApp**, Not Before **MaterialApp**.

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

* To make responsive design using pixel values, use **UdDesign.pixel()** and pass pixel value.

* For responsiveness you can use **UdDesign.blocksXaxis()** by passing how much screen portion you want to use in horizontal (X) axis in the range of **0% - 100%**.

* For responsiveness you can use **UdDesign.blocksYaxis()** by passing how much screen portion you want to use in vertical (Y) axis in the range of **0% - 100%**.

* For responsive font size, use  **UdDesign.fontSize()** and pass value.

	**Check [example](https://pub.dev/packages/ud_design/example) page for code examples**


## Contributors

**Muhammad Shajedul Islam** <br>
www.shajedulislam.dev <br>
info@shajedulislam.dev

<br>

**Fatima Mostafa** <br>
the.fatimamostafa@gmail.com

