# UD DESIGN

**ud_design package helps developing responsive flutter applications.**

Note: This package is still under development.


## Usage:

### Add dependency：

Please check the latest version before installation.

```yaml
dependencies:
  flutter:
    sdk: flutter
  ud_design: ^0.0.1
```

### Add the following import to your Dart code:

```dart
import 'package:ud_design/ud_design.dart';
```

### Initialization:

You must call **UdDesign.init()** function and pass **context** in a **Widget build** function and it should be inside **MaterialApp**, Not Before **MaterialApp**.

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
  //Initializing UdDesign is must!
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

	**Check example page for code examples**

## Contributors

* **Muhammad Shajedul Islam**
www.shajedulislam.dev
info@shajedulislam.dev

* **Fatima Mostafa**
the.fatimamostafa@gmail.com

