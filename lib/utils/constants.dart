import '../models/seat.dart';

getSeatList() {
  String label = '';
  List<Seat> seats = [];
  for (int i = 1; i <= 32; i++) {
    if ((i + 1) % 8 == 0) {
      label = 'S LOWER';
    } else if (i % 8 == 0) {
      label = 'S UPPER';
    } else if ((i - 1) % 3 == 0) {
      label = 'LOWER';
    } else if ((i - 2) % 3 == 0) {
      label = 'MIDDLE';
    } else {
      label = 'UPPER';
    }
    seats.add(Seat(number: i, label: label, highlight: false));
  }
  return seats;
}

Map<String, List<Seat>> getMap(int length) {
  Map<String, List<Seat>> coachMap = {};
  for (int i = 0; i < length; i++) {
    coachMap.putIfAbsent('Coach ${i + 1}', () => getSeatList());
  }
  return coachMap;
}
