import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../AppLayers/Streaming/Observer.dart';
import '../../../AppLayers/Streaming/Overseer.dart';
import '../../../AppLayers/Streaming/Provider.dart';
import '../../../constants.dart';
import '../../WorkspaceScreens/AllWorkSpace/Workspace_Table_manager.dart';
import '../../WorkspaceScreens/AllWorkSpace/Workspace_Table_model.dart';

class DashboardWorkSpaceDataTable extends StatefulWidget {
  const DashboardWorkSpaceDataTable({Key? key}) : super(key: key);
  @override
  State<DashboardWorkSpaceDataTable> createState() =>
      _DashboardWorkSpaceDataTableState();
}
class _DashboardWorkSpaceDataTableState extends State<DashboardWorkSpaceDataTable> {
  @override
  Widget build(BuildContext context) {
    WorkSpaceManager workSpaceManager =
    Provider.of(context).fetch(WorkSpaceManager);
        return Observer<List<WorkSpaceModel>>(
          stream: workSpaceManager.mainList,
          onSuccess: (context,snapshot) {
            List<WorkSpaceModel>? data = snapshot;
            WorkSpaceModel modelData = data![0];
            return SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: SingleChildScrollView(
                child: DataTable(
                  columnSpacing: MediaQuery.of(context).size.width * 0.085,
                  columns: [
                    DataColumn(
                      label: Text("ID",
                        style: TextStyle(
                          color: Overseer.grayColors,
                          fontSize: 22.sp,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text("Name",
                        style: TextStyle(
                          color: Overseer.grayColors,
                          fontSize: 22.sp,
                        ),
                      ),
                    ),
                    DataColumn(
                      label: Text("Quota",
                        style: TextStyle(
                          color: Overseer.grayColors,
                          fontSize: 22.sp,
                        ),
                      ),
                    ),
                  ],
                  rows: List.generate(
                    modelData.data!.length > 3 ? 3 : modelData.data!.length,
                        (index) {
                      return DataRow(
                        cells: [
                          DataCell(
                            Padding(
                              padding: const EdgeInsets.symmetric(horizontal: defaultPadding),
                              child: Text(
                                modelData.data![index].ownerId.toString(),
                                style: TextStyle(
                                  color: Overseer.textColors,
                                  fontSize: 20.sp,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ),
                          ),
                          DataCell(
                            Text(
                              modelData.data![index].name.toString(),
                              style: TextStyle(
                                color: Overseer.textColors,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                          DataCell(
                            Text(
                              modelData.data![index].quota.toString(),
                              style: TextStyle(
                                color: Overseer.textColors,
                                fontSize: 20.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
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
