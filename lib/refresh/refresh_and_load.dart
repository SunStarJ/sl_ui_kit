import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sl_ui_kit/base/base_scaffold.dart';
import 'package:sl_ui_kit/view_model/refresh_view_model.dart';

class RefreshListPage extends StatefulWidget {
  const RefreshListPage({Key? key}) : super(key: key);

  @override
  State<RefreshListPage> createState() => _RefreshListPageState();
}

class _RefreshListPageState extends State<RefreshListPage> {
  EasyRefreshController controller = EasyRefreshController();
  final RefreshViewModel _refreshViewModel = RefreshViewModel();

  @override
  void initState() {
    super.initState();
    _refreshViewModel.refreshList();
  }

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
      title: "刷新列表",
        showTitle: true,
        child: EasyRefresh(
      controller: controller,
      child: ChangeNotifierProvider(
        create: (_) => _refreshViewModel,
        builder: (ctx, _) {
          return ListChild();
        },
      ),
      onRefresh: () async {
        await _refreshViewModel.refreshList();
        return IndicatorResult.success;
      },
      onLoad: () async {
        await _refreshViewModel.loadModeList();
        return IndicatorResult.success;
      },
    ));
  }
}

class ListChild extends StatelessWidget {
  const ListChild({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    var dataList = context.watch<RefreshViewModel>().dataList;

    return dataList.isEmpty
        ? const Center(
            child: Text("空布局"),
          )
        : ListView.separated(
            itemBuilder: (ctx, index) => Container(
                  height: 40.w,
                  child: Center(
                    child: Text(dataList[index].toString()),
                  ),
                ),
            separatorBuilder: (ctx, _) => Container(
                  height: 1.w,
                  color: Colors.black54,
                ),
            itemCount: dataList.length);
  }
}
