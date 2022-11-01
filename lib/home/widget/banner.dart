import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/cupertino.dart';

class HomeBanner extends StatelessWidget {
  HomeBanner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    List<String> imagePath = [
      "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fpic1.win4000.com%2Fwallpaper%2F2019-04-19%2F5cb972785fa64.jpg&refer=http%3A%2F%2Fpic1.win4000.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1665834995&t=3f55b76532bf0b20e2d6f6a636f4f157",
      "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimages.h128.com%2Fupload%2F201908%2F24%2F201908242357075674.jpg%3Fx-oss-process%3Dimage%2Fauto-orient%2C1%2Fresize%2Cm_fill%2Cw_1421%2Ch_599%2Fquality%2Cq_100%2Fformat%2Cjpg&refer=http%3A%2F%2Fimages.h128.com&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1665835109&t=0668c67d2703455a73f051a9e5922741",
      "https://gimg2.baidu.com/image_search/src=http%3A%2F%2Fimg11.51tietu.net%2Fpic%2F2019112210%2Fhyxrusv054vhyxrusv054v.jpg&refer=http%3A%2F%2Fimg11.51tietu.net&app=2002&size=f9999,10000&q=a80&n=0&g=0n&fmt=auto?sec=1665835139&t=bec439df9b1434f640b60ca54b28ee09"
    ];
    return Swiper(
      itemCount: 3,
      itemBuilder: (ctx, index) => Image.network(
        imagePath[index],
        fit: BoxFit.cover,
      ),
      pagination: const SwiperPagination(),
    );
  }
}
