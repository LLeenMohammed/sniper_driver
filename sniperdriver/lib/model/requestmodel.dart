class Request_model {
  final dynamic id;
  final dynamic date;
  final dynamic from;
  final dynamic lat;
  final dynamic lng;
  final dynamic status;
  final dynamic to;
  final dynamic user_id;
  final dynamic driver_id;
  final dynamic driver_name;

  Request_model({
    required this.id,
    required this.date,
    required this.from,
     required this.lat,
     required this.lng,
    required this.status,
     required this.to,
     required this.user_id,
     required this.driver_id,
     required this.driver_name,
  });

  factory Request_model.fromJson(Map<String, dynamic> json) {
    return Request_model(
      id: json['id'] as dynamic,
      date: json['date'] as dynamic,
      from: json['from'] as dynamic,
      lat: json['lat'] as dynamic,
      lng: json['lng'] as dynamic,
      status: json['status'] as dynamic,
      to: json['to'] as dynamic,
      user_id: json['user_id'] as dynamic,
      driver_id: json['driver_id'] as dynamic,
      driver_name: json['driver_name'] as dynamic,
    );
  }

  
}
