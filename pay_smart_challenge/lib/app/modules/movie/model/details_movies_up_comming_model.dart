class DetailsMoviesUpCommingModel {
  late int totalPages;
  late int totalResults;

  DetailsMoviesUpCommingModel(
      {required this.totalPages, required this.totalResults});

  DetailsMoviesUpCommingModel.fromJson(Map<String, dynamic> json) {
    totalPages = json['total_pages'];
    totalResults = json['total_results'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['total_pages'] = totalPages;
    data['total_results'] = totalResults;
    return data;
  }
}
