import 'package:bloc/bloc.dart';
import 'package:blocs_app/domain/domain.dart';
import 'package:equatable/equatable.dart';

part 'guests_event.dart';
part 'guests_state.dart';

class GuestsBloc extends Bloc<GuestsEvent, GuestsState> {
  GuestsBloc() : super(const GuestsState(
    filter: GuestFilter.all,
    guests: [
      Todo(id: '1', description: 'John Doe', completedAt: null),
      Todo(id: '2', description: 'Jane Smith', completedAt: null),
      Todo(id: '3', description: 'Alice Johnson', completedAt: null),
      Todo(id: '4', description: 'Bob Brown', completedAt: null),
    ],
  )) {

    // on<SetAllGuestsEvent>((event, emit) {
    //   emit(
    //     state.copyWith(
    //       filter: GuestFilter.all
    //     ),
    //   );
    // });

    // on<SetInvitedFilterGuestsEvent>((event, emit) {
    //   emit(
    //     state.copyWith(
    //       filter: GuestFilter.invited
    //     ),
    //   );
    // });

    // on<SetNotInvitedFilterGuestsEvent>((event, emit) {
    //   emit(
    //     state.copyWith(
    //       filter: GuestFilter.notInvited
    //     ),
    //   );
    // });

    on<CustomGuestsEvent>((event, emit) {
      emit(
        state.copyWith(
          filter: event.filter
        ),
      );
    });

    on<ToggleGuestEvent>(_toggleGuestHandler);
  }

  // Method to change the filter based on the GuestFilter enum
  /// Changes the filter for the guests based on the provided [GuestFilter].
  void changeFilter(GuestFilter filter) {
    // switch (filter) {
    //   case GuestFilter.all:
    //     add(SetAllGuestsEvent());
    //     break;
    //   case GuestFilter.invited:
    //     add(SetInvitedFilterGuestsEvent());
    //     break;
    //   case GuestFilter.notInvited:
    //     add(SetNotInvitedFilterGuestsEvent());
    //     break;
    // }

    add(CustomGuestsEvent(filter));
  }

  void toggleGuestHandler(String id) {
    add(ToggleGuestEvent(id));
  }

  void _toggleGuestHandler(ToggleGuestEvent event, Emitter<GuestsState> emit) {
    final updatedGuests = state.guests.map((guest) {
      if (guest.id == event.id) {
        return guest.copyWith(
          completedAt: guest.done ? null : DateTime.now(),
        );
      }
      return guest;
    }).toList();

    emit(state.copyWith(guests: updatedGuests));
  }
}
