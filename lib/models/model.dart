class TimezoneModel {
  final String timezone;

  TimezoneModel({required this.timezone});

  factory TimezoneModel.fromJson(String json) {
    return TimezoneModel(timezone: json);
  }
}

class WorldTimeModel {
  final String timeZone;
  final String currentLocalTime;
  final int utcOffsetSeconds;

  WorldTimeModel({
    required this.timeZone,
    required this.currentLocalTime,
    required this.utcOffsetSeconds,
  });

  factory WorldTimeModel.fromJson(Map<String, dynamic> json) {
    return WorldTimeModel(
      timeZone: json['timeZone'],
      currentLocalTime: json['currentLocalTime'],
      utcOffsetSeconds: json['currentUtcOffset']['seconds'],
    );
  }
}