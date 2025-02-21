import 'package:tracking_app/domain/entities/home/forecast_entity.dart';

/// location : {"name":"Qalyub","region":"Al Qalyubiyah","country":"Egypt","lat":30.183,"lon":31.205,"tz_id":"Africa/Cairo","localtime_epoch":1740096953,"localtime":"2025-02-21 02:15"}
/// current : {"last_updated_epoch":1740096900,"last_updated":"2025-02-21 02:15","temp_c":13.3,"temp_f":55.9,"is_day":0,"condition":{"text":"Clear","icon":"//cdn.weatherapi.com/weather/64x64/night/113.png","code":1000},"wind_mph":9.4,"wind_kph":15.1,"wind_degree":317,"wind_dir":"NW","pressure_mb":1020.0,"pressure_in":30.12,"precip_mm":0.0,"precip_in":0.0,"humidity":62,"cloud":0,"feelslike_c":12.0,"feelslike_f":53.5,"windchill_c":11.8,"windchill_f":53.3,"heatindex_c":13.2,"heatindex_f":55.7,"dewpoint_c":1.9,"dewpoint_f":35.4,"vis_km":10.0,"vis_miles":6.0,"uv":0.0,"gust_mph":13.8,"gust_kph":22.2}
/// forecast : {"forecastday":[{"date":"2025-02-21","date_epoch":1740096000,"day":{"maxtemp_c":15.3,"maxtemp_f":59.5,"mintemp_c":12.0,"mintemp_f":53.5,"avgtemp_c":13.5,"avgtemp_f":56.3,"maxwind_mph":12.5,"maxwind_kph":20.2,"totalprecip_mm":0.01,"totalprecip_in":0.0,"totalsnow_cm":0.0,"avgvis_km":10.0,"avgvis_miles":6.0,"avghumidity":46,"daily_will_it_rain":0,"daily_chance_of_rain":0,"daily_will_it_snow":0,"daily_chance_of_snow":0,"condition":{"text":"Cloudy ","icon":"//cdn.weatherapi.com/weather/64x64/day/119.png","code":1006},"uv":0.8},"astro":{"sunrise":"06:29 AM","sunset":"05:49 PM","moonrise":"01:06 AM","moonset":"11:11 AM","moon_phase":"Waning Crescent","moon_illumination":47,"is_moon_up":0,"is_sun_up":0},"hour":[]},{"date":"2025-02-22","date_epoch":1740182400,"day":{"maxtemp_c":17.7,"maxtemp_f":63.9,"mintemp_c":8.5,"mintemp_f":47.3,"avgtemp_c":12.6,"avgtemp_f":54.7,"maxwind_mph":18.3,"maxwind_kph":29.5,"totalprecip_mm":0.02,"totalprecip_in":0.0,"totalsnow_cm":0.0,"avgvis_km":10.0,"avgvis_miles":6.0,"avghumidity":44,"daily_will_it_rain":0,"daily_chance_of_rain":0,"daily_will_it_snow":0,"daily_chance_of_snow":0,"condition":{"text":"Partly Cloudy ","icon":"//cdn.weatherapi.com/weather/64x64/day/116.png","code":1003},"uv":0.7},"astro":{"sunrise":"06:28 AM","sunset":"05:49 PM","moonrise":"02:05 AM","moonset":"11:59 AM","moon_phase":"Waning Crescent","moon_illumination":38,"is_moon_up":0,"is_sun_up":0},"hour":[]},{"date":"2025-02-23","date_epoch":1740268800,"day":{"maxtemp_c":17.6,"maxtemp_f":63.8,"mintemp_c":7.4,"mintemp_f":45.3,"avgtemp_c":11.6,"avgtemp_f":53.0,"maxwind_mph":15.9,"maxwind_kph":25.6,"totalprecip_mm":0.0,"totalprecip_in":0.0,"totalsnow_cm":0.0,"avgvis_km":10.0,"avgvis_miles":6.0,"avghumidity":44,"daily_will_it_rain":0,"daily_chance_of_rain":0,"daily_will_it_snow":0,"daily_chance_of_snow":0,"condition":{"text":"Sunny","icon":"//cdn.weatherapi.com/weather/64x64/day/113.png","code":1000},"uv":1.2},"astro":{"sunrise":"06:27 AM","sunset":"05:50 PM","moonrise":"03:02 AM","moonset":"12:55 PM","moon_phase":"Waning Crescent","moon_illumination":28,"is_moon_up":0,"is_sun_up":0},"hour":[]}]}

