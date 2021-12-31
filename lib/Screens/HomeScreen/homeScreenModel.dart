
class CurrentMatchesData {
  int id;
  int leagueId;
  int seasonId;
  int stageId;
  int roundId;
  int groupId;
  int aggregateId;
  int venueId;
  int refereeId;
  int localteamId;
  int visitorteamId;
  int winnerTeamId;
  // WeatherReport weatherReport;
  bool commentaries;
  int attendance;
  String pitch;
  String details;
  bool neutralVenue;
  bool winningOddsCalculated;
  Formations formations;
  Scores scores;
  Time time;
  Coaches coaches;
  Standings standings;
  Assistants assistants;
  String leg;
  TeamColors colors;
  bool deleted;
  LocalTeam localTeam;
  LocalTeam visitorTeam;
  LocalTeam league;

  CurrentMatchesData(
      {this.id,
        this.leagueId,
        this.seasonId,
        this.stageId,
        this.roundId,
        this.groupId,
        this.aggregateId,
        this.venueId,
        this.refereeId,
        this.localteamId,
        this.visitorteamId,
        this.winnerTeamId,
        // this.weatherReport,
        this.commentaries,
        this.attendance,
        this.pitch,
        this.details,
        this.neutralVenue,
        this.winningOddsCalculated,
        this.formations,
        this.scores,
        this.time,
        this.coaches,
        this.standings,
        this.assistants,
        this.leg,
        this.colors,
        this.deleted,
        this.localTeam,
        this.visitorTeam,
        this.league});

  CurrentMatchesData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    leagueId = json['league_id'];
    seasonId = json['season_id'];
    stageId = json['stage_id'];
    roundId = json['round_id'];
    groupId = json['group_id'];
    aggregateId = json['aggregate_id'];
    venueId = json['venue_id'];
    refereeId = json['referee_id'];
    localteamId = json['localteam_id'];
    visitorteamId = json['visitorteam_id'];
    winnerTeamId = json['winner_team_id'];
    // weatherReport =  weatherReport = json['weather_report'] != null
    //     ? new WeatherReport.fromJson(json['weather_report'])
    //     : null;
    commentaries = json['commentaries'];
    attendance = json['attendance'];
    pitch = json['pitch'];
    details = json['details'];
    neutralVenue = json['neutral_venue'];
    winningOddsCalculated = json['winning_odds_calculated'];
    formations = json['formations'] != null
        ? new Formations.fromJson(json['formations'])
        : null;
    scores =
    json['scores'] != null ? new Scores.fromJson(json['scores']) : null;
    time = json['time'] != null ? new Time.fromJson(json['time']) : null;
    coaches =
    json['coaches'] != null ? new Coaches.fromJson(json['coaches']) : null;
    standings = json['standings'] != null
        ? new Standings.fromJson(json['standings'])
        : null;
    assistants = json['assistants'] != null
        ? new Assistants.fromJson(json['assistants'])
        : null;
    leg = json['leg'];
    colors =
    json['colors'] != null ? new TeamColors.fromJson(json['colors']) : null;
    deleted = json['deleted'];
    localTeam = json['localTeam'] != null
        ? new LocalTeam.fromJson(json['localTeam'])
        : null;
    visitorTeam = json['visitorTeam'] != null
        ? new LocalTeam.fromJson(json['visitorTeam'])
        : null;
    league =
    json['league'] != null ? new LocalTeam.fromJson(json['league']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['league_id'] = this.leagueId;
    data['season_id'] = this.seasonId;
    data['stage_id'] = this.stageId;
    data['round_id'] = this.roundId;
    data['group_id'] = this.groupId;
    data['aggregate_id'] = this.aggregateId;
    data['venue_id'] = this.venueId;
    data['referee_id'] = this.refereeId;
    data['localteam_id'] = this.localteamId;
    data['visitorteam_id'] = this.visitorteamId;
    data['winner_team_id'] = this.winnerTeamId;
    // if (this.weatherReport != null) {
    //   data['weather_report'] = this.weatherReport.toJson();
    // }
    data['commentaries'] = this.commentaries;
    data['attendance'] = this.attendance;
    data['pitch'] = this.pitch;
    data['details'] = this.details;
    data['neutral_venue'] = this.neutralVenue;
    data['winning_odds_calculated'] = this.winningOddsCalculated;
    if (this.formations != null) {
      data['formations'] = this.formations.toJson();
    }
    if (this.scores != null) {
      data['scores'] = this.scores.toJson();
    }
    if (this.time != null) {
      data['time'] = this.time.toJson();
    }
    if (this.coaches != null) {
      data['coaches'] = this.coaches.toJson();
    }
    if (this.standings != null) {
      data['standings'] = this.standings.toJson();
    }
    if (this.assistants != null) {
      data['assistants'] = this.assistants.toJson();
    }
    data['leg'] = this.leg;
    if (this.colors != null) {
      data['colors'] = this.colors.toJson();
    }
    data['deleted'] = this.deleted;
    if (this.localTeam != null) {
      data['localTeam'] = this.localTeam.toJson();
    }
    if (this.visitorTeam != null) {
      data['visitorTeam'] = this.visitorTeam.toJson();
    }
    if (this.league != null) {
      data['league'] = this.league.toJson();
    }
    return data;
  }
}

