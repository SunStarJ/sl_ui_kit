import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class BaseScaffold extends StatefulWidget {
  bool showTitle;
  String title;
  Color? appBarColor;
  Color? bottomsSelectedItemColor;
  Color? bottomsUnselectedItemColor;
  List<Widget>? actions;
  ValueSetter<int>? pageChange;
  List<BottomNavigationBarItem>? bottomBarList;
  Widget child;

  BaseScaffold(
      {Key? key,
      this.showTitle = false,
      this.title = "",
      this.appBarColor,
      this.pageChange,
      this.actions,
      this.bottomBarList,
      this.bottomsSelectedItemColor,
      this.bottomsUnselectedItemColor,
      required this.child})
      : super(key: key);

  @override
  State<BaseScaffold> createState() => _BaseScaffoldState();
}

class _BaseScaffoldState extends State<BaseScaffold> {
  int index = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: widget.showTitle
          ? AppBar(
              title: Text(widget.title),
              centerTitle: true,
            )
          : null,
      body: widget.child,
      bottomNavigationBar: widget.bottomBarList == null
          ? null
          : BottomNavigationBar(
              currentIndex: index,
              onTap: (index) {
                setState(() {
                  this.index = index;
                });
                widget.pageChange?.call(index);
              },
              items: widget.bottomBarList!,
              selectedItemColor: widget.bottomsSelectedItemColor ??
                  Theme.of(context).primaryColor,
              unselectedItemColor: widget.bottomsUnselectedItemColor ??
                  Theme.of(context).unselectedWidgetColor,
            ),
    );
  }
}
