import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';
import 'package:my_flutter_clean_architecture/core/error_handling/failure.dart';

abstract class Usecase<T, P> {
  Future<Either<Failure, T>> call(P params);
}

class NoParams extends Equatable {
  @override
  List<Object> get props => [];
}
