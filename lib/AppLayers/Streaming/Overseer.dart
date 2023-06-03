import 'dart:ui';
import '../../../screens/Auth/login/login_manager.dart';
import '../../screens/AllActivitiesScreen/all_activities_manager.dart';
import '../../screens/Auth/ChangePassword/change_password_manager.dart';
import '../../screens/Auth/ForgetPassword/forget_password_manager.dart';
import '../../screens/Auth/VerifyForgetPassword/verify_password_manager.dart';
import '../../screens/DownloadActivityScreen/AllDownloadActivity/all_download_activity_manager.dart';
import '../../screens/MainDashboardScreen/GetAllRevenueScreen/all_revenue_manager.dart';
import '../../screens/MemoryQuotaScreen/AllMemoryQuota/memory_quota_manager.dart';
import '../../screens/RoleScreens/ViewAllRoles/role_manager.screen.dart';
import '../../screens/UploadActivityScreens/AllUploadActivity/all_upload_manager_screen.dart';
import '../../screens/UserScreens/AddNewUser/add_new_User_manager.dart';
import '../../screens/UserScreens/AllUser/userDataTableManager.dart';
import '../../screens/UserScreens/UpdateUserScreen/userUpdate_manager.dart';
import '../../screens/UserScreens/UserOverviewScreen/SpecificActivitiesScreen/specific_user_manager.dart';
import '../../screens/WorkspaceScreens/Add_New_WorkSpace/add_new_workSpace_manager.dart';
import '../../screens/WorkspaceScreens/AllWorkSpace/Workspace_Table_manager.dart';
import '../../screens/WorkspaceScreens/Corporate/carporater_manager.dart';


class Overseer {

  Map<dynamic, dynamic> repository = {};
  static String statusCode="";
  static String updatePackageId="";
  static String updateUserId="";
  static String updateThemeId="";
  static String updateRoleId="";
  static String userId = "";
  static String userPackageId1 ="";
  static String downActivityId ="";
  static String spacUsDowActId ="";
  static String packActivityId ="";
  static bool viewVsi = false;
  static bool editVisi = false;
  static bool viewVisi =false;
  static bool viewVisi1 =true;
  static bool viewVisi2 =true;
  static bool viewVisi3 =true;
  static bool viewVisi4 =true;
  static bool viewVisi5 =true;
  static bool viewVisi6 =true;
  static bool viewVisi7 =true;
  static bool edit_view_visi =true;

  /// App Colors
  static const Color bgColors = Color(0xff1D1D41);
  static const Color adminBgColors = Color(0xffF5F5F5);
  static const Color textFieldColors = Color(0xffF2F2F2);
  static const Color blackColors = Color(0xff000000);
  static const Color grayColors = Color(0xffB5B2B2);
  static const Color whiteColors = Color(0xffFFFFFF);
  static const Color greenColors = Color(0xff22d70e);
  static const Color textColors = Color(0xff3F4254);
  static const Color primaryColor = Color(0xFF2697FF);
  static const Color secondaryColor = Color(0xFF2A2D3E);
  static const Color bgColor = Color(0xFF2ba9e3);

  ///
  /// Register Managers here
  Overseer() {
    register(LoginFormManager, LoginFormManager());
    register(ForgetPasswordManager, ForgetPasswordManager());
    register(VerifyForgetPasswordManager, VerifyForgetPasswordManager());
    register(ResetPasswordManager, ResetPasswordManager());
    register(UserDataTableManager, UserDataTableManager());
    register(AddNewUserManager, AddNewUserManager());
    register(UpdateUserManager, UpdateUserManager());
    register(ViewRoleManager, ViewRoleManager());
    register(AllDownloadManager, AllDownloadManager());
    register(AllUploadManager, AllUploadManager());
    register(AllActivityManager, AllActivityManager());
    register(SpecificUserManager, SpecificUserManager());
    register(AllRevenueManager, AllRevenueManager());
    register(AllMemoryQuotaManager, AllMemoryQuotaManager());
    register(WorkSpaceManager, WorkSpaceManager());
    register(AddWorkSpaceNewManager, AddWorkSpaceNewManager());
    register(CorporateManager, CorporateManager());
  }

  /// Register the manager to this overseer to store in repository
  register(name, object) {
    repository[name] = object;
  }
  /// get the required manager from overseer when needed
  fetch(name) {
    return repository[name];
  }
}