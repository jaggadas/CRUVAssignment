import 'package:cruv_assignment/provider/seat_selected_provider.dart';
import 'package:cruv_assignment/utils/colors.dart';
import 'package:cruv_assignment/utils/routes.dart';
import 'package:cruv_assignment/screens/seat_finder_screen.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SeatSelectedProvider>(
      create: (_) => SeatSelectedProvider(),
      builder: (context, _) {
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          title: 'Seat Finder',
          theme: ThemeData(
              appBarTheme: const AppBarTheme(color: kPrimaryGrey),
              scaffoldBackgroundColor: kPrimaryGrey),
          home: SeatFinderHome(),
          routes: {
            Routes.seatFinderHome: (context) => SeatFinderHome(),
          },
        );
      },
    );
  }
}