class Formations {
  String localteamFormation;
  String visitorteamFormation;

  Formations({this.localteamFormation, this.visitorteamFormation});

  Formations.fromJson(Map<String, dynamic> json) {
    localteamFormation = json['localteam_formation'];
    visitorteamFormation = json['visitorteam_formation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['localteam_formation'] = this.localteamFormation;
    data['visitorteam_formation'] = this.visitorteamFormation;
    return data;
  }
}

class Scores {
  int localteamScore;
  int visitorteamScore;
  int localteamPenScore;
  int visitorteamPenScore;
  String htScore;
  String ftScore;
  String etScore;
  String psScore;

  Scores(
      {this.localteamScore,
        this.visitorteamScore,
        this.localteamPenScore,
        this.visitorteamPenScore,
        this.htScore,
        this.ftScore,
        this.etScore,
        this.psScore});

  Scores.fromJson(Map<String, dynamic> json) {
    localteamScore = json['localteam_score'];
    visitorteamScore = json['visitorteam_score'];
    localteamPenScore = json['localteam_pen_score'];
    visitorteamPenScore = json['visitorteam_pen_score'];
    htScore = json['ht_score'];
    ftScore = json['ft_score'];
    etScore = json['et_score'];
    psScore = json['ps_score'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['localteam_score'] = this.localteamScore;
    data['visitorteam_score'] = this.visitorteamScore;
    data['localteam_pen_score'] = this.localteamPenScore;
    data['visitorteam_pen_score'] = this.visitorteamPenScore;
    data['ht_score'] = this.htScore;
    data['ft_score'] = this.ftScore;
    data['et_score'] = this.etScore;
    data['ps_score'] = this.psScore;
    return data;
  }
}

class Time {
  String status;
  StartingAt startingAt;
  int minute;
  String second;
  String addedTime;
  String extraMinute;
  String injuryTime;

  Time(
      {this.status,
        this.startingAt,
        this.minute,
        this.second,
        this.addedTime,
        this.extraMinute,
        this.injuryTime});

  Time.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    startingAt = json['starting_at'] != null
        ? new StartingAt.fromJson(json['starting_at'])
        : null;
    minute = json['minute'];
    second = json['second'].toString();
    addedTime = json['added_time'].toString();
    extraMinute = json['extra_minute'].toString();
    injuryTime = json['injury_time'].toString();
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

class Coaches {
  int localteamCoachId;
  int visitorteamCoachId;

  Coaches({this.localteamCoachId, this.visitorteamCoachId});

  Coaches.fromJson(Map<String, dynamic> json) {
    localteamCoachId = json['localteam_coach_id'];
    visitorteamCoachId = json['visitorteam_coach_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['localteam_coach_id'] = this.localteamCoachId;
    data['visitorteam_coach_id'] = this.visitorteamCoachId;
    return data;
  }
}

class Standings {
  int localteamPosition;
  int visitorteamPosition;

