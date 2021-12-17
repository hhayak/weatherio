import 'package:json_annotation/json_annotation.dart';

part 'forecast.g.dart';

@JsonSerializable(explicitToJson: true)
class Forecast {
  final String product;
  @JsonKey(fromJson: parseDateTime)
  final DateTime init;
  final List<DayForecast> dataseries;

  Forecast(this.product, this.init, this.dataseries);

  factory Forecast.fromJson(Map<String, dynamic> json) =>
      _$ForecastFromJson(json);

  /// Connect the generated [_$PersonToJson] function to the `toJson` method.
  Map<String, dynamic> toJson() => _$ForecastToJson(this);

  static DateTime parseDateTime(String s) {
    var year = int.parse(s.substring(0, 4));
    var month = int.parse(s.substring(4, 6));
    var day = int.parse(s.substring(6, 8));
    var hour = int.parse(s.substring(8));
    return DateTime(year, month, day, hour);
  }
}

@JsonSerializable(explicitToJson: true)
class DayForecast {
  final int timepoint;
  final int cloudcover;
  final int seeing;
  final int transparency;
  final int lifted_index;
  final int rh2m;
  final Wind10m wind10m;
  final int temp2m;
  final String prec_type;

  DayForecast(this.timepoint, this.cloudcover, this.seeing, this.transparency,
      this.lifted_index, this.rh2m, this.wind10m, this.temp2m, this.prec_type);

  factory DayForecast.fromJson(Map<String, dynamic> json) =>
      _$DayForecastFromJson(json);

  Map<String, dynamic> toJson() => _$DayForecastToJson(this);
}

@JsonSerializable()
class Temp2m {
  final double max;
  final double min;

  Temp2m(this.max, this.min);

  factory Temp2m.fromJson(Map<String, dynamic> json) => _$Temp2mFromJson(json);

  Map<String, dynamic> toJson() => _$Temp2mToJson(this);
}

@JsonSerializable()
class Wind10m {
  final String direction;
  final int speed;

  Wind10m(this.direction, this.speed);

  factory Wind10m.fromJson(Map<String, dynamic> json) =>
      _$Wind10mFromJson(json);

  Map<String, dynamic> toJson() => _$Wind10mToJson(this);
}
