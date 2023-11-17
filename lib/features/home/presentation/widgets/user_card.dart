import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../common/domain/entity/user_entity.dart';
import 'user_info_slider.dart';

class UserCard extends StatelessWidget {
  final UserEntity user;
  final bool isTab;

  const UserCard({Key? key, required this.user, required this.isTab})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Container(
      margin: const EdgeInsets.all(15.0),
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15.0),
          border: Border.all(
            width: 1.0,
            color: Colors.grey,
          )),
      child: Column(
        children: [
          Expanded(
            child: SizedBox.expand(
              child: Stack(
                alignment: AlignmentDirectional.bottomCenter,
                children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    right: 0,
                    child: Container(
                      width: size.width,
                      height: size.height * .11,
                      decoration: const BoxDecoration(
                        borderRadius:
                            BorderRadius.vertical(top: Radius.circular(13.0)),
                        color: AppColors.primaryColor,
                      ),
                    ),
                  ),
                  Container(
                    height: isTab ? size.width * .1 : size.width * .3,
                    width: isTab ? size.width * .1 : size.width * .3,
                    padding: const EdgeInsets.all(5.0),
                    decoration: const BoxDecoration(
                        color: AppColors.primaryColor, shape: BoxShape.circle),
                    clipBehavior: Clip.hardEdge,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(500.0),
                      child: CachedNetworkImage(
                        imageUrl: user.imageUrl,
                        fit: BoxFit.cover,
                        progressIndicatorBuilder:
                            (context, url, downloadProgress) =>
                                CircularProgressIndicator(
                          value: downloadProgress.progress,
                          color: AppColors.primaryColor,
                        ),
                        errorWidget: (context, url, error) => const Icon(
                          Icons.error,
                          color: Colors.red,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(child: UserInfoSlider(user: user)),
        ],
      ),
    );
  }
}
