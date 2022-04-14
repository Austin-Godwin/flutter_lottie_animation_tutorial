import 'package:flutter/material.dart';

class BottomPart extends StatelessWidget {
  // final GestureTapCallback? onTap;
  final Function()? onTap;
  const BottomPart({Key? key, this.onTap}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Align(
        alignment: Alignment.bottomCenter,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Text(
                "Find The Best Coffee For You",
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 27.0,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 30.0),
              Text(
                "Lorem ipsum dolor sit amet, adipiscing elit. "
                "Nullam pulvinar dolor sed enim eleifend efficitur."
                "Lorem ipsum dolor sit amet, adipiscing elit. "
                "Nullam pulvinar dolor sed enim eleifend efficitur."
                "Lorem ipsum dolor sit amet, adipiscing elit. "
                "Nullam pulvinar dolor sed enim eleifend efficitur.",
                style: TextStyle(
                  color: Colors.white.withOpacity(0.8),
                  height: 1.5,
                  fontSize: 15.0,
                ),
              ),
              const SizedBox(height: 50.0),
              Align(
                alignment: Alignment.centerRight,
                child: Container(
                  height: 85.0,
                  width: 85.0,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white, width: 2.0),
                  ),
                  child: const Icon(
                    Icons.chevron_right,
                    color: Colors.white,
                    size: 50.0,
                  ),
                ),
              ),
              const SizedBox(height: 50.0),
            ],
          ),
        ),
      ),
    );
  }
}
