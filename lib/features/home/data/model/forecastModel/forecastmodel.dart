import '../../../domain/entity/forecastEntity.dart';

class ForecastDay extends ForecastEntity{
  final String date;
  final Day day;

  ForecastDay({
    required this.date,
    required this.day,
  }):super(
    maxTemp:day.maxtempC.toString() ,
    minTemp:day.mintempC.toString() ,
    condition:day.condition.text ,
    date:date ,
    id: day.condition.code
  );

  factory ForecastDay.fromJson(Map<String, dynamic> json){
    return ForecastDay(
      date:json["date"],
      day:Day.fromJson(json["day"]) ,
    );
  }

  static List<ForecastDay> fromJsonList(List<dynamic> jsonList) {
    return jsonList.map((json) => ForecastDay.fromJson(json)).toList();
  }

}


class Day {
  Day({
    required this.maxtempC,
    required this.maxtempF,
    required this.mintempC,
    required this.mintempF,
    required this.avgtempC,
    required this.avgtempF,
    required this.maxwindMph,
    required this.maxwindKph,
    required this.totalprecipMm,
    required this.totalprecipIn,
    required this.totalsnowCm,
    required this.avgvisKm,
    required this.avgvisMiles,
    required this.avghumidity,
    required this.dailyWillItRain,
    required this.dailyChanceOfRain,
    required this.dailyWillItSnow,
    required this.dailyChanceOfSnow,
    required this.condition,
    required this.uv,
  });

  final double maxtempC;
  final double maxtempF;
  final double mintempC;
  final double mintempF;
  final double avgtempC;
  final double avgtempF;
  final double maxwindMph;
  final double maxwindKph;
  final double totalprecipMm;
  final double totalprecipIn;
  final double totalsnowCm;
  final double avgvisKm;
  final double avgvisMiles;
  final int avghumidity;
  final int dailyWillItRain;
  final int dailyChanceOfRain;
  final int dailyWillItSnow;
  final int dailyChanceOfSnow;
  final Condition condition;
  final double uv;

  factory Day.fromJson(Map<String, dynamic> json){
    return Day(
      maxtempC: json["maxtemp_c"],
      maxtempF: json["maxtemp_f"],
      mintempC: json["mintemp_c"],
      mintempF: json["mintemp_f"],
      avgtempC: json["avgtemp_c"],
      avgtempF: json["avgtemp_f"],
      maxwindMph: json["maxwind_mph"],
      maxwindKph: json["maxwind_kph"],
      totalprecipMm: json["totalprecip_mm"],
      totalprecipIn: json["totalprecip_in"],
      totalsnowCm: json["totalsnow_cm"],
      avgvisKm: json["avgvis_km"],
      avgvisMiles: json["avgvis_miles"],
      avghumidity: json["avghumidity"],
      dailyWillItRain: json["daily_will_it_rain"],
      dailyChanceOfRain: json["daily_chance_of_rain"],
      dailyWillItSnow: json["daily_will_it_snow"],
      dailyChanceOfSnow: json["daily_chance_of_snow"],
      condition:Condition.fromJson(json["condition"]),
      uv: json["uv"],
    );
  }

}

class Condition {
  Condition({
    required this.text,
    required this.icon,
    required this.code,
  });

  final String text;
  final String icon;
  final int code;

  factory Condition.fromJson(Map<String, dynamic> json){
    return Condition(
      text: json["text"],
      icon: json["icon"],
      code: json["code"],
    );
  }


}