class ForecastResponse extends ForecastResponseEntity{
  ForecastResponse({
      super.location,
      super.current,
      super.forecast,});

  ForecastResponse.fromJson(dynamic json) {
    location = json['location'] != null ? Location.fromJson(json['location']) : null;
    current = json['current'] != null ? Current.fromJson(json['current']) : null;
    forecast = json['forecast'] != null ? Forecast.fromJson(json['forecast']) : null;
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (location != null) {
      map['location'] = location;
    }
    if (current != null) {
      map['current'] = current;
    }
    if (forecast != null) {
      map['forecast'] = forecast;
    }
    return map;
  }

}

/// forecastday : [{"date":"2025-02-21","date_epoch":1740096000,"day":{"maxtemp_c":15.3,"maxtemp_f":59.5,"mintemp_c":12.0,"mintemp_f":53.5,"avgtemp_c":13.5,"avgtemp_f":56.3,"maxwind_mph":12.5,"maxwind_kph":20.2,"totalprecip_mm":0.01,"totalprecip_in":0.0,"totalsnow_cm":0.0,"avgvis_km":10.0,"avgvis_miles":6.0,"avghumidity":46,"daily_will_it_rain":0,"daily_chance_of_rain":0,"daily_will_it_snow":0,"daily_chance_of_snow":0,"condition":{"text":"Cloudy ","icon":"//cdn.weatherapi.com/weather/64x64/day/119.png","code":1006},"uv":0.8},"astro":{"sunrise":"06:29 AM","sunset":"05:49 PM","moonrise":"01:06 AM","moonset":"11:11 AM","moon_phase":"Waning Crescent","moon_illumination":47,"is_moon_up":0,"is_sun_up":0},"hour":[]},{"date":"2025-02-22","date_epoch":1740182400,"day":{"maxtemp_c":17.7,"maxtemp_f":63.9,"mintemp_c":8.5,"mintemp_f":47.3,"avgtemp_c":12.6,"avgtemp_f":54.7,"maxwind_mph":18.3,"maxwind_kph":29.5,"totalprecip_mm":0.02,"totalprecip_in":0.0,"totalsnow_cm":0.0,"avgvis_km":10.0,"avgvis_miles":6.0,"avghumidity":44,"daily_will_it_rain":0,"daily_chance_of_rain":0,"daily_will_it_snow":0,"daily_chance_of_snow":0,"condition":{"text":"Partly Cloudy ","icon":"//cdn.weatherapi.com/weather/64x64/day/116.png","code":1003},"uv":0.7},"astro":{"sunrise":"06:28 AM","sunset":"05:49 PM","moonrise":"02:05 AM","moonset":"11:59 AM","moon_phase":"Waning Crescent","moon_illumination":38,"is_moon_up":0,"is_sun_up":0},"hour":[]},{"date":"2025-02-23","date_epoch":1740268800,"day":{"maxtemp_c":17.6,"maxtemp_f":63.8,"mintemp_c":7.4,"mintemp_f":45.3,"avgtemp_c":11.6,"avgtemp_f":53.0,"maxwind_mph":15.9,"maxwind_kph":25.6,"totalprecip_mm":0.0,"totalprecip_in":0.0,"totalsnow_cm":0.0,"avgvis_km":10.0,"avgvis_miles":6.0,"avghumidity":44,"daily_will_it_rain":0,"daily_chance_of_rain":0,"daily_will_it_snow":0,"daily_chance_of_snow":0,"condition":{"text":"Sunny","icon":"//cdn.weatherapi.com/weather/64x64/day/113.png","code":1000},"uv":1.2},"astro":{"sunrise":"06:27 AM","sunset":"05:50 PM","moonrise":"03:02 AM","moonset":"12:55 PM","moon_phase":"Waning Crescent","moon_illumination":28,"is_moon_up":0,"is_sun_up":0},"hour":[]}]

class Forecast extends ForecastEntity {
  Forecast({
      super.forecastday,});

