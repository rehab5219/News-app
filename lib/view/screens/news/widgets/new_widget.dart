import 'package:cubit_data/model/article.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../../../../view_model/utils/app_colors.dart';

class NewWidget extends StatelessWidget {
  final Article article;
  const NewWidget({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(12.sp),
      clipBehavior: Clip.antiAliasWithSaveLayer,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(12.sp),
        border: Border.all(
          color: AppColors.white,
          width: 2,
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(12.sp),
            child: Image.network(
                article.image ?? "",
            ),
          ),
          SizedBox(
            height: 12.sp,
          ),
          Row(
            children: [
              Expanded(
                child: Text(
                  article.title ?? "",
                  style: TextStyle(
                    fontSize: 18.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.white,
                  ),
                ),
              ),
              SizedBox(width: 6.w),
              Align(
                alignment: Alignment.centerRight,
                child: Text(
                  article.publishAt ?? "",
                  style: TextStyle(
                    fontSize: 12.sp,
                    fontWeight: FontWeight.bold,
                    color: AppColors.bmiGreyLightColor,
                  ),
                ),
              ),
            ],
          ),
          SizedBox(
            height: 6.sp,
          ),
          Text(
            article.description ?? "",
            style: TextStyle(
              fontSize: 18.sp,
              fontWeight: FontWeight.bold,
              color: AppColors.bmiGreyLightColor,
            ),
          ),
        ],
      ),
    );
  }
}
