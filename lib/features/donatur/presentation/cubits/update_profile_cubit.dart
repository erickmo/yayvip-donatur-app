import 'package:flutter_bloc/flutter_bloc.dart';

import '../../domain/repositories/donatur_repository.dart';
import 'update_profile_state.dart';

class UpdateProfileCubit extends Cubit<UpdateProfileState> {
  final DonaturRepository _repository;

  UpdateProfileCubit(this._repository) : super(const UpdateProfileState());

  Future<void> loadProfile(String userId) async {
    emit(state.copyWith(status: UpdateProfileStatus.loading));
    final result = await _repository.getMyProfile(userId);
    result.fold(
      (failure) => emit(state.copyWith(
        status: UpdateProfileStatus.failure,
        errorMessage: () => failure.message,
      )),
      (donatur) => emit(state.copyWith(
        status: UpdateProfileStatus.initial,
        donatur: donatur,
      )),
    );
  }

  Future<void> updateProfile({
    required String donaturId,
    String? fullName,
    String? phone,
    String? address,
    String? city,
    String? province,
    String? postalCode,
  }) async {
    emit(state.copyWith(
      status: UpdateProfileStatus.loading,
      errorMessage: () => null,
    ));

    final result = await _repository.updateProfile(
      donaturId: donaturId,
      fullName: fullName,
      phone: phone,
      address: address,
      city: city,
      province: province,
      postalCode: postalCode,
    );

    result.fold(
      (failure) => emit(state.copyWith(
        status: UpdateProfileStatus.failure,
        errorMessage: () => failure.message,
      )),
      (_) => emit(state.copyWith(
        status: UpdateProfileStatus.success,
        errorMessage: () => null,
      )),
    );
  }
}
