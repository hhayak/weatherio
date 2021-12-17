// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'forecast.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Forecast _$ForecastFromJson(Map<String, dynamic> json) => Forecast(
      json['product'] as String,
      Forecast.parseDateTime(json['init'] as String),
      (json['dataseries'] as List<dynamic>)
          .map((e) => DayForecast.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$ForecastToJson(Forecast instance) => <String, dynamic>{
      'product': instance.product,
      'init': instance.init.toIso8601String(),
      'dataseries': instance.dataseries.map((e) => e.toJson()).toList(),
    };

DayForecast _$DayForecastFromJson(Map<String, dynamic> json) => DayForecast(
      json['timepoint'] as int,
      json['cloudcover'] as int,
      json['seeing'] as int,
      json['transparency'] as int,
      json['lifted_index'] as int,
      json['rh2m'] as int,
      Wind10m.fromJson(json['wind10m'] as Map<String, dynamic>),
      json['temp2m'] as int,
      json['prec_type'] as String,
    );

Map<String, dynamic> _$DayForecastToJson(DayForecast instance) =>
    <String, dynamic>{
      'timepoint': instance.timepoint,
      'cloudcover': instance.cloudcover,
      'seeing': instance.seeing,
      'transparency': instance.transparency,
      'lifted_index': instance.lifted_index,
      'rh2m': instance.rh2m,
      'wind10m': instance.wind10m.toJson(),
      'temp2m': instance.temp2m,
      'prec_type': instance.prec_type,
    };

Temp2m _$Temp2mFromJson(Map<String, dynamic> json) => Temp2m(
      (json['max'] as num).toDouble(),
      (json['min'] as num).toDouble(),
    );

Map<String, dynamic> _$Temp2mToJson(Temp2m instance) => <String, dynamic>{
      'max': instance.max,
      'min': instance.min,
    };

Wind10m _$Wind10mFromJson(Map<String, dynamic> json) => Wind10m(
      json['direction'] as String,
      json['speed'] as int,
    );

Map<String, dynamic> _$Wind10mToJson(Wind10m instance) => <String, dynamic>{
      'direction': instance.direction,
      'speed': instance.speed,
    };
