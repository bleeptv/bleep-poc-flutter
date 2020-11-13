
import 'package:json_annotation/json_annotation.dart';
part 'watch-party-entity.g.dart';

@JsonSerializable()
class WatchPartyEntity {
  WatchPartyEntity({
    this.watchPartyId,
    this.scheduling,
    this.selectedPlaylist,
    this.watchPartyBio,
    this.status
  });

  final String watchPartyId;
  final WatchPartyScheduling scheduling;
  final SelectedWatchPartyPlaylist selectedPlaylist;
  final WatchPartyBio watchPartyBio;
  final WatchPartyStatus status;

  factory WatchPartyEntity.fromJson(Map<String, dynamic> json) => _$WatchPartyEntityFromJson(json);
  Map<String, dynamic> toJson() => _$WatchPartyEntityToJson(this);
}

@JsonSerializable()
class WatchPartyScheduling {
  String dateTime;

  WatchPartyScheduling({this.dateTime});

  factory WatchPartyScheduling.fromJson(Map<String, dynamic> json) => _$WatchPartySchedulingFromJson(json);
  Map<String, dynamic> toJson() => _$WatchPartySchedulingToJson(this);
}

@JsonSerializable()
class SelectedWatchPartyPlaylist{
  String playlistId;
  String playlistName;

 SelectedWatchPartyPlaylist({this.playlistId, this.playlistName});

  factory SelectedWatchPartyPlaylist.fromJson(Map<String, dynamic> json) => _$SelectedWatchPartyPlaylistFromJson(json);
  Map<String, dynamic> toJson() => _$SelectedWatchPartyPlaylistToJson(this);
}

@JsonSerializable()
class WatchPartyBio {
  String name;
  String description;

  WatchPartyBio({this.name, this.description});

  factory WatchPartyBio.fromJson(Map<String, dynamic> json) => _$WatchPartyBioFromJson(json);
  Map<String, dynamic> toJson() => _$WatchPartyBioToJson(this);
}

@JsonSerializable()
class WatchPartyStatus {
  String started;
  String ended;

  WatchPartyStatus({this.started, this.ended});

  factory WatchPartyStatus.fromJson(Map<String, dynamic> json) => _$WatchPartyStatusFromJson(json);
  Map<String, dynamic> toJson() => _$WatchPartyStatusToJson(this);
}