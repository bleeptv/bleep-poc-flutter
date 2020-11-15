import 'package:bleep_flutter/ui/cell/watchpartyitem/album-background.dart';
import 'package:bleep_flutter/ui/cell/watchpartyitem/album-foreground.dart';
import 'package:bleep_flutter/ui/cell/watchpartyitem/watch-party-cell-details.dart';
import 'package:bleep_flutter/watchparty/model/watch-party.dart';
import 'package:flutter/widgets.dart';

class AlbumCover extends StatelessWidget {

  final WatchParty item;

  AlbumCover({@required this.item});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        AlbumBackground(),
        AlbumForeground(),
        WatchPartyCellDetails(watchPartyTitle: this.item.title, description: this.item.description)
      ],
    );
  }
}