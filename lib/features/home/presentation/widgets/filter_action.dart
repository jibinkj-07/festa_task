import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/utils/constants/app_colors.dart';
import '../../../../core/utils/styles/app_font.dart';
import '../provider/home_provider.dart';

class FilterAction extends StatelessWidget {
  final bool isTab;
  final ValueNotifier<String> filter;

  const FilterAction({Key? key, required this.filter, required this.isTab})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final homeProvider = Provider.of<HomeProvider>(context, listen: false);
    return ValueListenableBuilder(
        valueListenable: filter,
        builder: (ctx, filterOption, _) {
          return PopupMenuButton(
            shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10.0)),
            position: PopupMenuPosition.under,
            itemBuilder: (ctx) => [
              PopupMenuItem(
                onTap: () {
                  filter.value = "Male";
                  homeProvider.filter("Male");
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Male",
                        style: AppFont.bodyText(
                          color: filterOption == "Male"
                              ? AppColors.primaryColor
                              : null,
                        )),
                    if (filterOption == "Male")
                      const Icon(
                        Icons.check_circle,
                        color: AppColors.primaryColor,
                      ),
                  ],
                ),
              ),
              PopupMenuItem(
                  onTap: () {
                    filter.value = "Female";
                    homeProvider.filter("Female");
                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Female",
                          style: AppFont.bodyText(
                            color: filterOption == "Female"
                                ? AppColors.primaryColor
                                : null,
                          )),
                      if (filterOption == "Female")
                        const Icon(
                          Icons.check_circle,
                          color: AppColors.primaryColor,
                        ),
                    ],
                  )),
              PopupMenuItem(
                onTap: () {
                  filter.value = "";
                  homeProvider.filter("");
                },
                child:
                    Text("Clear", style: AppFont.bodyText(color: Colors.red)),
              ),
            ],
            child: Container(
              decoration: isTab
                  ? BoxDecoration(
                      borderRadius: BorderRadius.circular(20.0),
                      color: AppColors.primaryColor,
                    )
                  : null,
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  const Icon(Icons.filter_alt_rounded, color: Colors.white),
                  Text("FILTER", style: AppFont.bodyText(color: Colors.white)),
                ],
              ),
            ),
          );
        });
  }
}
