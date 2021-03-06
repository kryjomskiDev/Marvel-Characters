import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

part 'text_input_state.dart';

class TextInputCubit extends Cubit<TextInputState> {
  TextInputCubit() : super(TextInputInitial());
  String _value = '';

  getValue() => _value;

  onChanged(String value) {
    _value = value;
    emit(TextInputInitial());
  }
}
