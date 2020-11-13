// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'watch-party-entity.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

WatchPartyScheduling _$WatchPartySchedulingFromJson(Map<String, dynamic> json) {
  return WatchPartyScheduling(
    dateTime: json['dateTime'] as String,
  );
}

Map<String, dynamic> _$WatchPartySchedulingToJson(
        WatchPartyScheduling instance) =>
    <String, dynamic>{
      'dateTime': instance.dateTime,
    };

SelectedWatchPartyPlaylist _$SelectedWatchPartyPlaylistFromJson(
    Map<String, dynamic> json) {
  return SelectedWatchPartyPlaylist(
    playlistId: json['playlistId'] as String,
    playlistName: json['playlistName'] as String,
  );
}

Map<String, dynamic> _$SelectedWatchPartyPlaylistToJson(
        SelectedWatchPartyPlaylist instance) =>
    <String, dynamic>{
      'playlistId': instance.playlistId,
      'playlistName': instance.playlistName,
    };

WatchPartyBio _$WatchPartyBioFromJson(Map<String, dynamic> json) {
  return WatchPartyBio(
    name: json['name'] as String,
    description: json['description'] as String,
  );
}

Map<String, dynamic> _$WatchPartyBioToJson(WatchPartyBio instance) =>
    <String, dynamic>{
      'name': instance.name,
      'description': instance.description,
    };

WatchPartyStatus _$WatchPartyStatusFromJson(Map<String, dynamic> json) {
  return WatchPartyStatus(
    started: json['started'] as String,
    ended: json['ended'] as String,
  );
}

Map<String, dynamic> _$WatchPartyStatusToJson(WatchPartyStatus instance) =>
    <String, dynamic>{
      'started': instance.started,
      'ended': instance.ended,
    };

WatchPartyEntity _$WatchPartyEntityFromJson(Map<String, dynamic> json) {
  return WatchPartyEntity(
    watchPartyId: json['watchPartyId'] as String,
    scheduling: json['scheduling'] == null
        ? null
        : WatchPartyScheduling.fromJson(
            json['scheduling'] as Map<String, dynamic>),
    selectedPlaylist: json['selectedPlaylist'] == null
        ? null
        : SelectedWatchPartyPlaylist.fromJson(
            json['selectedPlaylist'] as Map<String, dynamic>),
    watchPartyBio: json['watchPartyBio'] == null
        ? null
        : WatchPartyBio.fromJson(json['watchPartyBio'] as Map<String, dynamic>),
    status: json['status'] == null
        ? null
        : WatchPartyStatus.fromJson(json['status'] as Map<String, dynamic>),
  );
}

Map<String, dynamic> _$WatchPartyEntityToJson(WatchPartyEntity instance) =>
    <String, dynamic>{
      'watchPartyId': instance.watchPartyId,
      'scheduling': instance.scheduling,
      'selectedPlaylist': instance.selectedPlaylist,
      'watchPartyBio': instance.watchPartyBio,
      'status': instance.status,
    };
