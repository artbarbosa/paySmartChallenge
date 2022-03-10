class ApiConst {
  static const apiKey = '445b5f36400a7c1941e7667d71c30504';
  static String fetchGenre() =>
      'https://api.themoviedb.org/3/genre/movie/list?api_key=$apiKey&language=en-US';
  static String moviesUpComming({int page = 1}) =>
      'https://api.themoviedb.org/3/movie/upcoming?api_key=$apiKey&language=en-US&page=$page';
  static String requestIMG(String img) =>
      'https://image.tmdb.org/t/p/w500/$img';
}
