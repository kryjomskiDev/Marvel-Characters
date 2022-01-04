import 'package:equatable/equatable.dart';

class CharacterEntity extends Equatable {
  final String id;
  final String name;
  final String description;
  final String imgUrl;

  const CharacterEntity({
    required this.id,
    required this.name,
    required this.description,
    required this.imgUrl,
  });

  CharacterEntity.fromJson(Map<String, dynamic> data)
      : id = data['id'],
        name = data['name'] ,
        description = data['description'],
        imgUrl = data['image'];

  @override
  List<Object?> get props => [id, name, description, imgUrl];
}