  Standings({this.localteamPosition, this.visitorteamPosition});

  Standings.fromJson(Map<String, dynamic> json) {
    localteamPosition = json['localteam_position'];
    visitorteamPosition = json['visitorteam_position'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['localteam_position'] = this.localteamPosition;
    data['visitorteam_position'] = this.visitorteamPosition;
    return data;
  }
}

class Assistants {
  int firstAssistantId;
  int secondAssistantId;
  int fourthOfficialId;

  Assistants(
      {this.firstAssistantId, this.secondAssistantId, this.fourthOfficialId});

  Assistants.fromJson(Map<String, dynamic> json) {
    firstAssistantId = json['first_assistant_id'];
    secondAssistantId = json['second_assistant_id'];
    fourthOfficialId = json['fourth_official_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['first_assistant_id'] = this.firstAssistantId;
    data['second_assistant_id'] = this.secondAssistantId;
    data['fourth_official_id'] = this.fourthOfficialId;
    return data;
  }
}

class LocalTeam {
  League data;

  LocalTeam({this.data});

  LocalTeam.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new League.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.toJson();
    }
    return data;
  }
}

class Data {
  int id;
  int legacyId;
  String name;
  String shortCode;
  String twitter;
  int countryId;
  bool nationalTeam;
  int founded;
  String logoPath;
  int venueId;
  int currentSeasonId;

  Data(
      {this.id,
        this.legacyId,
        this.name,
        this.shortCode,
        this.twitter,
        this.countryId,
        this.nationalTeam,
        this.founded,
        this.logoPath,
        this.venueId,
        this.currentSeasonId});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    legacyId = json['legacy_id'];
    name = json['name'];
    shortCode = json['short_code'];
    twitter = json['twitter'];
    countryId = json['country_id'];
    nationalTeam = json['national_team'];
    founded = json['founded'];
    logoPath = json['logo_path'];
    venueId = json['venue_id'];
    currentSeasonId = json['current_season_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['legacy_id'] = this.legacyId;
    data['name'] = this.name;
    data['short_code'] = this.shortCode;
    data['twitter'] = this.twitter;
    data['country_id'] = this.countryId;
    data['national_team'] = this.nationalTeam;
    data['founded'] = this.founded;
    data['logo_path'] = this.logoPath;
    data['venue_id'] = this.venueId;
    data['current_season_id'] = this.currentSeasonId;
    return data;
  }
}

class League {
  int id;
  bool active;
  String type;
  int legacyId;
  int countryId;
  String logoPath;
  String name;
  bool isCup;
  int currentSeasonId;
  int currentRoundId;
  int currentStageId;
  bool liveStandings;
  Coverage coverage;

  League(
      {this.id,
        this.active,
        this.type,
        this.legacyId,
        this.countryId,
        this.logoPath,
        this.name,
        this.isCup,
        this.currentSeasonId,
        this.currentRoundId,
        this.currentStageId,
        this.liveStandings,
        this.coverage});

  League.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    active = json['active'];
    type = json['type'];
    legacyId = json['legacy_id'];
    countryId = json['country_id'];
    logoPath = json['logo_path'];
    name = json['name'];
    isCup = json['is_cup'];
    currentSeasonId = json['current_season_id'];
    currentRoundId = json['current_round_id'];
    currentStageId = json['current_stage_id'];
    liveStandings = json['live_standings'];
    coverage = json['coverage'] != null
        ? new Coverage.fromJson(json['coverage'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['active'] = this.active;
    data['type'] = this.type;
    data['legacy_id'] = this.legacyId;
    data['country_id'] = this.countryId;
    data['logo_path'] = this.logoPath;
    data['name'] = this.name;
    data['is_cup'] = this.isCup;
    data['current_season_id'] = this.currentSeasonId;
    data['current_round_id'] = this.currentRoundId;
    data['current_stage_id'] = this.currentStageId;
    data['live_standings'] = this.liveStandings;
    if (this.coverage != null) {
      data['coverage'] = this.coverage.toJson();
    }
    return data;
  }
}

class Coverage {
  bool predictions;
  bool topscorerGoals;
  bool topscorerAssists;
  bool topscorerCards;

