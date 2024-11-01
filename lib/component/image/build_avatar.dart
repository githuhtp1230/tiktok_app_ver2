import 'package:flutter/material.dart';

class BuildAvatar extends StatelessWidget {
  String avatarUrl;
  double? size;
  BoxDecoration? boxDecoration;

  BuildAvatar({super.key, required this.avatarUrl, this.size, this.boxDecoration});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: size ?? 50,
      height: size ?? 50,
      child: Stack(children: [
        Positioned(
          child: Container(
            width: size ?? 50,
            height: size ?? 50,
            // padding: const EdgeInsets.all(0.0),
            decoration: boxDecoration ?? BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(25),
            ),
            child: ClipRRect(
              child: Image(
                image: NetworkImage(avatarUrl),
                fit: BoxFit.cover,
                errorBuilder: (context, error, stackTrace) {
                  return Image.asset("assets/images/user_default.png",
                      width: size ?? 50, height: size ?? 50, fit: BoxFit.cover);
                },
              ),
            ),
          ),
        )
      ]),
    );
  }
}
