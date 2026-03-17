import 'package:dartz/dartz.dart';

import '../../../../../core/errors/failures.dart';
import '../entities/donatur_entity.dart';

/// Interface repository donatur.
abstract class DonaturRepository {
  /// Mendaftarkan donatur baru.
  Future<Either<Failure, void>> registerDonatur({
    required String fullName,
    required String email,
    required String phone,
    String idType,
    String idNumber,
    String address,
    String city,
    String province,
    String postalCode,
  });

  /// Mendapatkan profil donatur berdasarkan user_id.
  Future<Either<Failure, DonaturEntity>> getMyProfile(String userId);

  /// Update profil donatur.
  Future<Either<Failure, void>> updateProfile({
    required String donaturId,
    String? fullName,
    String? phone,
    String? address,
    String? city,
    String? province,
    String? postalCode,
  });
}
