import 'package:marvel_characters/core/data/result.dart';

abstract class CharacterRepository{
  Future<Result> fetchCharacters();
  Future<Result> getCharacter({required String name});
}