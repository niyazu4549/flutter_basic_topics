import 'package:flutter/material.dart';
import 'package:flutter_basic_topics/button_reusable_widget.dart';
import 'package:flutter_basic_topics/camera_/camera.dart';
import 'package:flutter_basic_topics/container_widget.dart';
import 'package:flutter_basic_topics/current_date.dart';
import 'package:flutter_basic_topics/date_picker_timeline.dart';
import 'package:flutter_basic_topics/flutter_phone_call_url_launcher.dart';
import 'package:flutter_basic_topics/flutter_phone_direct_caller.dart';
import 'package:flutter_basic_topics/geolocator_example_screen.dart';
import 'package:flutter_basic_topics/geolocator_package.dart';
import 'package:flutter_basic_topics/horizontal_week_calender.dart';
import 'package:flutter_basic_topics/hovering_widget.dart';
import 'package:flutter_basic_topics/login_page.dart';
import 'package:flutter_basic_topics/login_screen_test.dart';
import 'package:flutter_basic_topics/provider_class.dart';
import 'package:flutter_basic_topics/reusable_widget_screen.dart';
import 'package:flutter_basic_topics/scrollbar_widget.dart';
import 'package:flutter_basic_topics/signature_widget_screen.dart';
import 'package:flutter_basic_topics/sized_box_widget.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import 'sample_screen_using_provider.dart';

void main() {
  runApp(
      MultiProvider(providers: [
        ChangeNotifierProvider(create: (_) => MyProvider()),
      ],
          child: const MyApp()),
      );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primarySwatch: Colors.deepPurple,
        fontFamily: GoogleFonts.lato().fontFamily,
        primaryTextTheme: GoogleFonts.latoTextTheme(),
      ),
      debugShowCheckedModeBanner: false,
      home: const HoveringWidget(),
      // initialRoute: "/",
      // routes: {
      //   "/": (context) => const LoginScreenTest(),
      //   "/homePage": (context) => HomePage(),
      //   "/loginPage": (context) => const LoginPage(),
      // },
    );
  }
}


// class HorizontalWeekCalendarPackage extends StatefulWidget {
//   const HorizontalWeekCalendarPackage({super.key});
//
//   @override
//   State<HorizontalWeekCalendarPackage> createState() =>
//       _HorizontalWeekCalendarPackageState();
// }
//
// class _HorizontalWeekCalendarPackageState
//     extends State<HorizontalWeekCalendarPackage> {
//   var selectedDate = DateTime.now();
//
//   @override
//   Widget build(BuildContext context) {
//     var theme = Theme.of(context);
//
//     return Scaffold(
//       body: SafeArea(
//         child: Column(
//           crossAxisAlignment: CrossAxisAlignment.start,
//           children: [
//             HorizontalWeekCalendar(
//               weekStartFrom: WeekStartFrom.Monday,
//               activeBackgroundColor: Colors.blue,
//               activeTextColor: Colors.white,
//               inactiveBackgroundColor: Colors.white,
//               inactiveTextColor: Colors.black,
//               disabledTextColor: Colors.black,
//               disabledBackgroundColor: Colors.white,
//               activeNavigatorColor: Colors.blue,
//               inactiveNavigatorColor: Colors.grey,
//               // monthColor: Colors.purple,
//               onDateChange: (date) {
//                 setState(() {
//                   selectedDate = date;
//                 });
//               },
//             ),
//             // Expanded(
//             //   child: Column(
//             //     mainAxisAlignment: MainAxisAlignment.center,
//             //     crossAxisAlignment: CrossAxisAlignment.center,
//             //     children: [
//             //       Text(
//             //         "Selected Date",
//             //         textAlign: TextAlign.center,
//             //         style: theme.textTheme.titleMedium!.copyWith(
//             //           color: theme.primaryColor,
//             //         ),
//             //       ),
//             //       const SizedBox(height: 3),
//             //       Text(
//             //         DateFormat('dd MMM yyyy').format(selectedDate),
//             //         textAlign: TextAlign.center,
//             //         style: theme.textTheme.titleLarge!.copyWith(
//             //           color: theme.primaryColor,
//             //         ),
//             //       ),
//             //     ],
//             //   ),
//             // ),
//           ],
//         ),
//       ),
//     );
//   }
// }


