class CurrentWeatherEntity {

  final String region;

  final String country;

  final double temp;

  final String lastUpDate;

  final String condition;

  final int  id;

  final String wind_kph;

  final int humidity;

  final String dewPoint_c;

  final int cloud;

  CurrentWeatherEntity({
    required this.cloud,
    required this.country,
    required this.lastUpDate,
    required this.region,
    required this.temp,
    required this.condition,
    required this.id,
    required this.dewPoint_c,
    required this.humidity,
    required this.wind_kph
  });

}

List<int> createAiData({required double temp, required int cloud, required int humidity }){
  List<int> data=[0,0,0,0,0];
  if(temp>35 && cloud<50){
    data[0]=0;
    data[3]=1;
  }
  else{
    data[0]=1;
    data[3]=0;
  }
  if(cloud>50){
    data[1]=0;
  }
  else{
    data[1]=1;
  }
  if(temp>35){
    data[2]=1;
  }
  else{
    data[2]=0;
  }
  if(humidity>50){
    data[4]=1;
  }
  else {
    data[4]=0;
  }
  print(data);
  return data;
}