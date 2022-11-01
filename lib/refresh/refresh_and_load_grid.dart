import 'package:easy_refresh/easy_refresh.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sl_ui_kit/base/base_scaffold.dart';
import 'package:sl_ui_kit/view_model/refresh_view_model.dart';

class RefreshGridPage extends StatefulWidget {
  const RefreshGridPage({Key? key}) : super(key: key);

  @override
  State<RefreshGridPage> createState() => _RefreshGridPageState();
}

class _RefreshGridPageState extends State<RefreshGridPage> {
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
        title: "刷新表格",
        showTitle: true,
        child: EasyRefresh(
          controller: controller,
          child: ChangeNotifierProvider(
            create: (_) => _refreshViewModel,
            builder: (ctx, _) {
              return GrideChild();
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

class GrideChild extends StatelessWidget {
  const GrideChild({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var dataList = context.watch<RefreshViewModel>().dataList;

    return dataList.isEmpty
        ? const Center(
            child: Text("空布局"),
          )
        : GridView.builder(
            itemBuilder: (ctx, index) => Container(
              child: Center(
                child: Text(dataList[index].toString()),
              ),
            ),
            itemCount: dataList.length,
            gridDelegate:
                const SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
          );
  }
}
