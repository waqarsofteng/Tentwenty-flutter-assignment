enum SeatStatus { available, selected, booked }
enum SeatType { regular, vip }

class Seat {
  SeatStatus status;
  final SeatType type;

  Seat({required this.status, required this.type});
}