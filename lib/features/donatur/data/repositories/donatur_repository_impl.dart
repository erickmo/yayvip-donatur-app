import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';

import '../../../../../core/errors/failures.dart';
import '../../domain/entities/donatur_entity.dart';
import '../../domain/repositories/donatur_repository.dart';
import '../datasources/donatur_remote_datasource.dart';

class DonaturRepositoryImpl implements DonaturRepository {
  final DonaturRemoteDatasource _remote;

  DonaturRepositoryImpl(this._remote);

  @override
  Future<Either<Failure, void>> registerDonatur({
    required String fullName,
    required String email,
    required String phone,
    String idType = '',
    String idNumber = '',
    String address = '',
    String city = '',
    String province = '',
    String postalCode = '',
  }) async {
    try {
      await _remote.registerDonatur({
        'full_name': fullName,
        'email': email,
        'phone': phone,
        'id_type': idType,
        'id_number': idNumber,
        'address': address,
        'city': city,
        'province': province,
        'postal_code': postalCode,
      });
      return const Right(null);
    } on DioException catch (e) {
      return Left(_mapDioError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, DonaturEntity>> getMyProfile(String userId) async {
    try {
      final model = await _remote.getMyProfile(userId);
      return Right(model);
    } on DioException catch (e) {
      return Left(_mapDioError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  @override
  Future<Either<Failure, void>> updateProfile({
    required String donaturId,
    String? fullName,
    String? phone,
    String? address,
    String? city,
    String? province,
    String? postalCode,
  }) async {
    try {
      final body = <String, dynamic>{};
      if (fullName != null) body['full_name'] = fullName;
      if (phone != null) body['phone'] = phone;
      if (address != null) body['address'] = address;
      if (city != null) body['city'] = city;
      if (province != null) body['province'] = province;
      if (postalCode != null) body['postal_code'] = postalCode;

      await _remote.updateProfile(donaturId, body);
      return const Right(null);
    } on DioException catch (e) {
      return Left(_mapDioError(e));
    } catch (e) {
      return Left(ServerFailure(e.toString()));
    }
  }

  Failure _mapDioError(DioException e) {
    if (e.response?.statusCode == 401) return const UnauthorizedFailure();
    return ServerFailure(
      e.response?.data?['message'] as String? ?? 'Terjadi kesalahan server',
      statusCode: e.response?.statusCode,
    );
  }
}
