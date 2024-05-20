class RateModel {
  final dynamic id;
  final dynamic rate;

  RateModel({
    required this.id,
    required this.rate,
  });

  factory RateModel.fromJson(Map<String, dynamic> json) {
    return RateModel(
      id: json['id'] as dynamic,
      rate: json['rate'] as dynamic,
    );
  }

  
}
