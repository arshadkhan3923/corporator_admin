import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../AppLayers/Streaming/Observer.dart';
import '../../../AppLayers/Streaming/Overseer.dart';
import '../../../AppLayers/Streaming/Provider.dart';
import '../../../constants.dart';
import '../../UserScreens/AllUser/userDataTableManager.dart';
import '../../UserScreens/AllUser/user_data_table_model.dart';

class DashboardUserDataTable extends StatefulWidget {
  const DashboardUserDataTable({super.key});
  @override
  State<DashboardUserDataTable> createState() => _DashboardUserDataTableState();
}
class _DashboardUserDataTableState extends State<DashboardUserDataTable> {
  @override
  Widget build(BuildContext context) {
    UserDataTableManager userDataTableManager =
    Provider.of(context).fetch(UserDataTableManager);
    return Observer<List<UserModel>>(
        stream: userDataTableManager.mainList,
        onSuccess: (context,snapshot) {
          List<UserModel>? data = snapshot;
          UserModel modelData = data![0];
          return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: SingleChildScrollView(
              child: DataTable(
                horizontalMargin: 0,
                columnSpacing: MediaQuery.of(context).size.width *.085,
                columns: [
                  DataColumn(
                    label: Row(
                      children: [
                        SizedBox(width: 15.w,),
                        Text("ID",
                          style: TextStyle(
                              color: Overseer.grayColors,
                              fontSize: 22.sp
                          ),
                        ),
                        Icon(Icons.arrow_drop_down, size: 22.sp,
                          color: Overseer.grayColors,),
                      ],
                    ),
                  ),
                  DataColumn(
                    label: Row(
                      children: [
                        Text("Name",
                          style: TextStyle(
                              color: Overseer.grayColors,
                              fontSize: 22.sp
                          ),
                        ),
                        Icon(Icons.arrow_drop_down, size: 22.sp,
                          color: Overseer.grayColors,),
                      ],
                    ),
                  ),
                  DataColumn(
                    label: Row(
                      children: [
                        Text("Email",
                          style: TextStyle(
                              color: Overseer.grayColors,
                              fontSize: 22.sp
                          ),
                        ),
                        Icon(Icons.arrow_drop_down, size: 22.sp,
                          color: Overseer.grayColors,),
                      ],
                    ),
                  ),
                ],
                rows: List.generate(modelData.data!.length > 3 ? 3 : modelData.data!.length, (index){
                  return DataRow(
                    cells: [
                      DataCell(
                        Padding(
                          padding:  const EdgeInsets.symmetric(
                              horizontal: defaultPadding
                          ),
                          child: Text(modelData.data![index].id.toString(),
                            style: TextStyle(
                              color: Overseer.textColors,
                              fontSize: 20.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                      ),
                      DataCell(
                        Text(modelData.data![index].name.toString(),
                          style: TextStyle(
                            color: Overseer.textColors,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      DataCell(
                        Text(modelData.data![index].email.toString(),
                          style: TextStyle(
                            color: Overseer.textColors,
                            fontSize: 20.sp,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                    ],
                  );
                }
                ),
              ),
            ),
          );
        },
      onWaiting: (context){
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
      onError: (context,error){
        return const Text("Check Your Internet");
      },
    );
  }
}
