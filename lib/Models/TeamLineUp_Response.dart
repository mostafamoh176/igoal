class TeamLineUpResponse {
  Data data;

  TeamLineUpResponse({this.data});

  TeamLineUpResponse.fromJson(Map<String, dynamic> json) {
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }
}

class Data {
  int id;
  int leagueId;
  int seasonId;
  int stageId;
  int roundId;
  int venueId;
  int refereeId;
  int localteamId;
  int visitorteamId;
  int winnerTeamId;
  Formations formations;
  Scores scores;
  String leg;
  bool deleted;
  bool isPlaceholder;
  LocalTeamData localTeam;
  VisitorTeamData visitorTeam;
  Lineup lineup;

  Data(
      {this.id,
      this.leagueId,
      this.seasonId,
      this.stageId,
      this.roundId,
      this.venueId,
      this.refereeId,
      this.localteamId,
      this.visitorteamId,
      this.winnerTeamId,
      this.formations,
      this.scores,
      this.leg,
      this.deleted,
      this.isPlaceholder,
      this.localTeam,
      this.visitorTeam,
      this.lineup});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    leagueId = json['league_id'];
    seasonId = json['season_id'];
    stageId = json['stage_id'];
    roundId = json['round_id'];
    venueId = json['venue_id'];
    refereeId = json['referee_id'];
    localteamId = json['localteam_id'];
    visitorteamId = json['visitorteam_id'];
    winnerTeamId = json['winner_team_id'];
    formations = json['formations'] != null
        ? new Formations.fromJson(json['formations'])
        : null;
    scores =
        json['scores'] != null ? new Scores.fromJson(json['scores']) : null;
    leg = json['leg'];
    deleted = json['deleted'];
    isPlaceholder = json['is_placeholder'];
    localTeam = json['localTeam'] != null
        ? new LocalTeamData.fromJson(json['localTeam'])
        : null;
    visitorTeam = json['visitorTeam'] != null
        ? new VisitorTeamData.fromJson(json['visitorTeam'])
        : null;
    lineup =
        json['lineup'] != null ? new Lineup.fromJson(json['lineup']) : null;
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
}

class Scores {
  int localteamScore;
  int visitorteamScore;
  String htScore;
  String ftScore;

  Scores({
    this.localteamScore,
    this.visitorteamScore,
    this.htScore,
    this.ftScore,
  });

  Scores.fromJson(Map<String, dynamic> json) {
    localteamScore = json['localteam_score'];
    visitorteamScore = json['visitorteam_score'];
    htScore = json['ht_score'];
    ftScore = json['ft_score'];
  }
}

class LocalTeamData {
  Local localTeamData;

  LocalTeamData({this.localTeamData});

  LocalTeamData.fromJson(Map<String, dynamic> json) {
    localTeamData =
        json['data'] != null ? new Local.fromJson(json['data']) : null;
  }
}

class VisitorTeamData {
  Visitor visitorData;

  VisitorTeamData({this.visitorData});

  VisitorTeamData.fromJson(Map<String, dynamic> json) {
    visitorData =
        json['data'] != null ? new Visitor.fromJson(json['data']) : null;
  }
}

class PlayerInfo {
  PlayerData playerData;

  PlayerInfo({this.playerData});

  PlayerInfo.fromJson(Map<String, dynamic> json) {
    playerData =
    json['data'] != null ? new PlayerData.fromJson(json['data']) : null;
  }
}

class Local {
  int id;
  int legacyId;
  String name;
  String shortCode;
  int countryId;
  bool nationalTeam;
  int founded;
  String logoPath;
  int venueId;
  int currentSeasonId;

  Local({
    this.id,
    this.legacyId,
    this.name,
    this.shortCode,
    this.countryId,
    this.nationalTeam,
    this.founded,
    this.logoPath,
    this.venueId,
    this.currentSeasonId,
  });

  Local.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    legacyId = json['legacy_id'];
    name = json['name'];
    shortCode = json['short_code'];
    countryId = json['country_id'];
    nationalTeam = json['national_team'];
    founded = json['founded'];
    logoPath = json['logo_path'];
    venueId = json['venue_id'];
    currentSeasonId = json['current_season_id'];
  }
}

