class ForecastResponseEntity {
  ForecastResponseEntity({
    this.location,
    this.current,
    this.forecast,
  });

  LocationEntity? location;
  CurrentEntity? current;
  ForecastEntity? forecast;

  List<int> getFeatures() {
    if (forecast?.forecastday == null || forecast!.forecastday!.isEmpty) {
      return [0, 0, 0, 0, 0];
    }

    final DayEntity? today = forecast!.forecastday!.first.day;
    if (today == null) return [0, 0, 0, 0, 0];

    return [
      today.condition?.text?.toLowerCase().contains("rain") == true ? 1 : 0,
      today.condition?.text?.toLowerCase().contains("sunny") == true ? 1 : 0,
      today.maxtempC != null && today.maxtempC! > 30 ? 1 : 0,
      today.maxtempC != null && (today.maxtempC! >= 20 && today.maxtempC! <= 30) ? 1 : 0,
      today.avghumidity != null && today.avghumidity! < 60 ? 1 : 0,
    ];
  }
}

class ForecastEntity {
  ForecastEntity({
    this.forecastday,
  });

  List<ForecastdayEntity>? forecastday;
}

class ForecastdayEntity {
  ForecastdayEntity({
    this.date,
    this.dateEpoch,
    this.day,
    this.astro,
    this.hour,
  });

  String? date;
  int? dateEpoch;
  DayEntity? day;
  AstroEntity? astro;
  List<HourEntity>? hour;
}

class AstroEntity {
  AstroEntity({
    this.sunrise,
    this.sunset,
    this.moonrise,
    this.moonset,
    this.moonPhase,
    this.moonIllumination,
    this.isMoonUp,
    this.isSunUp,
  });

  String? sunrise;
  String? sunset;
  String? moonrise;
  String? moonset;
  String? moonPhase;
  int? moonIllumination;
  int? isMoonUp;
  int? isSunUp;
}

class DayEntity {
  DayEntity({
    this.maxtempC,
    this.maxtempF,
    this.mintempC,
    this.mintempF,
    this.avgtempC,
    this.avgtempF,
    this.maxwindMph,
    this.maxwindKph,
    this.totalprecipMm,
    this.totalprecipIn,
    this.totalsnowCm,
    this.avgvisKm,
    this.avgvisMiles,
    this.avghumidity,
    this.dailyWillItRain,
    this.dailyChanceOfRain,
    this.dailyWillItSnow,
    this.dailyChanceOfSnow,
    this.condition,
    this.uv,
  });

  double? maxtempC;
  double? maxtempF;
  double? mintempC;
  double? mintempF;
  double? avgtempC;
  double? avgtempF;
  double? maxwindMph;
  double? maxwindKph;
  double? totalprecipMm;
  double? totalprecipIn;
  double? totalsnowCm;
  double? avgvisKm;
  double? avgvisMiles;
  int? avghumidity;
  int? dailyWillItRain;
  int? dailyChanceOfRain;
  int? dailyWillItSnow;
  int? dailyChanceOfSnow;
  ConditionEntity? condition;
  double? uv;
}

class ConditionEntity {
  ConditionEntity({
    this.text,
    this.icon,
    this.code,
  });

  String? text;
  String? icon;
  int? code;
}

class CurrentEntity {
  CurrentEntity({
    this.lastUpdatedEpoch,
    this.lastUpdated,
    this.tempC,
    this.tempF,
    this.isDay,
    this.condition,
    this.windMph,
    this.windKph,
    this.windDegree,
    this.windDir,
    this.pressureMb,
    this.pressureIn,
    this.precipMm,
    this.precipIn,
    this.humidity,
    this.cloud,
    this.feelslikeC,
    this.feelslikeF,
    this.windchillC,
    this.windchillF,
    this.heatindexC,
    this.heatindexF,
    this.dewpointC,
    this.dewpointF,
    this.visKm,
    this.visMiles,
    this.uv,
    this.gustMph,
    this.gustKph,
  });

  int? lastUpdatedEpoch;
  String? lastUpdated;
  double? tempC;
  double? tempF;
  int? isDay;
  ConditionEntity? condition;
  double? windMph;
  double? windKph;
  int? windDegree;
  String? windDir;
  double? pressureMb;
  double? pressureIn;
  double? precipMm;
  double? precipIn;
  int? humidity;
  int? cloud;
  double? feelslikeC;
  double? feelslikeF;
  double? windchillC;
  double? windchillF;
  double? heatindexC;
  double? heatindexF;
  double? dewpointC;
  double? dewpointF;
  double? visKm;
  double? visMiles;
  double? uv;
  double? gustMph;
  double? gustKph;
}

class LocationEntity {
  LocationEntity({
    this.name,
    this.region,
    this.country,
    this.lat,
    this.lon,
    this.tzId,
    this.localtimeEpoch,
    this.localtime,
  });

  String? name;
  String? region;
  String? country;
  double? lat;
  double? lon;
  String? tzId;
  int? localtimeEpoch;
  String? localtime;
}

class HourEntity {
  HourEntity({
    this.time,
    this.tempC,
    this.tempF,
  });

  String? time;
  double? tempC;
  double? tempF;
}



