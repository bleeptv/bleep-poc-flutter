
import 'package:bleep_flutter/watchparty/model/watch-party.dart';
import 'package:equatable/equatable.dart';
import 'package:meta/meta.dart';

///
/// Object to represent the state of the home feed
@immutable
abstract class HomeFeedState extends Equatable {
  HomeFeedState([List props = const []]);

  @override
  List<Object> get props => [];
}

///
/// The state of the home feed when a loading indicator is showing
class HomeFeedShowLoading extends HomeFeedState {}

///
/// The state of the home feed when a loading indicator is gone
class HomeFeedHideLoading extends HomeFeedState {}

///
/// The state of the home feed when an error occurs
class HomeFeedShowError extends HomeFeedState {
  final String errorMessage;
  HomeFeedShowError(this.errorMessage): super([errorMessage]);
}

///
/// The state of the home feed when watch parties have been fetched from the data layer
class HomeFeedLoaded extends HomeFeedState {
  final List<WatchParty> fetchedWatchParties;
  HomeFeedLoaded(this.fetchedWatchParties) : super([fetchedWatchParties]);
}