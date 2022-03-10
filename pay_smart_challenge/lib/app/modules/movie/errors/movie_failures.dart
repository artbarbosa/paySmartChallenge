import '../../../core/error/failure.dart';

class NoDataFound extends Failure {
  NoDataFound()
      : super(errorMessage: 'No data found:  try to connect to the internet');
}

abstract class NoInternetConnection extends Failure {
  NoInternetConnection() : super(errorMessage: 'No Internet Connection');
}

class MovieUpComingNoInternetConnection extends NoInternetConnection {}

class MovieUpComingError extends Failure {
  MovieUpComingError({
    StackTrace? stackTrace,
    required String? label,
    required dynamic exception,
    required String errorMessage,
  }) : super(
          stackTrace: stackTrace,
          label: label,
          exception: exception,
          errorMessage: errorMessage,
        );
}

class MovieGenresNoInternetConnection extends NoInternetConnection {}

class MovieGenresError extends Failure {
  MovieGenresError({
    StackTrace? stackTrace,
    required String label,
    required dynamic exception,
    required String errorMessage,
  }) : super(
          stackTrace: stackTrace,
          label: label,
          exception: exception,
          errorMessage: errorMessage,
        );
}
