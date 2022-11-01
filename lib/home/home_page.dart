import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:provider/provider.dart';
import 'package:sl_ui_kit/home/widget/banner.dart';
import 'package:sl_ui_kit/home/widget/calendar.dart';
import 'package:sl_ui_kit/view_model/calendar_view_model.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> with AutomaticKeepAliveClientMixin {
  CalendarViewModel calendarViewModel = CalendarViewModel();

  @override
  void initState() {
    super.initState();
    calendarViewModel.getWeatherData();
  }

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [ChangeNotifierProvider(create: (ctx) => calendarViewModel)],
      builder: (ctx, _) {
        return CustomScrollView(
          slivers: [
            SliverToBoxAdapter(
              child: SizedBox(
                height: 175.w,
                child: HomeBanner(),
              ),
            ),
            const SliverToBoxAdapter(
              child: WeatherWidget(),
            )
          ],
        );
      },
    );
  }
  @override
  void dispose() {
    super.dispose();
  }

  @override
  bool get wantKeepAlive => true;
}
