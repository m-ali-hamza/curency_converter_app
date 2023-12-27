class CurrenciesModel {
  final String code;
  final String name;

  CurrenciesModel({
    required this.code,
    required this.name,
  });

  factory CurrenciesModel.fromJson(Map<String, dynamic> json) {
    return CurrenciesModel(
      code: json['code'] ?? '',
      name: json['name'] ?? '',
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'code': code,
      'name': name,
    };
  }
}
