class Seat {
  int number;
  String label;
  bool highlight;

  @override
  String toString() {
    return 'Seat{number: $number, label: $label, highlight: $highlight}';
  }

  Seat({required this.number, required this.label, required this.highlight});
}
