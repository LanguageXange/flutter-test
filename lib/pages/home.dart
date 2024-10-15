import 'package:flutter/material.dart';
import 'package:flutter_app/models/category_model.dart';
import 'package:flutter_svg/svg.dart';

// https://github.com/mahdinazmi/Flutter-Basics/blob/main/lib/models/category_model.dart
// `flutter pub get` after updating pubsepc.yaml

// lightbulb - extract method

// 12:42 https://www.youtube.com/watch?v=D4nhaszNW4o&t=34s

// stop at 19:10 diet section has not been implemented

class MyHomePage extends StatelessWidget {
  MyHomePage({super.key});

  List<CategoryModel> categories = [];

  void _getCategories() {
    categories = CategoryModel.getCategories();
  }

// @override
// void initState(){
//   _getCategories()
// }
  @override
  Widget build(BuildContext context) {
    _getCategories();
    return Scaffold(
        appBar: appBar(),
        backgroundColor: Colors.white,
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _searchField(),
            SizedBox(height: 40),
            _categoriesSection()
          ],
        ));
  }

  Column _categoriesSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 30),
          child: Text('Category',
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold)),
        ),
        SizedBox(height: 20),
        Container(
            height: 150,
            //color: Colors.green,
            child: ListView.separated(
                padding: EdgeInsets.only(left: 20, right: 20),
                scrollDirection: Axis.horizontal,
                itemCount: categories.length,
                separatorBuilder: (context, index) => const SizedBox(width: 10),
                itemBuilder: (context, index) {
                  return Container(
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(15),
                        color: categories[index].boxColor.withOpacity(0.5)),
                    width: 100,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          width: 50,
                          height: 50,
                          child: Padding(
                            padding: const EdgeInsets.all(8),
                            child: SvgPicture.asset(categories[index].iconPath),
                          ),
                          decoration: BoxDecoration(
                              color: Colors.white, shape: BoxShape.circle),
                        ),
                        Text(
                          categories[index].name,
                          style: TextStyle(color: Colors.black, fontSize: 16),
                        )
                      ],
                    ),
                  );
                }))
      ],
    );
  }

  Container _searchField() {
    return Container(
        margin: EdgeInsets.only(top: 40, left: 20, right: 20),
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
              blurRadius: 40,
              color: Color(0xff1d1617).withOpacity(0.15),
              spreadRadius: 0.0)
        ]),
        child: TextField(
            decoration: InputDecoration(
                fillColor: Colors.white,
                filled: true,
                hintText: 'Search ...',
                hintStyle: TextStyle(color: Color(0xffdddada), fontSize: 14),
                prefixIcon: Padding(
                    padding: const EdgeInsets.all(12),
                    child: SvgPicture.asset('assets/icons/search.svg',
                        width: 15, height: 15)),
                suffixIcon: Container(
                    width: 80,
                    child: IntrinsicHeight(
                      child: Row(
                          // need to wrap Row inside IntrinsicHeight when using vertical divider
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            VerticalDivider(
                              color: Colors.black,
                              indent: 10,
                              endIndent: 10,
                              thickness: 0.2,
                            ),
                            Padding(
                                padding: const EdgeInsets.all(12),
                                child: SvgPicture.asset(
                                    'assets/icons/filter.svg',
                                    width: 15,
                                    height: 15)),
                          ]),
                    )),
                contentPadding: EdgeInsets.all(15),
                border: OutlineInputBorder(
                    borderSide: BorderSide.none,
                    borderRadius: BorderRadius.circular(15)))));
  }

  AppBar appBar() {
    return AppBar(
      title: Text(
        'Woohoooo',
        style: TextStyle(
            color: Colors.black, fontSize: 18, fontWeight: FontWeight.bold),
      ),
      centerTitle: true,
      backgroundColor: Colors.white,
      elevation: 0.0,
      leading: Container(
          //onTap: (){},
          margin: EdgeInsets.all(10),
          alignment:
              Alignment.center, // add this otherwise width height doesn't work
          child: SvgPicture.asset('assets/icons/arrow-left.svg',
              height: 20, width: 20),
          // width: 30,
          // height: 30,
          decoration: BoxDecoration(
            // color: Colors.black,
            color: Color(0xfff7f8f8),
            borderRadius: BorderRadius.circular(10),
          )),
      actions: [
        Container(
          // onTap: (){
          //   // something here
          // },
          margin: EdgeInsets.all(10),
          alignment: Alignment.center,
          width: 30,
          child: SvgPicture.asset(
            'assets/icons/dots.svg',
            height: 20,
            width: 20,
          ),
          decoration: BoxDecoration(
            color: Color(0xfff7f8f8),
            borderRadius: BorderRadius.circular(10),
          ),
        )
      ],
    );
  }
}

// class MyHomePage extends StatefulWidget {
//   const MyHomePage({super.key, required this.title});

//   // This widget is the home page of your application. It is stateful, meaning
//   // that it has a State object (defined below) that contains fields that affect
//   // how it looks.

//   // This class is the configuration for the state. It holds the values (in this
//   // case the title) provided by the parent (in this case the App widget) and
//   // used by the build method of the State. Fields in a Widget subclass are
//   // always marked "final".

//   final String title;

//   @override
//   State<MyHomePage> createState() => _MyHomePageState();
// }

// class _MyHomePageState extends State<MyHomePage> {
//   int _counter = 0;

//   void _incrementCounter() {
//     setState(() {
//       // This call to setState tells the Flutter framework that something has
//       // changed in this State, which causes it to rerun the build method below
//       // so that the display can reflect the updated values. If we changed
//       // _counter without calling setState(), then the build method would not be
//       // called again, and so nothing would appear to happen.
//       _counter++;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     // This method is rerun every time setState is called, for instance as done
//     // by the _incrementCounter method above.
//     //
//     // The Flutter framework has been optimized to make rerunning build methods
//     // fast, so that you can just rebuild anything that needs updating rather
//     // than having to individually change instances of widgets.
//     return Scaffold(
//       appBar: AppBar(
//         // TRY THIS: Try changing the color here to a specific color (to
//         // Colors.amber, perhaps?) and trigger a hot reload to see the AppBar
//         // change color while the other colors stay the same.
//         backgroundColor: Theme.of(context).colorScheme.inversePrimary,
//         // Here we take the value from the MyHomePage object that was created by
//         // the App.build method, and use it to set our appbar title.
//         title: Text(widget.title),
//       ),
//       body: Center(
//         // Center is a layout widget. It takes a single child and positions it
//         // in the middle of the parent.
//         child: Column(
//           // Column is also a layout widget. It takes a list of children and
//           // arranges them vertically. By default, it sizes itself to fit its
//           // children horizontally, and tries to be as tall as its parent.
//           //
//           // Column has various properties to control how it sizes itself and
//           // how it positions its children. Here we use mainAxisAlignment to
//           // center the children vertically; the main axis here is the vertical
//           // axis because Columns are vertical (the cross axis would be
//           // horizontal).
//           //
//           // TRY THIS: Invoke "debug painting" (choose the "Toggle Debug Paint"
//           // action in the IDE, or press "p" in the console), to see the
//           // wireframe for each widget.
//           mainAxisAlignment: MainAxisAlignment.center,
//           children: <Widget>[
//             const Text(
//               'You have pushed the button this many times:',
//             ),
//             Text(
//               '$_counter',
//               style: Theme.of(context).textTheme.headlineMedium,
//             ),
//           ],
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _incrementCounter,
//         tooltip: 'Increment',
//         child: const Icon(Icons.add),
//       ), // This trailing comma makes auto-formatting nicer for build methods.
//     );
//   }
// }