  Coverage(
      {this.predictions,
        this.topscorerGoals,
        this.topscorerAssists,
        this.topscorerCards});

  Coverage.fromJson(Map<String, dynamic> json) {
    predictions = json['predictions'];
    topscorerGoals = json['topscorer_goals'];
    topscorerAssists = json['topscorer_assists'];
    topscorerCards = json['topscorer_cards'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['predictions'] = this.predictions;
    data['topscorer_goals'] = this.topscorerGoals;
    data['topscorer_assists'] = this.topscorerAssists;
    data['topscorer_cards'] = this.topscorerCards;
    return data;
  }
}
//
// class WeatherReport {
//   String code;
//   String type;
//   String icon;
//   // Temperature temperature;
//   // Temperature temperatureCelcius;
//   String clouds;
//   String humidity;
//   double pressure;
//   // Wind wind;
//   Coordinates coordinates;
//   String updatedAt;
//
//   WeatherReport(
//       {this.code,
//         this.type,
//         this.icon,
//         // this.temperature,
//         // this.temperatureCelcius,
//         this.clouds,
//         this.humidity,
//         this.pressure,
//         // this.wind,
//         this.coordinates,
//         this.updatedAt});
//
//   WeatherReport.fromJson(Map<String, dynamic> json) {
//     code = json['code'];
//     type = json['type'];
//     icon = json['icon'];
//     // temperature = json['temperature'] != null
//     //     ? new Temperature.fromJson(json['temperature'])
//     //     : null;
//     // temperatureCelcius = json['temperature_celcius'] != null
//     //     ? new Temperature.fromJson(json['temperature_celcius'])
//     //     : null;
//     clouds = json['clouds'];
//     humidity = json['humidity'];
//     pressure = json['pressure'];
//     //
//     // wind = json['wind'] != null ? new Wind.fromJson(json['wind']) : null;
//     coordinates = json['coordinates'] != null
//         ? new Coordinates.fromJson(json['coordinates'])
//         : null;
//     updatedAt = json['updated_at'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['code'] = this.code;
//     data['type'] = this.type;
//     data['icon'] = this.icon;
//     // if (this.temperature != null) {
//     //   data['temperature'] = this.temperature.toJson();
//     // }
//     // if (this.temperatureCelcius != null) {
//     //   data['temperature_celcius'] = this.temperatureCelcius.toJson();
//     // }
//     data['clouds'] = this.clouds;
//     data['humidity'] = this.humidity;
//     data['pressure'] = this.pressure;
//     // if (this.wind != null) {
//     //   data['wind'] = this.wind.toJson();
//     // }
//     if (this.coordinates != null) {
//       data['coordinates'] = this.coordinates.toJson();
//     }
//     data['updated_at'] = this.updatedAt;
//     return data;
//   }
// }

// class Temperature {
//   double temp;
//   String unit;
//
//   Temperature({this.temp, this.unit});
//
//   Temperature.fromJson(Map<String, dynamic> json) {
//     temp = json['temp'];
//     unit = json['unit'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['temp'] = this.temp;
//     data['unit'] = this.unit;
//     return data;
//   }
// }

// class Wind {
//   String speed;
//   int degree;
//
//   Wind({this.speed, this.degree});
//
//   Wind.fromJson(Map<String, dynamic> json) {
//     speed = json['speed'];
//     degree = json['degree'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['speed'] = this.speed;
//     data['degree'] = this.degree;
//     return data;
//   }
// }

class Coordinates {
  double lat;
  double lon;

  Coordinates({this.lat, this.lon});