  Forecast.fromJson(dynamic json) {
    if (json['forecastday'] != null) {
      forecastday = [];
      json['forecastday'].forEach((v) {
        forecastday?.add(Forecastday.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    if (forecastday != null) {
      map['forecastday'] = forecastday?.toList();
    }
    return map;
  }

}

/// date : "2025-02-21"
/// date_epoch : 1740096000
/// day : {"maxtemp_c":15.3,"maxtemp_f":59.5,"mintemp_c":12.0,"mintemp_f":53.5,"avgtemp_c":13.5,"avgtemp_f":56.3,"maxwind_mph":12.5,"maxwind_kph":20.2,"totalprecip_mm":0.01,"totalprecip_in":0.0,"totalsnow_cm":0.0,"avgvis_km":10.0,"avgvis_miles":6.0,"avghumidity":46,"daily_will_it_rain":0,"daily_chance_of_rain":0,"daily_will_it_snow":0,"daily_chance_of_snow":0,"condition":{"text":"Cloudy ","icon":"//cdn.weatherapi.com/weather/64x64/day/119.png","code":1006},"uv":0.8}
/// astro : {"sunrise":"06:29 AM","sunset":"05:49 PM","moonrise":"01:06 AM","moonset":"11:11 AM","moon_phase":"Waning Crescent","moon_illumination":47,"is_moon_up":0,"is_sun_up":0}
/// hour : []

class Forecastday extends ForecastdayEntity{
  Forecastday({
      super.date,
    super.dateEpoch,
    super.day,
    super.astro,
    super.hour,});

  Forecastday.fromJson(dynamic json) {
    date = json['date'];
    dateEpoch = json['date_epoch'];
    day = json['day'] != null ? Day.fromJson(json['day']) : null;
    astro = json['astro'] != null ? Astro.fromJson(json['astro']) : null;
    if (json['hour'] != null) {
      hour = [];
      json['hour'].forEach((v) {
        hour?.add(Hour.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['date'] = date;
    map['date_epoch'] = dateEpoch;
    if (day != null) {
      map['day'] = day;
    }
    if (astro != null) {
      map['astro'] = astro;
    }
    if (hour != null) {
      map['hour'] = hour?.toList();
    }
    return map;
  }

}

/// sunrise : "06:29 AM"
/// sunset : "05:49 PM"
/// moonrise : "01:06 AM"
/// moonset : "11:11 AM"
/// moon_phase : "Waning Crescent"
/// moon_illumination : 47
/// is_moon_up : 0
/// is_sun_up : 0

class Astro extends AstroEntity {
  Astro({
    super.sunrise,
    super.sunset,
    super.moonrise,
    super.moonset,
    super.moonPhase,
    super.moonIllumination,
    super.isMoonUp,
    super.isSunUp,});

  Astro.fromJson(dynamic json) {
    sunrise = json['sunrise'];
    sunset = json['sunset'];
    moonrise = json['moonrise'];
    moonset = json['moonset'];
    moonPhase = json['moon_phase'];
    moonIllumination = json['moon_illumination'];
    isMoonUp = json['is_moon_up'];
    isSunUp = json['is_sun_up'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['sunrise'] = sunrise;
    map['sunset'] = sunset;
    map['moonrise'] = moonrise;
    map['moonset'] = moonset;
    map['moon_phase'] = moonPhase;
    map['moon_illumination'] = moonIllumination;
    map['is_moon_up'] = isMoonUp;
    map['is_sun_up'] = isSunUp;
    return map;
  }

}

/// maxtemp_c : 15.3
/// maxtemp_f : 59.5
/// mintemp_c : 12.0
/// mintemp_f : 53.5
/// avgtemp_c : 13.5
/// avgtemp_f : 56.3
/// maxwind_mph : 12.5
/// maxwind_kph : 20.2
/// totalprecip_mm : 0.01
/// totalprecip_in : 0.0
/// totalsnow_cm : 0.0
/// avgvis_km : 10.0
/// avgvis_miles : 6.0
/// avghumidity : 46
/// daily_will_it_rain : 0
/// daily_chance_of_rain : 0
/// daily_will_it_snow : 0
/// daily_chance_of_snow : 0
/// condition : {"text":"Cloudy ","icon":"//cdn.weatherapi.com/weather/64x64/day/119.png","code":1006}
/// uv : 0.8

class Day extends DayEntity{
  Day({
    super.maxtempC,
    super.maxtempF,
    super.mintempC,
    super.mintempF,
    super.avgtempC,
    super.avgtempF,
    super.maxwindMph,
    super.maxwindKph,
    super.totalprecipMm,
    super.totalprecipIn,
    super.totalsnowCm,
    super.avgvisKm,
    super.avgvisMiles,
    super.avghumidity,
    super.dailyWillItRain,
    super.dailyChanceOfRain,
    super.dailyWillItSnow,
    super.dailyChanceOfSnow,
    super.condition,
    super.uv,});

  Day.fromJson(dynamic json) {
    maxtempC = json['maxtemp_c'];
    maxtempF = json['maxtemp_f'];
    mintempC = json['mintemp_c'];
    mintempF = json['mintemp_f'];
    avgtempC = json['avgtemp_c'];
    avgtempF = json['avgtemp_f'];
    maxwindMph = json['maxwind_mph'];
    maxwindKph = json['maxwind_kph'];
    totalprecipMm = json['totalprecip_mm'];
    totalprecipIn = json['totalprecip_in'];
    totalsnowCm = json['totalsnow_cm'];
    avgvisKm = json['avgvis_km'];
    avgvisMiles = json['avgvis_miles'];
    avghumidity = json['avghumidity'];
    dailyWillItRain = json['daily_will_it_rain'];
    dailyChanceOfRain = json['daily_chance_of_rain'];
    dailyWillItSnow = json['daily_will_it_snow'];
    dailyChanceOfSnow = json['daily_chance_of_snow'];
    condition = json['condition'] != null ? Condition.fromJson(json['condition']) : null;
    uv = json['uv'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['maxtemp_c'] = maxtempC;
    map['maxtemp_f'] = maxtempF;
    map['mintemp_c'] = mintempC;
    map['mintemp_f'] = mintempF;
    map['avgtemp_c'] = avgtempC;
    map['avgtemp_f'] = avgtempF;
    map['maxwind_mph'] = maxwindMph;
    map['maxwind_kph'] = maxwindKph;
    map['totalprecip_mm'] = totalprecipMm;
    map['totalprecip_in'] = totalprecipIn;
    map['totalsnow_cm'] = totalsnowCm;
    map['avgvis_km'] = avgvisKm;
    map['avgvis_miles'] = avgvisMiles;
    map['avghumidity'] = avghumidity;
    map['daily_will_it_rain'] = dailyWillItRain;
    map['daily_chance_of_rain'] = dailyChanceOfRain;
    map['daily_will_it_snow'] = dailyWillItSnow;
    map['daily_chance_of_snow'] = dailyChanceOfSnow;
    if (condition != null) {
      map['condition'] = condition;
    }
    map['uv'] = uv;
    return map;
  }

}

/// text : "Cloudy "
/// icon : "//cdn.weatherapi.com/weather/64x64/day/119.png"
/// code : 1006

class Condition extends ConditionEntity {
  Condition({
    super.text,
    super.icon,
    super.code,});

  Condition.fromJson(dynamic json) {
    text = json['text'];
    icon = json['icon'];
    code = json['code'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['text'] = text;
    map['icon'] = icon;
    map['code'] = code;
    return map;
  }

}

/// last_updated_epoch : 1740096900
/// last_updated : "2025-02-21 02:15"
/// temp_c : 13.3
/// temp_f : 55.9
/// is_day : 0
/// condition : {"text":"Clear","icon":"//cdn.weatherapi.com/weather/64x64/night/113.png","code":1000}
/// wind_mph : 9.4
/// wind_kph : 15.1
/// wind_degree : 317
/// wind_dir : "NW"
/// pressure_mb : 1020.0
/// pressure_in : 30.12
/// precip_mm : 0.0
/// precip_in : 0.0
/// humidity : 62
/// cloud : 0
/// feelslike_c : 12.0
/// feelslike_f : 53.5
/// windchill_c : 11.8
/// windchill_f : 53.3
/// heatindex_c : 13.2
/// heatindex_f : 55.7
/// dewpoint_c : 1.9
/// dewpoint_f : 35.4
/// vis_km : 10.0
/// vis_miles : 6.0
/// uv : 0.0
/// gust_mph : 13.8
/// gust_kph : 22.2

class Current extends CurrentEntity {
  Current({
    super.lastUpdatedEpoch,
    super.lastUpdated,
    super.tempC,
    super.tempF,
    super.isDay,
    super.condition,
    super.windMph,
    super.windKph,
    super.windDegree,
    super.windDir,
    super.pressureMb,
    super.pressureIn,
    super.precipMm,
    super.precipIn,
    super.humidity,
    super.cloud,
    super.feelslikeC,
    super.feelslikeF,
    super.windchillC,
    super.windchillF,
    super.heatindexC,
    super.heatindexF,
    super.dewpointC,
    super.dewpointF,
    super.visKm,
    super.visMiles,
    super.uv,
    super.gustMph,
    super.gustKph,});

  Current.fromJson(dynamic json) {
    lastUpdatedEpoch = json['last_updated_epoch'];
    lastUpdated = json['last_updated'];
    tempC = json['temp_c'];
    tempF = json['temp_f'];
    isDay = json['is_day'];
    condition = json['condition'] != null ? Condition.fromJson(json['condition']) : null;
    windMph = json['wind_mph'];
    windKph = json['wind_kph'];
    windDegree = json['wind_degree'];
    windDir = json['wind_dir'];
    pressureMb = json['pressure_mb'];
    pressureIn = json['pressure_in'];
    precipMm = json['precip_mm'];
    precipIn = json['precip_in'];
    humidity = json['humidity'];
    cloud = json['cloud'];
    feelslikeC = json['feelslike_c'];
    feelslikeF = json['feelslike_f'];
    windchillC = json['windchill_c'];
    windchillF = json['windchill_f'];
    heatindexC = json['heatindex_c'];
    heatindexF = json['heatindex_f'];
    dewpointC = json['dewpoint_c'];
    dewpointF = json['dewpoint_f'];
    visKm = json['vis_km'];
    visMiles = json['vis_miles'];
    uv = json['uv'];
    gustMph = json['gust_mph'];
    gustKph = json['gust_kph'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['last_updated_epoch'] = lastUpdatedEpoch;
    map['last_updated'] = lastUpdated;
    map['temp_c'] = tempC;
    map['temp_f'] = tempF;
    map['is_day'] = isDay;
    if (condition != null) {
      map['condition'] = condition;
    }
    map['wind_mph'] = windMph;
    map['wind_kph'] = windKph;
    map['wind_degree'] = windDegree;
    map['wind_dir'] = windDir;
    map['pressure_mb'] = pressureMb;
    map['pressure_in'] = pressureIn;
    map['precip_mm'] = precipMm;
    map['precip_in'] = precipIn;
    map['humidity'] = humidity;
    map['cloud'] = cloud;
    map['feelslike_c'] = feelslikeC;
    map['feelslike_f'] = feelslikeF;
    map['windchill_c'] = windchillC;
    map['windchill_f'] = windchillF;
    map['heatindex_c'] = heatindexC;
    map['heatindex_f'] = heatindexF;
    map['dewpoint_c'] = dewpointC;
    map['dewpoint_f'] = dewpointF;
    map['vis_km'] = visKm;
    map['vis_miles'] = visMiles;
    map['uv'] = uv;
    map['gust_mph'] = gustMph;
    map['gust_kph'] = gustKph;
    return map;
  }

}

/// text : "Clear"
/// icon : "//cdn.weatherapi.com/weather/64x64/night/113.png"
/// code : 1000



/// name : "Qalyub"
/// region : "Al Qalyubiyah"
/// country : "Egypt"
/// lat : 30.183
/// lon : 31.205
/// tz_id : "Africa/Cairo"
/// localtime_epoch : 1740096953
/// localtime : "2025-02-21 02:15"

class Location extends LocationEntity {
  Location({
    super.name,
    super.region,
    super.country,
    super.lat,
    super.lon,
    super.tzId,
    super.localtimeEpoch,
    super.localtime,});

  Location.fromJson(dynamic json) {
    name = json['name'];
    region = json['region'];
    country = json['country'];
    lat = json['lat'];
    lon = json['lon'];
    tzId = json['tz_id'];
    localtimeEpoch = json['localtime_epoch'];
    localtime = json['localtime'];
  }


  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['name'] = name;
    map['region'] = region;
    map['country'] = country;
    map['lat'] = lat;
    map['lon'] = lon;
    map['tz_id'] = tzId;
    map['localtime_epoch'] = localtimeEpoch;
    map['localtime'] = localtime;
    return map;
  }

}

class Hour extends HourEntity {
  Hour({
    super.time,
    super.tempC,
    super.tempF,
  });

  Hour.fromJson(Map<String, dynamic> json) {
    time = json['time'];
    tempC = json['temp_c']?.toDouble();
    tempF = json['temp_f']?.toDouble();
  }


  Map<String, dynamic> toJson() => {
    'time': time,
    'temp_c': tempC,
    'temp_f': tempF,
  };
}