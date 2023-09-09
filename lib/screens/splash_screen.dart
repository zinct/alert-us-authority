import 'package:alertus/core/constants/router.dart';
import 'package:alertus/core/resources/images.dart';
import 'package:flutter/material.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen>
    with SingleTickerProviderStateMixin {
  void _handleChangeScreen() async {
    await Future.delayed(const Duration(milliseconds: 1400));

    if (context.mounted) {
      Navigator.of(context).pushReplacementNamed(ROUTER.login);
    }
  }

  late AnimationController _controller;
  late Animation<double> _rotateAnimation;

  void initState() {
    super.initState();
    _handleChangeScreen();

    // Inisialisasi AnimationController
    _controller = AnimationController(
      vsync: this,
      duration: Duration(milliseconds: 1000),
    );

    // Definisikan animasi putaran
    _rotateAnimation = Tween<double>(
      begin: 0.25,
      end: 0, // 90 derajat dalam bentuk pecahan (1/4 putaran)
    ).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOutBack, // Ubah ini sesuai keinginan Anda
      ),
    );

    // Tambahkan listener untuk memperbarui tampilan saat animasi berubah
    _rotateAnimation.addListener(() {
      setState(() {});
    });

    // Mulai animasi
    _controller.forward();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Transform.rotate(
            angle: _rotateAnimation.value *
                2 *
                3.14159265359, // Konversi ke radian
            child: GestureDetector(
              onTap: () {
                if (_controller.status == AnimationStatus.completed) {
                  _controller.reverse();
                } else {
                  _controller.forward();
                }
              },
              child: Image.asset(
                BaseImages.commonLogo, // Gantilah dengan path gambar Anda
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
