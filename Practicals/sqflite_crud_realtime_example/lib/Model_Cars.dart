class ModelCars {

  int carModel;
  String carColor;
  int carPrice;
  int carYear;

  ModelCars({
    required this.carModel,
    required this.carColor,
    required this.carPrice,
    required this.carYear
  });

  Map<String,dynamic> carsData(){
    return {
      'carModel' : carModel,
      'carColor' : carColor,
      'carPrice' : carPrice,
      'carYear' : carYear
    };
  }
}