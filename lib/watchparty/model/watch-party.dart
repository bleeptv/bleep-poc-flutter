/// Defines a Watch Party Domain model
class WatchParty {
  final String watchPartyId;
  final String hostAvatarUrl;
  final String hostUserId;
  final String title;
  final String description;
  final int couchParticipantCount;
  final int windowParticipantCouch;

  WatchParty(
      this.watchPartyId,
      this.hostAvatarUrl,
      this.hostUserId,
      this.title,
      this.description,
      this.couchParticipantCount,
      this.windowParticipantCouch
      );
}