class SeasonMatchModel {
  int position;
  int teamId;
  String teamName;
  int roundId;
  int roundName;
  int groupId;
  String groupName;
  Overall overall;
  Overall home;
  Overall away;
  Total total;
  String result;
  int points;
  String recentForm;
  String status;
  Team team;

  SeasonMatchModel(
      {this.position,
        this.teamId,
        this.teamName,
        this.roundId,
        this.roundName,
        this.groupId,
        this.groupName,
        this.overall,
        this.home,
        this.away,
        this.total,
        this.result,
        this.points,
        this.recentForm,
        this.status,
        this.team});

  SeasonMatchModel.fromJson(Map<String, dynamic> json) {
    position = json['position'];
    teamId = json['team_id'];
    teamName = json['team_name'];
    roundId = json['round_id'];
    roundName = json['round_name'];
    groupId = json['group_id'];
    groupName = json['group_name'];
    overall =
    json['overall'] != null ? new Overall.fromJson(json['overall']) : null;
    home = json['home'] != null ? new Overall.fromJson(json['home']) : null;
    away = json['away'] != null ? new Overall.fromJson(json['away']) : null;
    total = json['total'] != null ? new Total.fromJson(json['total']) : null;
    result = json['result'];
    points = json['points'];
    recentForm = json['recent_form'];
    status = json['status'];
    team = json['team'] != null ? new Team.fromJson(json['team']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['position'] = this.position;
    data['team_id'] = this.teamId;
    data['team_name'] = this.teamName;
    data['round_id'] = this.roundId;
    data['round_name'] = this.roundName;
    data['group_id'] = this.groupId;
    data['group_name'] = this.groupName;
    if (this.overall != null) {
      data['overall'] = this.overall.toJson();
    }
    if (this.home != null) {
      data['home'] = this.home.toJson();
    }
    if (this.away != null) {
      data['away'] = this.away.toJson();
    }
    if (this.total != null) {
      data['total'] = this.total.toJson();
    }
    data['result'] = this.result;
    data['points'] = this.points;
    data['recent_form'] = this.recentForm;
    data['status'] = this.status;
    if (this.team != null) {
      data['team'] = this.team.toJson();
    }
    return data;
  }
}

class Overall {
  int gamesPlayed;
  int won;
  int draw;
  int lost;
  int goalsScored;
  int goalsAgainst;

  Overall(
      {this.gamesPlayed,
        this.won,
        this.draw,
        this.lost,
        this.goalsScored,
        this.goalsAgainst});

  Overall.fromJson(Map<String, dynamic> json) {
    gamesPlayed = json['games_played'];
    won = json['won'];
    draw = json['draw'];
    lost = json['lost'];
    goalsScored = json['goals_scored'];
    goalsAgainst = json['goals_against'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['games_played'] = this.gamesPlayed;
    data['won'] = this.won;
    data['draw'] = this.draw;
    data['lost'] = this.lost;
    data['goals_scored'] = this.goalsScored;
    data['goals_against'] = this.goalsAgainst;
    return data;
  }
}

class Total {
  String goalDifference;
  int points;

  Total({this.goalDifference, this.points});

  Total.fromJson(Map<String, dynamic> json) {
    goalDifference = json['goal_difference'];
    points = json['points'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['goal_difference'] = this.goalDifference;
    data['points'] = this.points;
    return data;
  }
}

class Team {
  Data data;

  Team({this.data});

  Team.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
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
  int shortCode;
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