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

  static Prices demoPrices = Prices(
    ounce: WeightType(
        weightName: "Ounce", gold: 2399.24, silver: 31.69, platinum: 1274.518),
    gram: WeightType(
        weightName: "1 gram", gold: 77.1373, silver: 1.0189, platinum: 40.9767),
    hundredGram: WeightType(
        weightName: "100 grams",
        gold: 7713.5566,
        silver: 101.8834,
        platinum: 4097.5754),
    thousandGram: WeightType(
        weightName: "1000 grams",
        gold: 77130.7675,
        silver: 1018.8557,
        platinum: 40976.6459),
    currentTime: "2021-09-11 13:39:45 SGT",
  );
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
}
