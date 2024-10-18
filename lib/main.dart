import 'dart:ui' as ui;
import 'dart:async';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() {
  runApp( MaterialApp(
    home:  MyHomePage(),
  ));
}

class MyHomePage extends StatelessWidget {

  Future<ui.Image> _getImage() {
    Completer<ui.Image> completer =  Completer<ui.Image>();
     const NetworkImage('https://i.sstatic.net/lkd0a.png')
        .resolve( const ImageConfiguration())
        .addListener(ImageStreamListener((ImageInfo info, bool _) => completer.complete(info.image)));
    return completer.future;
  }

  Widget build(BuildContext context) {
    Image image =  Image.network('https://i.sstatic.net/lkd0a.png');
    Completer<ui.Image> completer =  Completer<ui.Image>();
    image.image.resolve(const ImageConfiguration()).addListener(
        ImageStreamListener((ImageInfo info, bool synchronousCall) {
          completer.complete(info.image);     }));
    return  Scaffold(
      appBar:  AppBar(
        title:  const Text("Image Dimensions Example"),
      ),
      body:  ListView(
        children: [
           FutureBuilder<ui.Image>(
            future: _getImage(),
            builder: (BuildContext context, AsyncSnapshot<ui.Image> snapshot) {
              if (snapshot.hasData) {
                return  Text(
                  '${snapshot.data?.width}x${snapshot.data?.height}',
                 // style: Theme.of(context).textTheme.display3,
                );
              } else {
                return  const Text('Loading...');
              }
            },
          ),
          image,
        ],
      ),
    );
  }
}

//
// To give an example, in one of my projects I had to get the resolution info of network images. To do that, you need something like this: https://stackoverflow.com/a/44683714/10380182
//
// In there, as you see, after getting the image we do a resolve process which may take time even though it's not an async process. To eliminate that blocking we simply use Completer.
//
// Also the info we need exists inside a callback, so it will be cleaner to use Completer in there. Then, we use it via FutureBuilder. You can approach different but this is very convenient way to handle.


















// import 'dart:async';
// import 'package:flutter/material.dart';
//
//
//
// void main() {
//   runApp(MyApp());
// }
// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: MyHomePage(),
//     );
//   }
// }
// class MyHomePage extends StatefulWidget {
//   @override
//   _MyHomePageState createState() => _MyHomePageState();
// }
// class _MyHomePageState extends State<MyHomePage> {
//   late Completer<void> _completer;
//   @override
//   void initState() {
//     super.initState();
//     _completer = Completer<void>();
//   }
//   void _completeTask() {
//     // Completer finishes the task
//     _completer.complete();
//   }
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("Completer Example"),
//       ),
//       body: Center(
//         child: FutureBuilder(
//           future: _completer.future,
//           builder: (context, snapshot) {
//             if (snapshot.connectionState == ConnectionState.waiting) {
//               return const CircularProgressIndicator();  // Show loading spinner
//             } else {
//               return const Text("Task Completed!");  // Show completion message
//             }
//           },
//         ),
//       ),
//       floatingActionButton: FloatingActionButton(
//         onPressed: _completeTask,  // Finish the task
//         child: const Icon(Icons.check),
//       ),
//     );
//   }
// }
//
//
// //using Future
//
// // import 'package:flutter/material.dart';
// //
// //
// // void main() {
// //   runApp(MyApp());
// // }
// // class MyApp extends StatelessWidget {
// //   @override
// //   Widget build(BuildContext context) {
// //     return MaterialApp(
// //       home: MyHomePage(),
// //     );
// //   }
// // }
// // class MyHomePage extends StatefulWidget {
// //   @override
// //   _MyHomePageState createState() => _MyHomePageState();
// // }
// // class _MyHomePageState extends State<MyHomePage> {
// //   Future<void> _delayedTask;
// //   void _startTask() {
// //     // Start a task that completes after 3 seconds
// //     _delayedTask = Future.delayed(Duration(seconds: 3));
// //     setState(() {});  // Rebuild UI to reflect the new Future
// //   }
// //   @override
// //   Widget build(BuildContext context) {
// //     return Scaffold(
// //       appBar: AppBar(
// //         title: Text("Future Example"),
// //       ),
// //       body: Center(
// //         child: FutureBuilder(
// //           future: _delayedTask,
// //           builder: (context, snapshot) {
// //             if (snapshot.connectionState == ConnectionState.waiting) {
// //               return CircularProgressIndicator();  // Show loading spinner
// //             } else {
// //               return Text("Task Completed!");  // Show completion message
// //             }
// //           },
// //         ),
// //       ),
// //       floatingActionButton: FloatingActionButton(
// //         onPressed: _startTask,  // Start the delayed task
// //         child: Icon(Icons.play_arrow),
// //       ),
// //     );
// //   }
// // }