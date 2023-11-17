import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerUserCard extends StatelessWidget {
  const ShimmerUserCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Container(
      // padding: const EdgeInsets.all(20.0),
      margin: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(width: 1.0, color: Colors.grey)),
      child: Column(
        children: [
          Expanded(
            child: SizedBox.expand(
              child: Shimmer.fromColors(
                baseColor: Colors.grey.withOpacity(.6),
                highlightColor: Colors.white.withOpacity(.2),
                child: Stack(
                  alignment: AlignmentDirectional.bottomCenter,
                  children: [
                    Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: Container(
                        height: size.height * .12,
                        decoration: const BoxDecoration(
                          borderRadius:
                              BorderRadius.vertical(top: Radius.circular(15.0)),
                          color: Colors.black,
                        ),
                      ),
                    ),
                    CircleAvatar(radius: size.width * .2),
                  ],
                ),
              ),
            ),
          ),
          Expanded(
              child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Shimmer.fromColors(
                baseColor: Colors.grey.withOpacity(.6),
                highlightColor: Colors.white.withOpacity(.2),
                child: Container(
                  width: 150.0,
                  height: 10.0,
                  margin: const EdgeInsets.symmetric(vertical: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.black,
                  ),
                ),
              ),
              Shimmer.fromColors(
                baseColor: Colors.grey.withOpacity(.6),
                highlightColor: Colors.white.withOpacity(.2),
                child: Container(
                  width: 200.0,
                  height: 10.0,
                  margin: const EdgeInsets.symmetric(vertical: 10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.black,
                  ),
                ),
              ),
              Shimmer.fromColors(
                baseColor: Colors.grey.withOpacity(.6),
                highlightColor: Colors.white.withOpacity(.2),
                child: Container(
                  width: double.infinity,
                  height: size.height*.04,
                  margin: const EdgeInsets.all(10.0),
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10.0),
                    color: Colors.black,
                  ),
                ),
              ),
            ],
          ))
        ],
      ),
    );
  }
}
