import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

import '../../../../core/constants/app_colors.dart';
import '../../../../core/constants/app_dimensions.dart';
import '../../../../core/content/app_content.dart';

/// Halaman login donatur.
class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formKey = GlobalKey<FormState>();
  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();
  bool _obscurePassword = true;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  void _onLogin() {
    if (_formKey.currentState?.validate() ?? false) {
      final email = _emailController.text.trim();
      final password = _passwordController.text;

      // Demo account — ganti dengan API call nanti
      if (email == 'admin@yayvip.com' && password == 'yayvip123') {
        context.go('/home');
      } else {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: const Text('Email atau password salah'),
            backgroundColor: AppColors.error,
            behavior: SnackBarBehavior.floating,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(AppDimensions.radiusM),
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(AppDimensions.spacingL),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              const SizedBox(height: AppDimensions.spacingXXL),
              _buildHeader(),
              const SizedBox(height: AppDimensions.spacingXXL),
              _buildForm(),
              const SizedBox(height: AppDimensions.spacingM),
              _buildForgotPassword(),
              const SizedBox(height: AppDimensions.spacingL),
              _buildLoginButton(),
              const SizedBox(height: AppDimensions.spacingL),
              _buildRegisterLink(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Column(
      children: [
        // VIP Logo text
        const Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              'V',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.w900,
                color: AppColors.textPrimary,
                height: 1,
              ),
            ),
            Text(
              'I',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.w900,
                color: AppColors.primary,
                height: 1,
              ),
            ),
            Text(
              'P',
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.w900,
                color: AppColors.textPrimary,
                height: 1,
              ),
            ),
          ],
        ),
        const SizedBox(height: AppDimensions.spacingXS),
        Text(
          AppContent.orgName.toUpperCase(),
          style: const TextStyle(
            fontSize: 12,
            fontWeight: FontWeight.w600,
            color: AppColors.textSecondary,
            letterSpacing: 2,
          ),
        ),
        const SizedBox(height: AppDimensions.spacingL),
        Text(
          AppContent.appTagline,
          style: const TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.w700,
            color: AppColors.textPrimary,
          ),
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: AppDimensions.spacingS),
        Text(
          AppContent.loginSubtitle,
          style: const TextStyle(
            fontSize: 14,
            color: AppColors.textSecondary,
          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }

  Widget _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: [
          TextFormField(
            controller: _emailController,
            keyboardType: TextInputType.emailAddress,
            decoration: InputDecoration(
              labelText: AppContent.emailLabel,
              prefixIcon: const Icon(Icons.email_outlined),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppContent.emailRequired;
              }
              if (!value.contains('@')) {
                return AppContent.emailInvalid;
              }
              return null;
            },
          ),
          const SizedBox(height: AppDimensions.spacingM),
          TextFormField(
            controller: _passwordController,
            obscureText: _obscurePassword,
            decoration: InputDecoration(
              labelText: AppContent.passwordLabel,
              prefixIcon: const Icon(Icons.lock_outlined),
              suffixIcon: IconButton(
                icon: Icon(
                  _obscurePassword
                      ? Icons.visibility_outlined
                      : Icons.visibility_off_outlined,
                ),
                onPressed: () {
                  setState(() {
                    _obscurePassword = !_obscurePassword;
                  });
                },
              ),
            ),
            validator: (value) {
              if (value == null || value.isEmpty) {
                return AppContent.passwordRequired;
              }
              if (value.length < 6) {
                return AppContent.passwordMinLength;
              }
              return null;
            },
          ),
        ],
      ),
    );
  }

  Widget _buildForgotPassword() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          // TODO: Navigate to forgot password
        },
        child: Text(
          AppContent.forgotPassword,
          style: const TextStyle(color: AppColors.primary),
        ),
      ),
    );
  }

  Widget _buildLoginButton() {
    return ElevatedButton(
      onPressed: _onLogin,
      child: Text(AppContent.loginTitle),
    );
  }

  Widget _buildRegisterLink() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Text(
          AppContent.dontHaveAccount,
          style: const TextStyle(color: AppColors.textSecondary),
        ),
        TextButton(
          onPressed: () {
            // TODO: Navigate to register
          },
          child: Text(
            AppContent.registerTitle,
            style: const TextStyle(
              color: AppColors.primary,
              fontWeight: FontWeight.w600,
            ),
          ),
        ),
      ],
    );
  }
}
