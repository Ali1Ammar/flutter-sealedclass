import 'package:flutter_bloc/flutter_bloc.dart';

// Sealed class representing different types of events
sealed class Event {}

class ButtonPressEvent extends Event {
  final String buttonId;

  ButtonPressEvent(this.buttonId);
}

class InputChangeEvent extends Event {
  final String inputText;

  InputChangeEvent(this.inputText);
}

class TimerTickEvent extends Event {
  final int tick;

  TimerTickEvent(this.tick);
}

class EventBloc extends Bloc<Event, String> {
  EventBloc() : super('') {
    on<Event>((event, emit) {
      switch (event) {
        case ButtonPressEvent():
          emit('Button pressed: ${event.buttonId}');
        // Handle button press event
        case InputChangeEvent():
          emit('Input changed: ${event.inputText}');
        // Handle input change event
        case TimerTickEvent():
          emit('Timer tick: ${event.tick}');
        // Handle timer tick event
      }
    });
  }
}
