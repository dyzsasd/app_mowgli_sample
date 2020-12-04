// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'autocompletion_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AutoCompletionResponse _$AutoCompletionResponseFromJson(
    Map<String, dynamic> json) {
  $checkKeys(json, requiredKeys: const ['ok']);
  return AutoCompletionResponse(
    value: json['ok'] as bool ?? false,
    results: (json['results'] as List)
        ?.map((e) => e == null
            ? null
            : AutoCompletionResult.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AutoCompletionResponseToJson(
    AutoCompletionResponse instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('ok', instance.value);
  writeNotNull('results', instance.results?.map((e) => e?.toJson())?.toList());
  return val;
}

AutoCompletionResult _$AutoCompletionResultFromJson(Map<String, dynamic> json) {
  return AutoCompletionResult(
    type: _$enumDecodeNullable(_$AutoCompletionResultTypeEnumMap, json['type']),
  )..items = (json['items'] as List)
      ?.map((e) => e == null
          ? null
          : AutoCompletionResultItem.fromJson(e as Map<String, dynamic>))
      ?.toList();
}

Map<String, dynamic> _$AutoCompletionResultToJson(
    AutoCompletionResult instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('type', _$AutoCompletionResultTypeEnumMap[instance.type]);
  writeNotNull('items', instance.items?.map((e) => e?.toJson())?.toList());
  return val;
}

T _$enumDecode<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    throw ArgumentError('A value must be provided. Supported values: '
        '${enumValues.values.join(', ')}');
  }

  final value = enumValues.entries
      .singleWhere((e) => e.value == source, orElse: () => null)
      ?.key;

  if (value == null && unknownValue == null) {
    throw ArgumentError('`$source` is not one of the supported values: '
        '${enumValues.values.join(', ')}');
  }
  return value ?? unknownValue;
}

T _$enumDecodeNullable<T>(
  Map<T, dynamic> enumValues,
  dynamic source, {
  T unknownValue,
}) {
  if (source == null) {
    return null;
  }
  return _$enumDecode<T>(enumValues, source, unknownValue: unknownValue);
}

const _$AutoCompletionResultTypeEnumMap = {
  AutoCompletionResultType.airport: 'airport',
  AutoCompletionResultType.category: 'category',
  AutoCompletionResultType.country: 'country',
  AutoCompletionResultType.city: 'city',
  AutoCompletionResultType.continent: 'continent',
};

AutoCompletionResultItem _$AutoCompletionResultItemFromJson(
    Map<String, dynamic> json) {
  return AutoCompletionResultItem(
    code: json['code'] as String,
    name: json['name'] as String,
    countryCode: json['country_code'] as String,
    countryName: json['country_name'] as String,
    order: json['order'] as int,
    airports: (json['airports'] as List)
        ?.map((e) => e == null
            ? null
            : AutoCompletionResultItem.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$AutoCompletionResultItemToJson(
    AutoCompletionResultItem instance) {
  final val = <String, dynamic>{};

  void writeNotNull(String key, dynamic value) {
    if (value != null) {
      val[key] = value;
    }
  }

  writeNotNull('code', instance.code);
  writeNotNull('name', instance.name);
  writeNotNull('country_code', instance.countryCode);
  writeNotNull('country_name', instance.countryName);
  writeNotNull('order', instance.order);
  writeNotNull(
      'airports', instance.airports?.map((e) => e?.toJson())?.toList());
  return val;
}
