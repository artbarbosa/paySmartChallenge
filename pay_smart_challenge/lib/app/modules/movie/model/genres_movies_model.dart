class GenresMoviesModel {
  late int id;
  late String name;

  GenresMoviesModel({required this.id, required this.name});

  GenresMoviesModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}
