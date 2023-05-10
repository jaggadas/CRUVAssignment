import 'package:cruv_assignment/provider/seat_selected_provider.dart';
import 'package:cruv_assignment/widgets/search_bar.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import '../widgets/seat_widget.dart';
import '../widgets/seat_widget_inverted.dart';

class SeatFinderHome extends StatelessWidget {
  final TextEditingController seatNumberController = TextEditingController();
  final SearchBar searchBar = SearchBar();
  final itemKeys = [GlobalKey(), GlobalKey(), GlobalKey()];
  SeatFinderHome({super.key});

  bool isInit = false;
  getCoach(BuildContext context) {
    double height = MediaQuery.of(context).size.height;
    return Consumer<SeatSelectedProvider>(builder: (context, value, child) {
      if (isInit) {
        Scrollable.ensureVisible(
            itemKeys[value.selectedCoachNumber - 1].currentContext!);
      }
      isInit = true;
      return ListView.builder(
          physics: const NeverScrollableScrollPhysics(),
          itemCount: value.coachMap.length,
          shrinkWrap: true,
          itemBuilder: (context, index) {
            return Column(
              key: itemKeys[index],
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Coach ${index + 1}',
                  style:
                      GoogleFonts.breeSerif(color: Colors.white, fontSize: 25),
                ),
                SizedBox(
                  height: height / 30,
                ),
                getSection(0, value.coachMap['Coach ${index + 1}']),
                getSection(1, value.coachMap['Coach ${index + 1}']),
                getSection(2, value.coachMap['Coach ${index + 1}']),
                getSection(3, value.coachMap['Coach ${index + 1}']),
                SizedBox(
                  height: height / 15,
                )
              ],
            );
          });
    });
  }

  getSection(int number, List seats) {
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SeatWidget(seat: seats[8 * number]),
                SeatWidget(seat: seats[8 * number + 1]),
                SeatWidget(seat: seats[8 * number + 2])
              ],
            ),
            SeatWidget(seat: seats[8 * number + 6])
          ],
        ),
        const SizedBox(
          height: 20,
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                SeatWidgetInverted(seat: seats[8 * number + 3]),
                SeatWidgetInverted(seat: seats[8 * number + 4]),
                SeatWidgetInverted(seat: seats[8 * number + 5])
              ],
            ),
            SeatWidgetInverted(seat: seats[8 * number + 7])
          ],
        )
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Seat Finder',
          style: GoogleFonts.righteous(fontSize: 40),
        ),
        elevation: 0,
      ),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: SingleChildScrollView(
          child: Column(
            children: [
              searchBar,
              SizedBox(
                height: MediaQuery.of(context).size.height / 15,
              ),
              getCoach(context)
            ],
          ),
        ),
      ),
    );
  }
}
