import 'dart:io';

import 'package:either_dart/either.dart';
import 'package:injectable/injectable.dart';

import '../../../../core/constants/app_constants.dart';
import '../../../../core/extension/string_extension.dart';
import '../../../../core/utils/error.dart';
import '../../data/models/dtos/exercise_dto.dart';
import '../../data/models/requests/exercise_filter_request.dart';
import '../../data/models/requests/paging_request.dart';
import '../../data/services/exercise_service.dart';
import '../entities/exercise.dart';

abstract class ExerciseRepo {
  Future<Either<Error, List<Exercise>>> getExercises({
    PagingRequest? paging,
    ExerciseFilterRequest? filter,
  });
  Future<Either<Error, List<String>>> getBodyParts();
  Future<Either<Error, List<String>>> getEquipments();
}

@LazySingleton(as: ExerciseRepo)
class ExerciseRepoImpl implements ExerciseRepo {
  final ExerciseService _exerciseService;

  ExerciseRepoImpl(this._exerciseService);

  @override
  Future<Either<Error, List<Exercise>>> getExercises({
    PagingRequest? paging,
    ExerciseFilterRequest? filter,
  }) async {
    try {
      final res = await _exerciseService.getExercises(
        paging: paging,
        filter: filter,
      );

      if (res.response.statusCode == HttpStatus.ok && res.data.success) {
        final exercises = res.data.data.map((item) => item.toEntity()).toList();
        return Right(exercises);
      }

      return Left(
        Error(
          message: res.response.statusMessage ?? AppConstants.commonError,
          code: res.response.statusCode.toString(),
          errorType: ErrorType.server,
        ),
      );
    } catch (e) {
      return Left(handleException(e));
    }
  }

  @override
  Future<Either<Error, List<String>>> getBodyParts() async {
    try {
      final res = await _exerciseService.getBodyParts();

      if (res.response.statusCode == HttpStatus.ok && res.data.success) {
        final bodyParts = res.data.data
            .map((item) => item.name.capitalized)
            .toList();
        return Right(bodyParts);
      }

      return Left(
        Error(
          message: res.response.statusMessage ?? AppConstants.commonError,
          code: res.response.statusCode.toString(),
          errorType: ErrorType.server,
        ),
      );
    } catch (e) {
      return Left(handleException(e));
    }
  }

  @override
  Future<Either<Error, List<String>>> getEquipments() async {
    try {
      final res = await _exerciseService.getEquipments();

      if (res.response.statusCode == HttpStatus.ok && res.data.success) {
        final equipments = res.data.data
            .map((item) => item.name.capitalized)
            .toList();
        return Right(equipments);
      }

      return Left(
        Error(
          message: res.response.statusMessage ?? AppConstants.commonError,
          code: res.response.statusCode.toString(),
          errorType: ErrorType.server,
        ),
      );
    } catch (e) {
      return Left(handleException(e));
    }
  }
}
