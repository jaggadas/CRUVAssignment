import 'package:cruv_assignment/models/seat.dart';
import 'package:cruv_assignment/utils/constants.dart';
import 'package:flutter/cupertino.dart';

class SeatSelectedProvider with ChangeNotifier {
  final Map<String, List<Seat>> _coachMap = getMap(3);

  int selectedCoachNumber = 1;
  int selectedSeatNumber = 1;

  Map get coachMap => _coachMap;
  setSeatAsSelected(int coachNumber, int seatNumber) {
    _coachMap['Coach $selectedCoachNumber']![selectedSeatNumber].highlight =
        false;
    _coachMap['Coach $coachNumber']![seatNumber].highlight = true;
    selectedCoachNumber = coachNumber;
    selectedSeatNumber = seatNumber;
    notifyListeners();
  }
}
