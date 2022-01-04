import 'dart:convert';

import 'package:injectable/injectable.dart';
import 'package:marvel_characters/core/data/result.dart';
import 'package:marvel_characters/feature/home/domain/entities/character_entity.dart';
import 'package:marvel_characters/feature/home/domain/repositories/character_repository.dart';
import 'package:http/http.dart' as http;

@Singleton(as: CharacterRepository)
class CharacterRepositoryImpl extends CharacterRepository {
  final List<CharacterEntity> _charactersEntity = [];

  @override
  Future<Result> fetchCharacters() async {
    try {
      if (_charactersEntity.isNotEmpty) {
        return Result.success(_charactersEntity);
      }
      final url = Uri.parse(
          'https://gateway.marvel.com:443/v1/public/characters?offset=1220&limit=90&ts=1&apikey=YOUR_API_KEY');

      final response = await http.get(url);
      final decodedResponse = json.decode(response.body);

      if (decodedResponse['code'] != 200) {
        return const Result.error('An error Ocurred');
      }

      final extractedData = decodedResponse['data']['results'] as List<dynamic>;

      List<Map<String, dynamic>> characters = [];
      extractedData.forEach((element) {
        var imgUrl =
            '${(element['thumbnail'] as Map<String, dynamic>)['path']}/landscape_incredible.${(element['thumbnail'] as Map<String, dynamic>)['extension']}';
        characters.add({
          'id': element['id'].toString(),
          'name': element['name'],
          'description': (element['description'] as String).isEmpty
              ? 'No description available'
              : (element['description'] as String),
          'image': imgUrl,
        });
      });

      characters.forEach((element) {
        _charactersEntity.add(CharacterEntity.fromJson(element));
      });

      return Result.success(_charactersEntity);
    } catch (error) {
      return Result.error(error.toString());
    }
  }

  @override
  Future<Result> getCharacter({required String name}) async {
    try {
      final url = Uri.parse(
          'https://gateway.marvel.com:443/v1/public/characters?name=$name&ts=1&apikey=YOUR_API_KEY');
      final response = await http.get(url);
      final decodedResponse = json.decode(response.body);

      if (decodedResponse['code'] != 200) {
        return const Result.error('An error Ocurred');
      }

      final extractedData =
          decodedResponse['data']['results'][0] as Map<String, dynamic>;
      var imgUrl =
          '${(extractedData['thumbnail'] as Map<String, dynamic>)['path']}/landscape_incredible.${(extractedData['thumbnail'] as Map<String, dynamic>)['extension']}';

      final character = CharacterEntity.fromJson({
        'id': extractedData['id'].toString(),
        'name': extractedData['name'],
        'description': (extractedData['description'] as String).isEmpty
            ? 'No description available'
            : (extractedData['description'] as String),
        'image': imgUrl,
      });
      return Result.success(character);
    } catch (error) {
      return Result.error(error.toString());
    }
  }
}
