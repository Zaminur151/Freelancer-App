import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:flutter/gestures.dart';
import 'package:freelancer_app/app/view/color/color.dart';
import 'package:freelancer_app/app/view/style/text_style.dart';

class PopulerCategoryGrid extends StatelessWidget {
  final List<Map<String, String>> categories;

  const PopulerCategoryGrid({
    super.key,
    required this.categories,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      width: double.infinity,
      child: GridView.builder(
        padding: const EdgeInsets.symmetric(horizontal: 16),
        physics: const ScrollPhysics(),
        scrollDirection: Axis.horizontal,
        dragStartBehavior: DragStartBehavior.start,
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 1,
          mainAxisSpacing: 10,
          mainAxisExtent: 106
        ),
        itemCount: categories.length,
        itemBuilder: (context, index) {
          final item = categories[index];
          return Container(
            height: 94,
            padding: const EdgeInsets.all(10),
            decoration: BoxDecoration(
              color: AppColors.whiteColor,
              borderRadius: BorderRadius.circular(8),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SvgPicture.asset(item["icon"] ?? ""),
                const Spacer(),
                Text(
                  item["title"] ?? "",
                  style: TextStyles.regular12,
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}
