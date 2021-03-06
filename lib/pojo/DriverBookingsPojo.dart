// To parse this JSON data, do
//
//     final driverBookingsPojo = driverBookingsPojoFromJson(jsonString);

import 'dart:convert';

DriverBookingsPojo driverBookingsPojoFromJson(String str) => DriverBookingsPojo.fromJson(json.decode(str));

String driverBookingsPojoToJson(DriverBookingsPojo data) => json.encode(data.toJson());

class DriverBookingsPojo {
  DriverBookingsPojo({
    this.booking,
    this.message,
  });

  List<DriverBookingPojo> booking;
  String message;

  factory DriverBookingsPojo.fromJson(Map<String, dynamic> json) => DriverBookingsPojo(
    booking: List<DriverBookingPojo>.from(json["booking"].map((x) => DriverBookingPojo.fromJson(x))),
    message: json["message"],
  );

  Map<String, dynamic> toJson() => {
    "booking": List<DriverBookingPojo>.from(booking.map((x) => x.toJson())),
    "message": message,
  };
}

class DriverBookingPojo {
  DriverBookingPojo({
    this.id,
    this.bookingId,
    this.driverId,
    this.status,
    this.startJob,
    this.createdAt,
    this.updatedAt,
    this.bookings,
  });

  int id;
  int bookingId;
  int driverId;
  int status;
  int startJob;
  DateTime createdAt;
  DateTime updatedAt;
  List<JourneyBooking> bookings;

  factory DriverBookingPojo.fromJson(Map<String, dynamic> json) => DriverBookingPojo(
    id: json["id"],
    bookingId: json["booking_id"],
    driverId: json["driver_id"],
    status: json["status"],
    startJob: json["start_job"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
    bookings: List<JourneyBooking>.from(json["bookings"].map((x) => JourneyBooking.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "booking_id": bookingId,
    "driver_id": driverId,
    "status": status,
    "start_job": startJob,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
    "bookings": List<dynamic>.from(bookings.map((x) => x.toJson())),
  };
}

class JourneyBooking {
  JourneyBooking({
    this.id,
    this.userId,
    this.destinationLocation,
    this.arrivalLocation,
    this.destinationLat,
    this.destinationLong,
    this.arrivalLat,
    this.arrivalLong,
    this.date,
    this.time,
    this.isAdmin,
    this.price,
    this.status,
    this.comment,
    this.securityGuard,
    this.acceptReject,
    this.createdAt,
    this.updatedAt,
  });

  int id;
  int userId;
  String destinationLocation;
  String arrivalLocation;
  String destinationLat;
  String destinationLong;
  String arrivalLat;
  String arrivalLong;
  DateTime date;
  String time;
  int isAdmin;
  int price;
  int status;
  String comment;
  int securityGuard;
  int acceptReject;
  DateTime createdAt;
  DateTime updatedAt;

  factory JourneyBooking.fromJson(Map<String, dynamic> json) => JourneyBooking(
    id: json["id"],
    userId: json["user_id"],
    destinationLocation: json["destination_location"],
    arrivalLocation: json["arrival_location"],
    destinationLat: json["destination_lat"] == null ? null : json["destination_lat"],
    destinationLong: json["destination_long"] == null ? null : json["destination_long"],
    arrivalLat: json["arrival_lat"] == null ? null : json["arrival_lat"],
    arrivalLong: json["arrival_long"] == null ? null : json["arrival_long"],
    date: DateTime.parse(json["date"]),
    time: json["time"],
    isAdmin: json["is_admin"],
    price: json["price"],
    status: json["status"],
    comment: json["comment"],
    securityGuard: json["security_guard"],
    acceptReject: json["accept_reject"],
    createdAt: DateTime.parse(json["created_at"]),
    updatedAt: DateTime.parse(json["updated_at"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "user_id": userId,
    "destination_location": destinationLocation,
    "arrival_location": arrivalLocation,
    "destination_lat": destinationLat == null ? null : destinationLat,
    "destination_long": destinationLong == null ? null : destinationLong,
    "arrival_lat": arrivalLat == null ? null : arrivalLat,
    "arrival_long": arrivalLong == null ? null : arrivalLong,
    "date": "${date.year.toString().padLeft(4, '0')}-${date.month.toString().padLeft(2, '0')}-${date.day.toString().padLeft(2, '0')}",
    "time": time,
    "is_admin": isAdmin,
    "price": price,
    "status": status,
    "comment": comment,
    "security_guard": securityGuard,
    "accept_reject": acceptReject,
    "created_at": createdAt.toIso8601String(),
    "updated_at": updatedAt.toIso8601String(),
  };
}
