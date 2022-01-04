import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:marvel_characters/core/data/result.dart';
import 'package:marvel_characters/feature/home/domain/repositories/character_repository.dart';



class HomeScreenCubit extends Cubit<Result>{
  final CharacterRepository _characterRepository;
  HomeScreenCubit(this._characterRepository) : super(Result.initial());

  fetchCharacters() async{
    emit(Result.loading());
    final result = await _characterRepository.fetchCharacters();
    emit(result);
  }

  getCharacter(String name) async{
    emit(Result.loading());
    final result = await _characterRepository.getCharacter(name: name);
    emit(result);
  }
}