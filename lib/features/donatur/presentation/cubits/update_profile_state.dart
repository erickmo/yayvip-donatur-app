import 'package:equatable/equatable.dart';

import '../../domain/entities/donatur_entity.dart';

enum UpdateProfileStatus { initial, loading, success, failure }

class UpdateProfileState extends Equatable {
  final UpdateProfileStatus status;
  final DonaturEntity? donatur;
  final String? errorMessage;

  const UpdateProfileState({
    this.status = UpdateProfileStatus.initial,
    this.donatur,
    this.errorMessage,
  });

  bool get isLoading => status == UpdateProfileStatus.loading;
  bool get isSuccess => status == UpdateProfileStatus.success;

  UpdateProfileState copyWith({
    UpdateProfileStatus? status,
    DonaturEntity? donatur,
    String? Function()? errorMessage,
  }) {
    return UpdateProfileState(
      status: status ?? this.status,
      donatur: donatur ?? this.donatur,
      errorMessage:
          errorMessage != null ? errorMessage() : this.errorMessage,
    );
  }

  @override
  List<Object?> get props => [status, donatur, errorMessage];
}
