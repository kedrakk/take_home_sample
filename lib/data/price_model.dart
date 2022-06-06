class Prices {
  WeightType ounce;
  WeightType gram;
  WeightType hundredGram;
  WeightType thousandGram;
  final String currentTime;
  Prices({
    required this.ounce,
    required this.gram,
    required this.hundredGram,
    required this.thousandGram,
    required this.currentTime,
  });

  factory Prices.fromJson(Map<String, dynamic> data) {
    final ounce = WeightType.fromJson(data['prices']['ounce'], "Ounce");
    final gram = WeightType.fromJson(data['prices']['gram'], "1 gram");
    final hundredGram =
        WeightType.fromJson(data['prices']['hundred_gram'], "100 grams");
    final thousandGram =
        WeightType.fromJson(data['prices']['thousand_gram'], "1000 grams");
    final currentTime = data['current_time'] as String;
    return Prices(
      ounce: ounce,
      gram: gram,
      hundredGram: hundredGram,
      thousandGram: thousandGram,
      currentTime: currentTime,
    );
  }
}

class WeightType {
  String weightName;
  double silver;
  double gold;
  double platinum;
  WeightType({
    required this.weightName,
    required this.silver,
    required this.gold,
    required this.platinum,
  });

  factory WeightType.fromJson(Map<String, dynamic> data, String key) {
    final gold = data['gold'] as double;
    final silver = data['silver'] as double;
    final platinum = data['platinum'] as double;
    return WeightType(
      weightName: key,
      silver: silver,
      gold: gold,
      platinum: platinum,
    );
  }
}
