import '../../domain/entities/donatur_entity.dart';

/// Model untuk parsing response API donatur.
class DonaturModel extends DonaturEntity {
  const DonaturModel({
    required super.id,
    required super.userId,
    required super.fullName,
    required super.email,
    required super.phone,
    super.idType,
    super.idNumber,
    super.address,
    super.city,
    super.province,
    super.postalCode,
    super.status,
    super.totalDonated,
  });

  factory DonaturModel.fromJson(Map<String, dynamic> json) {
    return DonaturModel(
      id: json['id'] as String? ?? '',
      userId: json['user_id'] as String? ?? '',
      fullName: json['full_name'] as String? ?? '',
      email: json['email'] as String? ?? '',
      phone: json['phone'] as String? ?? '',
      idType: json['id_type'] as String? ?? '',
      idNumber: json['id_number'] as String? ?? '',
      address: json['address'] as String? ?? '',
      city: json['city'] as String? ?? '',
      province: json['province'] as String? ?? '',
      postalCode: json['postal_code'] as String? ?? '',
      status: json['status'] as String? ?? 'active',
      totalDonated: json['total_donated'] as int? ?? 0,
    );
  }
}
