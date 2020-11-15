import 'package:bleep_flutter/ui/cell/watchpartyitem/album-background.dart';
import 'package:bleep_flutter/ui/cell/watchpartyitem/album-foreground.dart';
import 'package:bleep_flutter/ui/cell/watchpartyitem/watch-party-cell-details.dart';
import 'package:bleep_flutter/watchparty/model/watch-party.dart';
import 'package:flutter/widgets.dart';

class AlbumCover extends StatelessWidget {

  final WatchParty item;
  final _maxTitleWordLength = 3;

  AlbumCover({@required this.item});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: <Widget>[
        AlbumBackground(),
        AlbumForeground(),
        WatchPartyCellDetails(
            watchPartyTitle: this.createAlbumTitle(this.item.title),
            description: this.item.description
        )
      ],
    );
  }

  String createAlbumTitle(String watchPartyTitle) {
    final splitTitle = watchPartyTitle.split(" ");
    if(splitTitle.length <= _maxTitleWordLength) {
      return splitTitle.join("\n");
    }
    String finalAlbumTitle = splitTitle.getRange(0, _maxTitleWordLength).join("\n");

    return "$finalAlbumTitle...";
  }
}