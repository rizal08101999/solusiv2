import 'package:get/get.dart';
import 'package:solusi/app/modules/login/models/login_models.dart';
import 'package:solusi/core/local_db.dart';

class EmployeeController extends GetxController {
  static EmployeeController get instance => Get.find<EmployeeController>();
  
  final Rx<UserEntity?> _currentUser = Rx<UserEntity?>(null);
  UserEntity? get currentUser => _currentUser.value;
  
  final Rx<ArrayEmployee?> _activeEmployee = Rx<ArrayEmployee?>(null);
  ArrayEmployee? get activeEmployee => _activeEmployee.value;
  
  List<ArrayEmployee> get availableEmployees => _currentUser.value?.arrayEmployee ?? [];
  
  @override
  void onInit() {
    super.onInit();
    loadUserData();
  }
  
  void loadUserData() {
    final user = LocalDB.getUser();
    if (user != null) {
      _currentUser.value = user;
      _activeEmployee.value = user.activeEmployee;
    }
  }
  
  void switchActiveEmployee(String employeeId) {
    if (_currentUser.value == null) return;
    
    final updatedUser = _currentUser.value!.switchActiveEmployee(employeeId);
    _currentUser.value = updatedUser;
    _activeEmployee.value = updatedUser.activeEmployee;
    
    // Save to local storage
    LocalDB.saveUser(updatedUser);
    
    update();
  }
  
  void updateUserData(UserEntity user) {
    _currentUser.value = user;
    _activeEmployee.value = user.activeEmployee;
    LocalDB.saveUser(user);
    update();
  }
  
  bool hasMultipleEmployees() {
    return availableEmployees.length > 1;
  }
  
  String get activeEmployeeName => _activeEmployee.value?.nameEmployee ?? '';
  String get activeEmployeeNumber => _activeEmployee.value?.numberEmployee ?? '';
  String get activeCompanyName => _activeEmployee.value?.nameCompany ?? '';
  String get activeEmployeePosition => _activeEmployee.value?.positionEmployeeName ?? '';
}