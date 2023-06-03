import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../AppLayers/Streaming/Overseer.dart';
import '../AllActivitiesScreen/all_activities_main_screen.dart';
import '../UserScreens/AddNewUser/add_new_user_screen.dart';
import 'Tab_update_provider.dart';
import '../../constants.dart';
import '../../controllers/MenuController.dart';
import '../../responsive.dart';
import '../DownloadActivityScreen/AllDownloadActivity/download_activity_main_screen.dart';
import '../MainDashboardScreen/DashboardAllScreen/dashboard_main_screen.dart';
import '../MemoryQuotaScreen/AllMemoryQuota/memory_quota_main_screen.dart';
import '../RoleScreens/Widgets/header.dart';
import '../RoleScreens/ViewAllRoles/role_main_screen.dart';
import '../SettingsScreens/Components/setting_main_screen.dart';
import '../UploadActivityScreens/AllUploadActivity/upload_mctivity_main_screen.dart';
import '../UserScreens/AllUser/user_main_screen.dart';
import '../WorkspaceScreens/AllWorkSpace/workspace_main_screen.dart';
import 'components/side_menu.dart';

class MainScreen extends StatefulWidget {
   const MainScreen({super.key});
  @override
  State<MainScreen> createState() => _MainScreenState();
}
class _MainScreenState extends State<MainScreen> {
   int k = 0;
  final List<Widget> listWidget = [
    const DashboardMainScreen(),
    const WorkSpaceMainScreen(),
    const RolesMainScreen(),
    const UserMainScreen(),
    const AddUserDataScreen(),
    const MemoryQuotaMainScreen(),
    const AllActivitiesScreen(),
    const DownloadActivityMainScreen(),
    const UploadActivityMainScreen(),
    const SettingsMainScreen(),
  ];
  @override
  Widget build(BuildContext context) {
    final user = Provider.of<UpdateIndex>(context);
    // TODO
    return Scaffold(
      backgroundColor: Overseer.adminBgColors,
      key: context.read<MenuController2>().scaffoldKey,
      drawer: const SideMenu(),
      body: SafeArea(
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (Responsive.isDesktop(context))
               const Expanded(
                child: SideMenu(),
              ),
             Expanded(
              flex: 4,
              child: SingleChildScrollView(
                child: Column(
                  children: [
                    const Header(),
                    const SizedBox(height: defaultPadding),
                    Padding(
                      padding: const EdgeInsets.all(defaultPadding),
                      child: listWidget[user.index],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