class Visitor {
  int id;
  int legacyId;
  String name;
  String shortCode;
  int countryId;
  bool nationalTeam;
  int founded;
  String logoPath;
  int venueId;
  int currentSeasonId;

  Visitor({
    this.id,
    this.legacyId,
    this.name,
    this.shortCode,
    this.countryId,
    this.nationalTeam,
    this.founded,
    this.logoPath,
    this.venueId,
    this.currentSeasonId,
  });

  Visitor.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    legacyId = json['legacy_id'];
    name = json['name'];
    shortCode = json['short_code'];
    countryId = json['country_id'];
    nationalTeam = json['national_team'];
    founded = json['founded'];
    logoPath = json['logo_path'];
    venueId = json['venue_id'];
    currentSeasonId = json['current_season_id'];
  }
}

class Lineup {
  List<LineUpData> data;

  Lineup({this.data});

  Lineup.fromJson(Map<String, dynamic> json) {
    if (json['data'] != null) {
      data = new List<LineUpData>();
      json['data'].forEach((v) {
        data.add(new LineUpData.fromJson(v));
      });
    }
  }
}

class LineUpData {
  int teamId;
  int fixtureId;
  int playerId;
  String playerName;
  int number;
  String position;
  int formationPosition;
  bool captain;
  String type;
  Stats stats;
  PlayerInfo player;

  LineUpData(
      {this.teamId,
      this.fixtureId,
      this.playerId,
      this.playerName,
      this.number,
      this.position,
      this.formationPosition,
      this.captain,
      this.type,
      this.stats,
      this.player});

  LineUpData.fromJson(Map<String, dynamic> json) {
    teamId = json['team_id'];
    fixtureId = json['fixture_id'];
    playerId = json['player_id'];
    playerName = json['player_name'];
    number = json['number'];
    position = json['position'];
    formationPosition = json['formation_position'];
    captain = json['captain'];
    type = json['type'];
    stats = json['stats'] != null ? new Stats.fromJson(json['stats']) : null;
    player =
        json['player'] != null ? new PlayerInfo.fromJson(json['player']) : null;
  }
}

class Stats {
  Cards cards;
  String rating;

  Stats({this.cards, this.rating});

  Stats.fromJson(Map<String, dynamic> json) {
    cards = json['cards'] != null ? new Cards.fromJson(json['cards']) : null;
    rating = json['rating'];
  }
}

class Cards {
  int yellowcards;
  int redcards;
  int yellowredcards;

  Cards({this.yellowcards, this.redcards, this.yellowredcards});

  Cards.fromJson(Map<String, dynamic> json) {
    yellowcards = json['yellowcards'];
    redcards = json['redcards'];
    yellowredcards = json['yellowredcards'];
  }
}

class PlayerData {
  int playerId;
  int teamId;
  int countryId;
  int positionId;
  String commonName;
  String displayName;
  String fullname;
  String firstname;
  String lastname;
  String nationality;
  String birthdate;
  String birthcountry;
  String birthplace;
  String height;
  String weight;
  String imagePath;

  PlayerData(
      {this.playerId,
      this.teamId,
      this.countryId,
      this.positionId,
      this.commonName,
      this.displayName,
      this.fullname,
      this.firstname,
      this.lastname,
      this.nationality,
      this.birthdate,
      this.birthcountry,
      this.birthplace,
      this.height,
      this.weight,
      this.imagePath});

  PlayerData.fromJson(Map<String, dynamic> json) {
    playerId = json['player_id'];
    teamId = json['team_id'];
    countryId = json['country_id'];
    positionId = json['position_id'];
    commonName = json['common_name'];
    displayName = json['display_name'];
    fullname = json['fullname'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    nationality = json['nationality'];
    birthdate = json['birthdate'];
    birthcountry = json['birthcountry'];
    birthplace = json['birthplace'];
    height = json['height'];
    weight = json['weight'];
    imagePath = json['image_path'];
  }
}
