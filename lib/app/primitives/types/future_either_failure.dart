import 'package:dartz/dartz.dart';
import 'package:qeema_task/core/network/failure.dart';

typedef FutureEitherFailureOrType<T> = Future<Either<Failure, T>>;
