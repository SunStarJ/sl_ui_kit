import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';

class TestApp extends StatelessWidget {

  static const String title = 'GoRouter Example: Declarative Routes';

  @override
  Widget build(BuildContext context) {
    return   ScreenUtilInit(
      designSize: const Size(360, 690),
      minTextAdapt: true,
      splitScreenMode: true,
      builder: (ctx, child) =>
          MaterialApp.router(
            theme: ThemeData(
                primarySwatch: Colors.blue,
                primaryColor: const Color(0XFF0b8793),
                inputDecorationTheme: InputDecorationTheme(
                    contentPadding:
                    EdgeInsets.symmetric(vertical: 12.w, horizontal: 15.w),
                    focusedBorder: OutlineInputBorder(
                        borderSide: BorderSide(color: const Color(0XFF0b8793)),
                        borderRadius: BorderRadius.circular(1000)),
                    enabledBorder: OutlineInputBorder(
                        borderSide: const BorderSide(color: Colors.grey),
                        borderRadius: BorderRadius.circular(1000))),
                appBarTheme: const AppBarTheme(color: Color(0XFF0b8793)),
                textButtonTheme: TextButtonThemeData(
                    style: TextButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(1000)),
                        backgroundColor: const Color(0XFF0b8793),
                        textStyle: const TextStyle(color: Colors.white),
                        primary: Colors.white)),
                buttonTheme: ButtonThemeData(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(1000)),
                    textTheme: ButtonTextTheme.accent,
                    buttonColor: const Color(0XFF0b8793))),
            routerConfig: _router,title: "",),
    ) ;
  }

  final GoRouter _router = GoRouter(
    routes: <GoRoute>[
      GoRoute(
        path: '/',
        builder: (BuildContext context, GoRouterState state) {
          return Page1Screen();
        },
      ),
      GoRoute(
        path: '/b',
        builder: (BuildContext context, GoRouterState state) {
          return Page2Screen();
        },
      ),
    ],
  );
}

class Page1Screen extends StatelessWidget {
  /// Creates a [Page1Screen].
  const Page1Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) => Scaffold(
    appBar: AppBar(title: const Text(TestApp.title)),
    body: Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          ElevatedButton(
            onPressed: () => context.go('/b'),
            child: const Text('Go to page 2'),
          ),
        ],
      ),
    ),
  );
}

// /// The screen of the second page.
// class Page2Screen extends StatelessWidget {
//   /// Creates a [Page2Screen].
//   const Page2Screen({Key? key}) : super(key: key);
//
//   @override
//   Widget build(BuildContext context) => Scaffold(
//     appBar: AppBar(title: const Text(TestApp.title)),
//     body: Center(
//       child: Column(
//         mainAxisAlignment: MainAxisAlignment.center,
//         children: <Widget>[
//           ElevatedButton(
//             onPressed: () => context.go('/'),
//             child: const Text('Go back to home page'),
//           ),
//         ],
//       ),
//     ),
//   );
// }
class Page2Screen extends StatefulWidget {
  const Page2Screen({Key? key}) : super(key: key);

  @override
  State<Page2Screen> createState() => _Page2ScreenState();
}

class _Page2ScreenState extends State<Page2Screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text(TestApp.title)),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () => context.go('/'),
              child: const Text('Go back to home page'),
            ),
          ],
        ),
      ),
    );
  }
}