  Coordinates.fromJson(Map<String, dynamic> json) {
    lat = json['lat'];
    lon = json['lon'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['lat'] = this.lat;
    data['lon'] = this.lon;
    return data;
  }
}





class Autogenerated {
  Subscription subscription;
  Plan plan;
  List<Sports> sports;

  Autogenerated({this.subscription, this.plan, this.sports});

  Autogenerated.fromJson(Map<String, dynamic> json) {
    subscription = json['subscription'] != null
        ? new Subscription.fromJson(json['subscription'])
        : null;
    plan = json['plan'] != null ? new Plan.fromJson(json['plan']) : null;
    if (json['sports'] != null) {
      sports = new List<Sports>();
      json['sports'].forEach((v) {
        sports.add(new Sports.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.subscription != null) {
      data['subscription'] = this.subscription.toJson();
    }
    if (this.plan != null) {
      data['plan'] = this.plan.toJson();
    }
    if (this.sports != null) {
      data['sports'] = this.sports.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Subscription {
  StartedAt startedAt;
  String trialEndsAt;
  String endsAt;

  Subscription({this.startedAt, this.trialEndsAt, this.endsAt});

  Subscription.fromJson(Map<String, dynamic> json) {
    startedAt = json['started_at'] != null
        ? new StartedAt.fromJson(json['started_at'])
        : null;
    trialEndsAt = json['trial_ends_at'];
    endsAt = json['ends_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.startedAt != null) {
      data['started_at'] = this.startedAt.toJson();
    }
    data['trial_ends_at'] = this.trialEndsAt;
    data['ends_at'] = this.endsAt;
    return data;
  }
}

class StartedAt {
  String date;
  int timezoneType;
  String timezone;

  StartedAt({this.date, this.timezoneType, this.timezone});

  StartedAt.fromJson(Map<String, dynamic> json) {
    date = json['date'];
    timezoneType = json['timezone_type'];
    timezone = json['timezone'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['date'] = this.date;
    data['timezone_type'] = this.timezoneType;
    data['timezone'] = this.timezone;
    return data;
  }
}

class Plan {
  String name;
  String price;
  String requestLimit;

  Plan({this.name, this.price, this.requestLimit});

  Plan.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    price = json['price'];
    requestLimit = json['request_limit'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    data['price'] = this.price;
    data['request_limit'] = this.requestLimit;
    return data;
  }
}

class Sports {
  int id;
  String name;
  bool current;

  Sports({this.id, this.name, this.current});

  Sports.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    current = json['current'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['current'] = this.current;
    return data;
  }
}


class TeamColors{
  Localteam localteam;
  Localteam visitorteam;

  TeamColors({this.localteam, this.visitorteam});

  TeamColors.fromJson(Map<String, dynamic> json) {
    localteam = json['localteam'] != null
        ? new Localteam.fromJson(json['localteam'])
        : null;
    visitorteam = json['visitorteam'] != null
        ? new Localteam.fromJson(json['visitorteam'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.localteam != null) {
      data['localteam'] = this.localteam.toJson();
    }
    if (this.visitorteam != null) {
      data['visitorteam'] = this.visitorteam.toJson();
    }
    return data;
  }
}

class Localteam {
  String color;
  String kitColors;

  Localteam({this.color, this.kitColors});

  Localteam.fromJson(Map<String, dynamic> json) {
    color = json['color'];
    kitColors = json['kit_colors'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['color'] = this.color;
    data['kit_colors'] = this.kitColors;
    return data;
  }

}

class BroadCastingModel {
  List<BroadCasting> data;

  BroadCastingModel({this.data});

  BroadCastingModel.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<BroadCasting>();
      json['data'].forEach((v) {
        data.add(new BroadCasting.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.data != null) {
      data['data'] = this.data.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class BroadCasting {
  int fixtureId;
  String tvstation;

  BroadCasting({this.fixtureId, this.tvstation});

  BroadCasting.fromJson(Map<String, dynamic> json) {
    fixtureId = json['fixture_id'];
    tvstation = json['tvstation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fixture_id'] = this.fixtureId;
    data['tvstation'] = this.tvstation;
    return data;
  }
}
