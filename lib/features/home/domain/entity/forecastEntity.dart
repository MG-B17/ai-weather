class ForecastEntity {

  final String condition;

  final String date ;

  final String maxTemp;

  final String minTemp;

  final int id ;


  ForecastEntity({
    required this.condition,
    required this.date,
    required this.maxTemp,
    required this.minTemp,
    required this.id
  });

}