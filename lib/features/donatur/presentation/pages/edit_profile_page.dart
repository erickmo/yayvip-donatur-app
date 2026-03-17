import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_dimensions.dart';
import '../../../../../core/di/injection.dart';
import '../../data/datasources/donatur_remote_datasource.dart';
import '../../data/repositories/donatur_repository_impl.dart';
import '../cubits/update_profile_cubit.dart';
import '../cubits/update_profile_state.dart';

/// Halaman edit profil donatur.
/// Memuat data existing, lalu user bisa update field yang diinginkan.
class EditProfilePage extends StatelessWidget {
  final String donaturId;
  final String userId;

  const EditProfilePage({
    super.key,
    required this.donaturId,
    required this.userId,
  });

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => UpdateProfileCubit(
        DonaturRepositoryImpl(
          DonaturRemoteDatasourceImpl(getIt()),
        ),
      )..loadProfile(userId),
      child: _EditProfileView(donaturId: donaturId),
    );
  }
}

class _EditProfileView extends StatefulWidget {
  final String donaturId;

  const _EditProfileView({required this.donaturId});

  @override
  State<_EditProfileView> createState() => _EditProfileViewState();
}

class _EditProfileViewState extends State<_EditProfileView> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  final _addressCtrl = TextEditingController();
  final _cityCtrl = TextEditingController();
  final _provinceCtrl = TextEditingController();
  final _postalCodeCtrl = TextEditingController();
  bool _prefilled = false;

  @override
  void dispose() {
    _fullNameCtrl.dispose();
    _phoneCtrl.dispose();
    _addressCtrl.dispose();
    _cityCtrl.dispose();
    _provinceCtrl.dispose();
    _postalCodeCtrl.dispose();
    super.dispose();
  }

  void _prefillIfNeeded(UpdateProfileState state) {
    if (!_prefilled && state.donatur != null) {
      final d = state.donatur!;
      _fullNameCtrl.text = d.fullName;
      _phoneCtrl.text = d.phone;
      _addressCtrl.text = d.address;
      _cityCtrl.text = d.city;
      _provinceCtrl.text = d.province;
      _postalCodeCtrl.text = d.postalCode;
      _prefilled = true;
    }
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<UpdateProfileCubit>().updateProfile(
            donaturId: widget.donaturId,
            fullName: _fullNameCtrl.text.trim(),
            phone: _phoneCtrl.text.trim(),
            address: _addressCtrl.text.trim(),
            city: _cityCtrl.text.trim(),
            province: _provinceCtrl.text.trim(),
            postalCode: _postalCodeCtrl.text.trim(),
          );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Edit Profil'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back),
          onPressed: () => context.pop(),
        ),
      ),
      body: BlocConsumer<UpdateProfileCubit, UpdateProfileState>(
        listener: (context, state) {
          _prefillIfNeeded(state);
          if (state.isSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Profil berhasil diperbarui'),
                backgroundColor: Color(0xFF2E7D32),
              ),
            );
            context.pop();
          } else if (state.status == UpdateProfileStatus.failure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage ?? 'Gagal memperbarui profil'),
                backgroundColor: AppColors.error,
              ),
            );
          }
        },
        builder: (context, state) {
          if (state.status == UpdateProfileStatus.loading &&
              state.donatur == null) {
            return const Center(child: CircularProgressIndicator());
          }
          return SingleChildScrollView(
            padding: const EdgeInsets.all(AppDimensions.spacingL),
            child: Form(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  _buildField(
                    controller: _fullNameCtrl,
                    label: 'Nama Lengkap',
                    icon: Icons.person_outline,
                    validator: (v) => (v == null || v.trim().isEmpty)
                        ? 'Nama wajib diisi'
                        : null,
                  ),
                  const SizedBox(height: AppDimensions.spacingM),
                  _buildField(
                    controller: _phoneCtrl,
                    label: 'Nomor Telepon',
                    icon: Icons.phone_outlined,
                    keyboardType: TextInputType.phone,
                  ),
                  const SizedBox(height: AppDimensions.spacingM),
                  _buildField(
                    controller: _addressCtrl,
                    label: 'Alamat',
                    icon: Icons.location_on_outlined,
                  ),
                  const SizedBox(height: AppDimensions.spacingM),
                  _buildField(
                    controller: _cityCtrl,
                    label: 'Kota',
                    icon: Icons.location_city_outlined,
                  ),
                  const SizedBox(height: AppDimensions.spacingM),
                  _buildField(
                    controller: _provinceCtrl,
                    label: 'Provinsi',
                    icon: Icons.map_outlined,
                  ),
                  const SizedBox(height: AppDimensions.spacingM),
                  _buildField(
                    controller: _postalCodeCtrl,
                    label: 'Kode Pos',
                    icon: Icons.local_post_office_outlined,
                    keyboardType: TextInputType.number,
                  ),
                  const SizedBox(height: AppDimensions.spacingXXL),
                  SizedBox(
                    height: AppDimensions.buttonHeight,
                    child: ElevatedButton(
                      onPressed: state.isLoading ? null : _submit,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: AppColors.primary,
                        shape: RoundedRectangleBorder(
                          borderRadius:
                              BorderRadius.circular(AppDimensions.radiusM),
                        ),
                      ),
                      child: state.isLoading
                          ? const CircularProgressIndicator(color: Colors.white)
                          : const Text(
                              'Simpan Perubahan',
                              style: TextStyle(
                                fontSize: 16,
                                fontWeight: FontWeight.w700,
                                color: Colors.white,
                              ),
                            ),
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }

  Widget _buildField({
    required TextEditingController controller,
    required String label,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    String? Function(String?)? validator,
  }) {
    return TextFormField(
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(AppDimensions.radiusM),
        ),
      ),
      validator: validator,
    );
  }
}
