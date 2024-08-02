import 'dart:convert';
import 'dart:io';

import 'package:auto_screenshot/src/exceptions.dart';
import 'package:json_annotation/json_annotation.dart';
import "package:path/path.dart" as path;
import 'package:checked_yaml/checked_yaml.dart' as yaml;

part 'config.g.dart';

class DeviceTypeString {
  DeviceTypeString._();

  static String get android => 'android';
  static String get ios => 'ios';
}

@JsonSerializable(
  anyMap: true,
  checked: true,
  disallowUnrecognizedKeys: true,
)
class AutoScreenshotItem {
  final String path;
  final String? name;

  @JsonKey(name: 'light_name')
  final String? lightName;

  @JsonKey(name: 'dark_name')
  final String? darkName;

  AutoScreenshotItem({
    required this.path,
    required this.name,
    this.lightName,
    this.darkName,
  });

  factory AutoScreenshotItem.fromJson(Map json) =>
      _$AutoScreenshotItemFromJson(json);

  Map<String, dynamic> toJson() => _$AutoScreenshotItemToJson(this);
}

@JsonSerializable(
  anyMap: true,
  checked: true,
  disallowUnrecognizedKeys: true,
)
class AutoScreenshotConfig {
  @JsonKey(name: 'bundle_id')
  final Map<String, String> bundleId;

  final List<String> devices;

  @JsonKey(name: 'base_url')
  final Map<String, String> baseUrl;

  @JsonKey(name: 'screenshot')
  final List<AutoScreenshotItem> paths;

  @JsonKey(name: 'output_folder')
  final String outputFolder;

  /// light, dark or both
  /// Default is light
  /// If both, will take screenshots for both light and dark mode
  final String theme;

  /// Timeout in seconds after navgiation and before taking the screenshot
  /// Allows for page to load, or animations to finish.
  @JsonKey(fromJson: _durationFromJson)
  final Duration? timeout;

  @JsonKey(name: 'sqlite_folder')
  final String? sqliteFolder;

  AutoScreenshotConfig({
    required this.devices,
    required this.baseUrl,
    required this.paths,
    this.theme = 'light',
    this.timeout,
    this.outputFolder = "auto_screenshot",
    required this.bundleId,
    this.sqliteFolder,
  });

  factory AutoScreenshotConfig.fromJson(Map json) =>
      _$AutoScreenshotConfigFromJson(json);

  Map<String, dynamic> toJson() => _$AutoScreenshotConfigToJson(this);

  @override
  String toString() {
    return jsonEncode(toJson());
  }

  static Duration _durationFromJson(int value) {
    return Duration(seconds: value);
  }

  static AutoScreenshotConfig? fromPubspec() {
    try {
      final file = File(pubspecFilePath);
      if (!file.existsSync()) {
        return null;
      }

      final contents = file.readAsStringSync();
      return yaml.checkedYamlDecode<AutoScreenshotConfig?>(
        contents,
        (json) {
          return json == null || json["auto_screenshot"] == null
              ? null
              : AutoScreenshotConfig.fromJson(json["auto_screenshot"]);
        },
        allowNull: true,
      );
    } on yaml.ParsedYamlException catch (e) {
      throw InvalidConfigException(e.formattedMessage ?? e.message);
    } catch (e) {
      rethrow;
    }
  }
}

final pubspecFilePath = path.join("pubspec.yaml");
