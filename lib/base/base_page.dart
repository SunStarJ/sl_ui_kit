import 'package:flutter/cupertino.dart';
import 'package:provider/provider.dart';
import 'package:sl_ui_kit/base/base_scaffold.dart';

abstract class BasePageState<T extends StatefulWidget> extends State<T> {
  late BuildContext providerContext;

  @override
  Widget build(BuildContext context) {
    return BaseScaffold(
        showTitle: showTitle(),
        actions: initActions(),
        title: initAppBarText(),
        child: initChild());
  }

  String initAppBarText();

  Widget initChild();

  List<Widget>? initActions() => null;

  bool showTitle() => true;
}

class _ChildWidget extends StatelessWidget {
  const _ChildWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container();
  }
}
