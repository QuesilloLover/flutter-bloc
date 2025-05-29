part of 'guests_bloc.dart';

sealed class GuestsEvent extends Equatable {
  const GuestsEvent();

  @override
  List<Object> get props => [];
}

final class CustomGuestsEvent extends GuestsEvent {
  final GuestFilter filter;

  const CustomGuestsEvent(this.filter);

  @override
  List<Object> get props => [filter];
}

final class ToggleGuestEvent extends GuestsEvent {
  final String id;

  const ToggleGuestEvent(this.id);
}