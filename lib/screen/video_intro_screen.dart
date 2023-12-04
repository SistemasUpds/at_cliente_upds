import 'package:at_cliente_upds/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:video_player/video_player.dart';
import 'home_screen.dart';
import 'package:lottie/lottie.dart';

class VideoIntroScreen extends StatefulWidget {
  const VideoIntroScreen({super.key});

  @override
  State<VideoIntroScreen> createState() => _VideoIntroScreenState();
}

class _VideoIntroScreenState extends State<VideoIntroScreen> {
  VideoPlayerController? _controller;

  @override
  void initState() {
    super.initState();
    _initializeVideoController();
  }

  Future<void> _initializeVideoController() async {
    _controller = VideoPlayerController.asset('assets/intro.mp4')
      ..initialize().then((_) {
        // Asegúrate de que el controlador de video está inicializado antes de reproducirlo
        setState(() {
          _controller!.play();
          _controller!.setLooping(true); // Reproducir en bucle
        });
      });
  }

  void _navigateToCarreraPage() {
    // Detener y liberar los controladores de video antes de navegar
    _controller?.pause();
    _controller?.dispose();

    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => const HomeScreen(),
      ),
    ).then((_) {
      _initializeVideoController();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: updsFondos,
        child: Stack(
          fit: StackFit.expand,
          children: [
            _controller!.value.isInitialized
                ? AspectRatio(
                    aspectRatio: _controller!.value.aspectRatio,
                    child: VideoPlayer(_controller!),
                  )
                : const Center(
                    child: SizedBox(
                      width: 50.0,
                      height: 50.0,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
                        strokeWidth: 4.0,
                      ),
                    ),
                  ),
            Center(
              child: ElevatedButton(
                style: ButtonStyle(
                  elevation: MaterialStateProperty.all<double>(0),
                  backgroundColor:
                      MaterialStateProperty.all<Color>(Colors.transparent),
                ),
                onPressed: () => _navigateToCarreraPage(),
                child: Lottie.asset(
                  'assets/lottie/comenzar.json', // Ruta al archivo Lottie JSON
                  height: 300, // Altura deseada
                  width: 300, // Ancho deseado
                  fit: BoxFit.contain,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    super.dispose();
    _controller?.dispose();
  }
}
