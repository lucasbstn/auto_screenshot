// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'config.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AutoScreenshotItem _$AutoScreenshotItemFromJson(Map json) => $checkedCreate(
      'AutoScreenshotItem',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const ['path', 'name', 'light_name', 'dark_name'],
        );
        final val = AutoScreenshotItem(
          path: $checkedConvert('path', (v) => v as String),
          name: $checkedConvert('name', (v) => v as String?),
          lightName: $checkedConvert('light_name', (v) => v as String?),
          darkName: $checkedConvert('dark_name', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {'lightName': 'light_name', 'darkName': 'dark_name'},
    );

Map<String, dynamic> _$AutoScreenshotItemToJson(AutoScreenshotItem instance) =>
    <String, dynamic>{
      'path': instance.path,
      'name': instance.name,
      'light_name': instance.lightName,
      'dark_name': instance.darkName,
    };

AutoScreenshotConfig _$AutoScreenshotConfigFromJson(Map json) => $checkedCreate(
      'AutoScreenshotConfig',
      json,
      ($checkedConvert) {
        $checkKeys(
          json,
          allowedKeys: const [
            'bundle_id',
            'devices',
            'base_url',
            'screenshot',
            'output_folder',
            'theme',
            'timeout',
            'sqlite_folder'
          ],
        );
        final val = AutoScreenshotConfig(
          devices: $checkedConvert('devices',
              (v) => (v as List<dynamic>).map((e) => e as String).toList()),
          baseUrl: $checkedConvert(
              'base_url', (v) => Map<String, String>.from(v as Map)),
          paths: $checkedConvert(
              'screenshot',
              (v) => (v as List<dynamic>)
                  .map((e) => AutoScreenshotItem.fromJson(e as Map))
                  .toList()),
          theme: $checkedConvert('theme', (v) => v as String? ?? 'light'),
          timeout: $checkedConvert(
              'timeout',
              (v) =>
                  AutoScreenshotConfig._durationFromJson((v as num).toInt())),
          outputFolder: $checkedConvert(
              'output_folder', (v) => v as String? ?? "auto_screenshot"),
          bundleId: $checkedConvert(
              'bundle_id', (v) => Map<String, String>.from(v as Map)),
          sqliteFolder: $checkedConvert('sqlite_folder', (v) => v as String?),
        );
        return val;
      },
      fieldKeyMap: const {
        'baseUrl': 'base_url',
        'paths': 'screenshot',
        'outputFolder': 'output_folder',
        'bundleId': 'bundle_id',
        'sqliteFolder': 'sqlite_folder'
      },
    );

Map<String, dynamic> _$AutoScreenshotConfigToJson(
        AutoScreenshotConfig instance) =>
    <String, dynamic>{
      'bundle_id': instance.bundleId,
      'devices': instance.devices,
      'base_url': instance.baseUrl,
      'screenshot': instance.paths,
      'output_folder': instance.outputFolder,
      'theme': instance.theme,
      'timeout': instance.timeout?.inMicroseconds,
      'sqlite_folder': instance.sqliteFolder,
    };
