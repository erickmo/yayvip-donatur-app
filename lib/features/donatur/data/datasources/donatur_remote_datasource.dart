import 'package:dio/dio.dart';

import '../../../../../core/network/api_client.dart';
import '../models/donatur_model.dart';

abstract class DonaturRemoteDatasource {
  Future<void> registerDonatur(Map<String, dynamic> body);
  Future<DonaturModel> getMyProfile(String userId);
  Future<void> updateProfile(String donaturId, Map<String, dynamic> body);
}

class DonaturRemoteDatasourceImpl implements DonaturRemoteDatasource {
  final ApiClient _apiClient;

  DonaturRemoteDatasourceImpl(this._apiClient);

  @override
  Future<void> registerDonatur(Map<String, dynamic> body) async {
    await _apiClient.dio.post('/donatur', data: body);
  }

  @override
  Future<DonaturModel> getMyProfile(String userId) async {
    final response = await _apiClient.dio.get('/donatur/me/$userId');
    final data = response.data['data'] as Map<String, dynamic>;
    return DonaturModel.fromJson(data);
  }

  @override
  Future<void> updateProfile(
      String donaturId, Map<String, dynamic> body) async {
    await _apiClient.dio.put('/donatur/$donaturId', data: body);
  }
}
