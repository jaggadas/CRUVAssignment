import 'package:flutter/material.dart';

import '../models/seat.dart';
import '../utils/colors.dart';

class SeatWidget extends StatelessWidget {
  SeatWidget({super.key, required this.seat});
  Seat seat;
  @override
  Widget build(BuildContext context) {
    return Stack(alignment: AlignmentDirectional.topCenter, children: [
      Container(
        height: MediaQuery.of(context).size.height / 30,
        width: MediaQuery.of(context).size.height / 15,
        decoration: const BoxDecoration(
          color: kAccent2,
        ),
      ),
      Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const SizedBox(
            height: 5,
          ),
          Container(
            height: MediaQuery.of(context).size.height / 20,
            width: MediaQuery.of(context).size.height / 20,
            decoration: BoxDecoration(
                color: seat.highlight ? Colors.deepOrangeAccent : kAccent1,
                borderRadius: BorderRadius.circular(2.5)),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  '${seat.number}',
                  style: kTextStyleDefault.copyWith(color: kPrimaryGrey),
                ),
                Text(
                  seat.label,
                  style: kTextStyleDefault.copyWith(
                      color: kPrimaryGrey,
                      fontSize: seat.label.length > 7 ? 6 : 9),
                )
              ],
            ),
          ),
        ],
      )
    ]);
  }
}
