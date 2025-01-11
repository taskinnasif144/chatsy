

import 'package:chatsy/services/auth_services.dart';
import 'package:flutter/cupertino.dart';

class GetUserProvider with ChangeNotifier {
  List<Map<String, dynamic>?> _allUsers = [];
  bool isLoading = false;
  List<Map<String, dynamic>?> get allUsers => _allUsers;
  final _fetchAllUsers = Auth();

  Future prepareAllUsers() async {
    isLoading = true;
    notifyListeners();
    final response = await _fetchAllUsers.getAllUsers();
   _allUsers = response;
    isLoading = false;
    notifyListeners();
  }
}