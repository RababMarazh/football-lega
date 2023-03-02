import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class Curveeee extends StatelessWidget {
  const Curveeee({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 50.0),
        child: Container(
            child: Stack(
          children: [
            Opacity(
              opacity: 1,
              child: ClipPath(
                clipper: WaveClipperl(),
                child: Container(
                  color: Colors.black,
                  height: 200,
                ),
              ),
            ),
            ClipPath(
              clipper: WaveClipperl(),
              child: Container(
                color: Color.fromARGB(255, 238, 4, 4),
                height: 150,
              ),
            ),
              ClipPath(
              clipper: WaveClipperR(),
              child: Container(
                color: Color.fromARGB(255, 238, 4, 4),
                height: 200,
              ),
            ),
              ClipPath(
              clipper: WaveClipperR(),
              child: Container(
                color: Colors.black,
                height: 150,
              ),
            ),
            // Center(
            //   child: Lottie.network(
            //       'https://assets7.lottiefiles.com/packages/lf20_at9xlec9.json'),
            // )
          ],
        )),
      ),
    );
  }
}

class WaveClipperl extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    debugPrint(size.width.toString());
    var path = new Path();
    path.lineTo(0, 0);
    path.lineTo(size.width / 2, size.height);
    path.lineTo(0, size.height / 10);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
class WaveClipperR extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    debugPrint(size.width.toString());
    var path = new Path();
    path.lineTo(size.width, 0);
    path.lineTo(size.width / 2, size.height);
    path.lineTo(size.width, size.height / 10);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}
