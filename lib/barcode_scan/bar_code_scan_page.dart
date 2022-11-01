import 'package:fast_barcode_scanner/fast_barcode_scanner.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sl_ui_kit/base/base_page.dart';
import 'package:quickalert/quickalert.dart';

class BarCodeScanPage extends StatefulWidget {
  const BarCodeScanPage({Key? key}) : super(key: key);

  @override
  State<BarCodeScanPage> createState() => _BarCodeScanPageState();
}

class _BarCodeScanPageState extends BasePageState<BarCodeScanPage> {
  @override
  String initAppBarText() => "";

  @override
  bool showTitle() => false;

  @override
  Widget initChild() => BarcodeCamera(
        types: const [
          BarcodeType.ean8,
          BarcodeType.ean13,
          BarcodeType.code128,
          BarcodeType.qr
        ],
        resolution: Resolution.hd720,
        framerate: Framerate.fps30,
        mode: DetectionMode.pauseVideo,
        onScan: (code) {
          print("=============scan==========");
          print(code.value);
          QuickAlert.show(
                  context: context,
                  type: QuickAlertType.success,
                  title: "扫码成功",
                  text: "二维码类型:${code.type},二维码内容：${code.value}")
              .then((value) {
            Navigator.of(context).pop();
          });
        },
        children: [
          MaterialPreviewOverlay(animateDetection: false),
          BlurPreviewOverlay(),
          // Positioned(
          //   child: ElevatedButton(
          //     onPressed: () =>
          //         CameraController.instance.resumeDetector(),
          //     child: Text('Resume'),
          //   ),
          // )
        ],
      );
}
