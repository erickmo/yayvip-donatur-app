import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';

import '../../../../../core/constants/app_colors.dart';
import '../../../../../core/constants/app_dimensions.dart';
import '../../../../../core/di/injection.dart';
import '../../data/datasources/donatur_remote_datasource.dart';
import '../../data/repositories/donatur_repository_impl.dart';
import '../cubits/register_donatur_cubit.dart';
import '../cubits/register_donatur_state.dart';

/// Halaman pendaftaran sebagai donatur — muncul setelah login
/// jika user belum terdaftar sebagai donatur.
class RegisterDonaturPage extends StatelessWidget {
  const RegisterDonaturPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => RegisterDonaturCubit(
        DonaturRepositoryImpl(
          DonaturRemoteDatasourceImpl(getIt()),
        ),
      ),
      child: const _RegisterDonaturView(),
    );
  }
}

class _RegisterDonaturView extends StatefulWidget {
  const _RegisterDonaturView();

  @override
  State<_RegisterDonaturView> createState() => _RegisterDonaturViewState();
}

class _RegisterDonaturViewState extends State<_RegisterDonaturView> {
  final _formKey = GlobalKey<FormState>();
  final _fullNameCtrl = TextEditingController();
  final _emailCtrl = TextEditingController();
  final _phoneCtrl = TextEditingController();
  final _idTypeCtrl = TextEditingController();
  final _idNumberCtrl = TextEditingController();
  final _addressCtrl = TextEditingController();
  final _cityCtrl = TextEditingController();
  final _provinceCtrl = TextEditingController();
  final _postalCodeCtrl = TextEditingController();

  @override
  void dispose() {
    _fullNameCtrl.dispose();
    _emailCtrl.dispose();
    _phoneCtrl.dispose();
    _idTypeCtrl.dispose();
    _idNumberCtrl.dispose();
    _addressCtrl.dispose();
    _cityCtrl.dispose();
    _provinceCtrl.dispose();
    _postalCodeCtrl.dispose();
    super.dispose();
  }

  void _submit() {
    if (_formKey.currentState?.validate() ?? false) {
      context.read<RegisterDonaturCubit>().register(
            fullName: _fullNameCtrl.text.trim(),
            email: _emailCtrl.text.trim(),
            phone: _phoneCtrl.text.trim(),
            idType: _idTypeCtrl.text.trim(),
            idNumber: _idNumberCtrl.text.trim(),
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
        title: const Text('Daftar Donatur'),
        backgroundColor: AppColors.primary,
        foregroundColor: Colors.white,
      ),
      body: BlocListener<RegisterDonaturCubit, RegisterDonaturState>(
        listener: (context, state) {
          if (state.isSuccess) {
            ScaffoldMessenger.of(context).showSnackBar(
              const SnackBar(
                content: Text('Pendaftaran berhasil! Selamat datang di VIP.'),
                backgroundColor: Color(0xFF2E7D32),
              ),
            );
            context.go('/home');
          } else if (state.status == RegisterDonaturStatus.failure) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text(state.errorMessage ?? 'Terjadi kesalahan'),
                backgroundColor: AppColors.error,
              ),
            );
          }
        },
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppDimensions.spacingL),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildSectionTitle('Data Wajib'),
                const SizedBox(height: AppDimensions.spacingM),
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
                  controller: _emailCtrl,
                  label: 'Email',
                  icon: Icons.email_outlined,
                  keyboardType: TextInputType.emailAddress,
                  validator: (v) {
                    if (v == null || v.trim().isEmpty) return 'Email wajib diisi';
                    if (!v.contains('@')) return 'Email tidak valid';
                    return null;
                  },
                ),
                const SizedBox(height: AppDimensions.spacingM),
                _buildField(
                  controller: _phoneCtrl,
                  label: 'Nomor Telepon',
                  icon: Icons.phone_outlined,
                  keyboardType: TextInputType.phone,
                  validator: (v) {
                    if (v == null || v.trim().isEmpty) {
                      return 'Nomor telepon wajib diisi';
                    }
                    if (v.trim().length < 8) return 'Minimal 8 digit';
                    return null;
                  },
                ),
                const SizedBox(height: AppDimensions.spacingXL),
                _buildSectionTitle('Data Tambahan (Opsional)'),
                const SizedBox(height: AppDimensions.spacingM),
                _buildField(
                  controller: _idTypeCtrl,
                  label: 'Jenis Identitas (KTP/SIM/Paspor)',
                  icon: Icons.badge_outlined,
                ),
                const SizedBox(height: AppDimensions.spacingM),
                _buildField(
                  controller: _idNumberCtrl,
                  label: 'Nomor Identitas',
                  icon: Icons.numbers_outlined,
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
                _buildSubmitButton(),
                const SizedBox(height: AppDimensions.spacingL),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildSectionTitle(String title) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.w700,
        color: AppColors.textPrimary,
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

  Widget _buildSubmitButton() {
    return BlocBuilder<RegisterDonaturCubit, RegisterDonaturState>(
      builder: (context, state) {
        return SizedBox(
          height: AppDimensions.buttonHeight,
          child: ElevatedButton(
            onPressed: state.isLoading ? null : _submit,
            style: ElevatedButton.styleFrom(
              backgroundColor: AppColors.primary,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(AppDimensions.radiusM),
              ),
            ),
            child: state.isLoading
                ? const CircularProgressIndicator(color: Colors.white)
                : const Text(
                    'Daftar Sebagai Donatur',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w700,
                      color: Colors.white,
                    ),
                  ),
          ),
        );
      },
    );
  }
}
