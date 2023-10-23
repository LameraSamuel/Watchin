import 'package:camerawesome/camerawesome_plugin.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';

class CameraPage extends StatelessWidget {
  bool isEntrada;
  CameraPage({super.key, required this.isEntrada});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: CameraAwesomeBuilder.awesome(
          saveConfig: SaveConfig.photoAndVideo(
            photoPathBuilder: () async {
              final directory = await getApplicationDocumentsDirectory();
              return '${directory.path}/photo.jpg';
            },
            videoPathBuilder: () async {
              final directory = await getApplicationDocumentsDirectory();
              return '${directory.path}/video.mp4';
            },
            initialCaptureMode: CaptureMode.photo,
          ),
          enablePhysicalButton: true,
          filter: AwesomeFilter.AddictiveRed,
          flashMode: FlashMode.auto,
          aspectRatio: CameraAspectRatios.ratio_16_9,
          previewFit: CameraPreviewFit.fitWidth,
          onMediaTap: (mediaCapture) {
            Navigator.pushNamed(context, '/Entrada');
          },
        ),
      ),
    );
  }
}
