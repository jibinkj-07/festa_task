import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/config/routes/app_routes.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/styles/app_font.dart';
import '../../../../core/utils/widgets/app_button.dart';
import '../../../../core/utils/widgets/custom_loading.dart';
import '../../../../core/utils/widgets/custom_snackbar.dart';
import '../../../auth/presentation/provider/auth_provider.dart';

class Profile extends StatelessWidget {
  Profile({Key? key}) : super(key: key);

  final ValueNotifier<bool> _signingOut = ValueNotifier(false);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Stack(
      children: [
        Container(
          width: double.infinity,
          padding: EdgeInsets.only(top: MediaQuery.of(context).viewPadding.top),
          color: AppColors.primaryColor,
          child: Consumer<AuthProvider>(builder: (ctx, authProvider, _) {
            final user = authProvider.authUser;
            if (user == null) {
              return const Center(child: CustomLoading());
            }
            return Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                // Image
                Container(
                  height: size.width * .55,
                  width: size.width * .55,
                  padding: const EdgeInsets.all(8.0),
                  decoration: const BoxDecoration(color: Colors.white, shape: BoxShape.circle),
                  clipBehavior: Clip.hardEdge,
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(500.0),
                    child: CachedNetworkImage(
                      imageUrl: user.imageUrl,
                      fit: BoxFit.cover,
                      progressIndicatorBuilder: (context, url, downloadProgress) => CircularProgressIndicator(
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

                // Name
                Text(
                  "${user.firstName} ${user.lastName}",
                  style: AppFont.headingLarge(color: Colors.white),
                ),

                // Email and Phone
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "email  : ${user.email}",
                      style: AppFont.bodyText(color: Colors.white),
                    ),
                    Text(
                      "phone  : ${user.phone}",
                      style: AppFont.bodyText(color: Colors.white),
                    ),
                  ],
                ),

                // logout button
                ValueListenableBuilder(
                    valueListenable: _signingOut,
                    builder: (ctx, signingOut, _) {
                      return AppButton(
                        color: Colors.white,
                        onPressed: signingOut
                            ? null
                            : () {
                                _signingOut.value = true;
                                Provider.of<AuthProvider>(context, listen: false).signOut().then((value) {
                                  if (value.isLeft) {
                                    _signingOut.value = false;
                                    CustomSnackBar.showErrorSnackBar(context, value.left.message);
                                  } else {
                                    Navigator.of(context).pushNamedAndRemoveUntil(AppRoutes.login, (route) => false);
                                  }
                                });
                              },
                        disabledColor: Colors.white,
                        child: Text(
                          signingOut ? "LOGGING OUT" : "LOG OUT",
                          style: AppFont.headingSmall(color: AppColors.primaryColor),
                        ),
                      );
                    }),
              ],
            );
          }),
        ),
        Positioned(
          top: size.height*.05,
          left: 10.0,
          child: IconButton(
            onPressed: () =>Navigator.pop(context),
            icon: const Icon(Icons.close_rounded),
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
