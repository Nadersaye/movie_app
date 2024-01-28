import '../../domain/entities/genres.dart';

class GeneresModel extends Generes {
  const GeneresModel({required super.id, required super.name});

  factory GeneresModel.fromJson(Map<String, dynamic> json) => GeneresModel(
        id: json['id'],
        name: json['name'],
      );
}
