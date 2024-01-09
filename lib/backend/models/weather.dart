class WeatherForecast {
  final String date;
  final String name;
  final String symbolValue;
  final String symbolDescription;
  final String symbolValue2;
  final String symbolDescription2;
  final String tempmin;
  final String tempmax;
  final WindForecast wind;
  final String rain;
  final String humidity;
  final String pressure;
  final String snowline;
  final String uvIndexMax;
  final SunForecast sun;
  final MoonForecast moon;
  final ForecastUnits units;
  final String localTime;
  final int localTimeOffset;
  final List<HourlyForecast> hourly;
  
  WeatherForecast({
    required this.date,
    required this.name,
    required this.symbolValue,
    required this.symbolDescription,
    required this.symbolValue2,
    required this.symbolDescription2,
    required this.tempmin,
    required this.tempmax,
    required this.wind,
    required this.rain,
    required this.humidity,
    required this.pressure,
    required this.snowline,
    required this.uvIndexMax,
    required this.sun,
    required this.moon,
    required this.units,
    required this.localTime,
    required this.localTimeOffset,
    required this.hourly,
  });

  String get dateFormatted => "${date.substring(6, 8)}/${date.substring(4, 6)}/${date.substring(0, 4)}";
  String get symbolImageUrl => "https://www.meteored.cl/css/images/svg/newSymbols/${symbolValue}n.svg";
  String get symbolImageUrl2 => "https://www.meteored.cl/css/images/svg/newSymbols/${symbolValue2}n.svg";
  String get moonSymbolImageUrl => "https://www.meteored.cl/css/2018/icons/moons/$symbolValue.svg";
  
  factory WeatherForecast.fromJson(Map<String, dynamic> json) => WeatherForecast(
    date: json['date'],
    name: json['name'],
    symbolValue: json['symbol_value'],
    symbolDescription: json['symbol_description'],
    symbolValue2: json['symbol_value2'],
    symbolDescription2: json['symbol_description2'],
    tempmin: json['tempmin'],
    tempmax: json['tempmax'],
    wind: WindForecast.fromJson(json['wind']),
    rain: json['rain'],
    humidity: json['humidity'],
    pressure: json['pressure'],
    snowline: json['snowline'],
    uvIndexMax: json['uv_index_max'],
    sun: SunForecast.fromJson(json['sun']),
    moon: MoonForecast.fromJson(json['moon']),
    units: ForecastUnits.fromJson(json['units']),
    localTime: json['local_time'],
    localTimeOffset: json['local_time_offset'],
    hourly: (json['hour'] as List<dynamic>).map((e) => HourlyForecast.fromJson(e)).toList(),
  );
}

class WindForecast {
  final String speed;
  final String symbol;
  final String symbolB;
  final String gusts;
  final String? dir;

  WindForecast({
    required this.speed,
    required this.symbol,
    required this.symbolB,
    required this.gusts,
    this.dir,
  });

  String get symbolImageUrl => "https://www.meteored.cl/css/images/newWind/$symbol.svg";

  factory WindForecast.fromJson(Map<String, dynamic> json) => WindForecast(
    speed: json['speed'],
    symbol: json['symbol'],
    symbolB: json['symbolB'],
    gusts: json['gusts'],
    dir: json['dir'],
  );
}

class SunForecast {
  final String sunrise;
  final String midday;
  final String sunset;

  SunForecast({
    required this.sunrise,
    required this.midday,
    required this.sunset,
  });

  factory SunForecast.fromJson(Map<String, dynamic> json) => SunForecast(
    sunrise: json['in'],
    midday: json['mid'],
    sunset: json['out'],
  );
}

class MoonForecast {
  final String moonrise;
  final String moonset;
  final String moonphase;
  final String moonlight;
  final String symbol;

  MoonForecast({
    required this.moonrise,
    required this.moonset,
    required this.moonphase,
    required this.moonlight,
    required this.symbol,
  });

  factory MoonForecast.fromJson(Map<String, dynamic> json) => MoonForecast(
    moonrise: json['in'],
    moonset: json['out'],
    moonphase: json['desc'],
    moonlight: json['lumi'],
    symbol: json['symbol'],
  );
}

class ForecastUnits {
  final String temp;
  final String wind;
  final String rain;
  final String pressure;
  final String snowline;

  ForecastUnits({
    required this.temp,
    required this.wind,
    required this.rain,
    required this.pressure,
    required this.snowline,
  });

  factory ForecastUnits.fromJson(Map<String, dynamic> json) => ForecastUnits(
    temp: json['temp'],
    wind: json['wind'],
    rain: json['rain'],
    pressure: json['pressure'],
    snowline: json['snowline'],
  );
}

class HourlyForecast {
  final String interval;
  final String temp;
  final String symbolValue;
  final String symbolDescription;
  final String symbolValue2;
  final String symbolDescription2;
  final WindForecast wind;
  final String rain;
  final String humidity;
  final String pressure;
  final String clouds;
  final String snowline;
  final String windchill;
  final String uvIndex;
  
  HourlyForecast({
    required this.interval,
    required this.temp,
    required this.symbolValue,
    required this.symbolDescription,
    required this.symbolValue2,
    required this.symbolDescription2,
    required this.wind,
    required this.rain,
    required this.humidity,
    required this.pressure,
    required this.clouds,
    required this.snowline,
    required this.windchill,
    required this.uvIndex,
  });
  
  factory HourlyForecast.fromJson(Map<String, dynamic> json) => HourlyForecast(
    interval: json['interval'],
    temp: json['temp'],
    symbolValue: json['symbol_value'],
    symbolDescription: json['symbol_description'],
    symbolValue2: json['symbol_value2'],
    symbolDescription2: json['symbol_description2'],
    wind: WindForecast.fromJson(json['wind']),
    rain: json['rain'],
    humidity: json['humidity'],
    pressure: json['pressure'],
    clouds: json['clouds'],
    snowline: json['snowline'],
    windchill: json['windchill'],
    uvIndex: json['uv_index'],
  );
}