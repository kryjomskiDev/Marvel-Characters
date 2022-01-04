part of 'text_input_cubit.dart';

abstract class TextInputState {
  const TextInputState();
}

class TextInputInitial extends TextInputState {
  TextInputInitial();
}

class TextInputError extends TextInputState {
  final String? text;

  TextInputError(this.text);
}
