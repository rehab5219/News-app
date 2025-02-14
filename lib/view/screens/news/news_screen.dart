import 'package:cubit_data/view/screens/news/widgets/new_widget.dart';
import 'package:cubit_data/view_model/cubit/news_cubit/news_cubit.dart';
import 'package:cubit_data/view_model/cubit/news_cubit/news_state.dart';
import 'package:cubit_data/view_model/utils/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class NewsScreen extends StatelessWidget {
  const NewsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SafeArea(
            child: TextFormField(
              controller: NewsCubit.get(context).searchController,
              decoration: InputDecoration(
                filled: false,
                hintText: "search",
                hintStyle: TextStyle(
                  color: AppColors.white,
                ),
                suffixIcon: IconButton(
                  onPressed: () {
                    NewsCubit.get(context).getNews();
                  },
                  icon: Icon(
                    Icons.search,
                    color: AppColors.white,
                  ),
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.sp),
                  borderSide: BorderSide(color: AppColors.white, width: 2.sp),
                ),
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.sp),
                  borderSide: BorderSide(color: AppColors.white, width: 2.sp),
                ),
                focusedBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(12.sp),
                  borderSide: BorderSide(color: AppColors.white, width: 2.sp),
                ),
              ),
            ),
          ),
          SizedBox(
            height: 12.sp,
          ),
          Expanded(
            child: BlocBuilder<NewsCubit, NewsState>(
              builder: (context, state) {
                if (state is GetNewsLoadingState) {
                  return Center(
                      child: CircularProgressIndicator()
                  );
                }
                return ListView.separated(
                  itemBuilder: (context, index) {
                    return NewWidget(
                      article: NewsCubit.get(context).news[index],
                    );
                  },
                  separatorBuilder: (context, index) => SizedBox(
                    height: 12.sp,
                  ),
                  itemCount: NewsCubit.get(context).news.length,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
