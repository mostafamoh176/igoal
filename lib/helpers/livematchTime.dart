class livematchTime {
  String status;
  StartingAt startingAt;
  int minute;
  Null second;
  Null addedTime;
  Null extraMinute;
  Null injuryTime;

  livematchTime(
      {this.status,
        this.startingAt,
        this.minute,
        this.second,
        this.addedTime,
        this.extraMinute,
        this.injuryTime});

  livematchTime.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    startingAt = json['starting_at'] != null
        ? new StartingAt.fromJson(json['starting_at'])
        : null;
    minute = json['minute'];
    second = json['second'];
    addedTime = json['added_time'];
    extraMinute = json['extra_minute'];
    injuryTime = json['injury_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.startingAt != null) {
      data['starting_at'] = this.startingAt.toJson();
    }
    data['minute'] = this.minute;
    data['second'] = this.second;
    data['added_time'] = this.addedTime;
    data['extra_minute'] = this.extraMinute;
    data['injury_time'] = this.injuryTime;
    return data;
  }
}

class StartingAt {
  String dateTime;
  String date;
  String time;
  int timestamp;
  String timezone;

  StartingAt(
      {this.dateTime, this.date, this.time, this.timestamp, this.timezone});

  StartingAt.fromJson(Map<String, dynamic> json) {
    dateTime = json['date_time'];
    date = json['date'];
    time = json['time'];
    timestamp = json['timestamp'];
    timezone = json['timezone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date_time'] = this.dateTime;
    data['date'] = this.date;
    data['time'] = this.time;
    data['timestamp'] = this.timestamp;
    data['timezone'] = this.timezone;
    return data;
  }
}
