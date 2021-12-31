class KnockoutResponse {
  List<ResponseData> responseData;

  KnockoutResponse({this.responseData});

  KnockoutResponse.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      responseData = new List<ResponseData>();
      json['data'].forEach((v) {
        responseData.add(new ResponseData.fromJson(v));
      });
    }
  }
}

class ResponseData {
  int id;
  String name;
  String type;
  int leagueId;
  int seasonId;
  int sortOrder;
  bool hasStandings;
  FixturesData fixtures;
  ResultsData results;
  LeagueData league;
  SeasonData season;

  ResponseData(
      {this.id,
      this.name,
      this.type,
      this.leagueId,
      this.seasonId,
      this.sortOrder,
      this.hasStandings,
      this.fixtures,
      this.results,
      this.league,
      this.season});

  ResponseData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    type = json['type'];
    leagueId = json['league_id'];
    seasonId = json['season_id'];
    sortOrder = json['sort_order'];
    hasStandings = json['has_standings'];
    fixtures = json['fixtures'] != null
        ? new FixturesData.fromJson(json['fixtures'])
        : null;
    results = json['results'] != null
        ? new ResultsData.fromJson(json['results'])
        : null;
    league =
        json['league'] != null ? new LeagueData.fromJson(json['league']) : null;
    season =
        json['season'] != null ? new SeasonData.fromJson(json['season']) : null;
  }
}

class FixturesData {
  List<Fixtures> fixturesData;

  FixturesData({this.fixturesData});

  FixturesData.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      fixturesData = new List<Fixtures>();
      json['data'].forEach((v) {
        fixturesData.add(new Fixtures.fromJson(v));
      });
    }
  }
}

class Fixtures {
  int localteamId;
  int visitorteamId;
  int winnerTeamId;
  Scores scores;
  Time time;
  Standings standings;
  LocalTeam localTeam;
  VisitorTeam visitorTeam;

  Fixtures(
      {this.localteamId,
      this.visitorteamId,
      this.winnerTeamId,
      this.scores,
      this.time,
      this.standings,
      this.localTeam,
      this.visitorTeam});

  Fixtures.fromJson(Map<String, dynamic> json) {
    localteamId = json['localteam_id'];
    visitorteamId = json['visitorteam_id'];
    winnerTeamId = json['winner_team_id'];
    scores =
        json['scores'] != null ? new Scores.fromJson(json['scores']) : null;
    time = json['time'] != null ? new Time.fromJson(json['time']) : null;
    standings = json['standings'] != null
        ? new Standings.fromJson(json['standings'])
        : null;
    localTeam = json['localTeam'] != null
        ? new LocalTeam.fromJson(json['localTeam'])
        : null;
    visitorTeam = json['visitorTeam'] != null
        ? new VisitorTeam.fromJson(json['visitorTeam'])
        : null;
  }
}

class Scores {
  int localteamScore;
  int visitorteamScore;
  dynamic localteamPenScore;
  dynamic visitorteamPenScore;
  String htScore;
  String ftScore;
  dynamic etScore;
  dynamic psScore;

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
}

class Time {
  String status;
  StartingAt startingAt;
  int minute;

  Time({this.status, this.startingAt, this.minute});

  Time.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    startingAt = json['starting_at'] != null
        ? new StartingAt.fromJson(json['starting_at'])
        : null;
    minute = json['minute'];
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
}

class Standings {
  int localteamPosition;
  int visitorteamPosition;

  Standings({this.localteamPosition, this.visitorteamPosition});

  Standings.fromJson(Map<String, dynamic> json) {
    localteamPosition = json['localteam_position'];
    visitorteamPosition = json['visitorteam_position'];
  }
}

class LocalTeam {
  LocalTeamData localTeamData;

  LocalTeam({this.localTeamData});

  LocalTeam.fromJson(Map<String, dynamic> json) {
    localTeamData =
        json['data'] != null ? new LocalTeamData.fromJson(json['data']) : null;
  }
}

class VisitorTeam {
  VisitorTeamData visitorTeamData;

  VisitorTeam({this.visitorTeamData});

  VisitorTeam.fromJson(Map<String, dynamic> json) {
    visitorTeamData = json['data'] != null
        ? new VisitorTeamData.fromJson(json['data'])
        : null;
  }
}

class LocalTeamData {
  String name;
  String shortCode;
  bool nationalTeam;
  String logoPath;

  LocalTeamData({this.name, this.shortCode, this.nationalTeam, this.logoPath});

  LocalTeamData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    shortCode = json['short_code'];
    nationalTeam = json['national_team'];
    logoPath = json['logo_path'];
  }
}

class VisitorTeamData {
  String name;
  String shortCode;
  bool nationalTeam;
  String logoPath;

  VisitorTeamData(
      {this.name, this.shortCode, this.nationalTeam, this.logoPath});

  VisitorTeamData.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    shortCode = json['short_code'];
    nationalTeam = json['national_team'];
    logoPath = json['logo_path'];
  }
}

class LeagueData {
  int id;
  bool active;
  String type;
  int legacyId;
  int countryId;
  String logoPath;
  String name;

  LeagueData(
      {this.id,
      this.active,
      this.type,
      this.legacyId,
      this.countryId,
      this.logoPath,
      this.name});

  LeagueData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    active = json['active'];
    type = json['type'];
    legacyId = json['legacy_id'];
    countryId = json['country_id'];
    logoPath = json['logo_path'];
    name = json['name'];
  }
}

class SeasonData {
  int id;
  String name;
  int leagueId;
  bool isCurrentSeason;
  dynamic currentRoundId;
  int currentStageId;

  SeasonData(
      {this.id,
      this.name,
      this.leagueId,
      this.isCurrentSeason,
      this.currentRoundId,
      this.currentStageId});

  SeasonData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    leagueId = json['league_id'];
    isCurrentSeason = json['is_current_season'];
    currentRoundId = json['current_round_id'];
    currentStageId = json['current_stage_id'];
  }
}

class ResultsData {
  int id;
  int leagueId;
  int seasonId;
  int stageId;
  Scores scores;
  Time time;
  Standings standings;

  ResultsData(
      {this.id,
      this.leagueId,
      this.seasonId,
      this.stageId,
      this.scores,
      this.time,
      this.standings});

  ResultsData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    leagueId = json['league_id'];
    seasonId = json['season_id'];
    stageId = json['stage_id'];
    scores =
        json['scores'] != null ? new Scores.fromJson(json['scores']) : null;
    time = json['time'] != null ? new Time.fromJson(json['time']) : null;
    standings = json['standings'] != null
        ? new Standings.fromJson(json['standings'])
        : null;
  }
}

/*



*/
