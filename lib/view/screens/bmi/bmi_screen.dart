// import 'package:cubit_data/view_model/cubit/bmi_cubit/bmi_cubit.dart';
// import 'package:cubit_data/view_model/cubit/bmi_cubit/bmi_state.dart';
// import 'package:cubit_data/view_model/service/local/shared_helper.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import '../../../../view_model/utils/app_assets.dart';
// import '../../../../view_model/utils/app_colors.dart';
// import '../../../view_model/service/local/shared_keys.dart';
// import '../../../view_model/utils/enums.dart';
//
// class BmiScreen extends StatelessWidget {
//   const BmiScreen({super.key});
//
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.bmiBackgroundColor,
//       body: SafeArea(
//         child: Padding(
//           padding: const EdgeInsets.all(10),
//           child: Column(
//             children: [
//               /// Gender
//               Expanded(
//                 child: BlocBuilder<BMICubit, BMIState>(
//                   buildWhen: (previous, current) {
//                     return current is ChangeGenderState;
//                   },
//                   builder: (context, state) {
//                     return Row(
//                       children: [
//                         Expanded(
//                           child: Material(
//                             color: (state as ChangeGenderState).gender ? AppColors.bmiGreyColor : AppColors.bmiDarkColor,
//                             child: InkWell(
//                               onTap: () {
//                                 SharedHelper.prefs?.getBool(SharedKeys.male);
//                               },
//                               borderRadius: BorderRadius.circular(12.sp),
//                               child: Container(
//                                 height: 200.sp,
//                                 width: 145.w,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(12.sp),
//                                   border: SharedHelper.prefs?.getBool(SharedKeys.male)?? true ? Border.all(
//                                     color: AppColors.bmiPinkColor,
//                                     width: 2.w,
//                                   ) : null,
//                                 ),
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     SvgPicture.asset(AppAssets.male),
//                                     SizedBox(
//                                       height: 12.sp,
//                                     ),
//                                     Text(
//                                       "Male",
//                                       style: TextStyle(
//                                         color: AppColors.bmiGreyLightColor,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                         SizedBox(
//                           width: 10.w,
//                         ),
//                         Expanded(
//                           child: Material(
//                             color: SharedHelper.prefs?.getBool(SharedKeys.female)?? true ?  AppColors.bmiGreyColor : AppColors.bmiDarkColor,
//                             borderRadius: BorderRadius.circular(12.sp),
//                             clipBehavior: Clip.antiAliasWithSaveLayer,
//                             child: InkWell(
//                               onTap: () {
//                                 SharedHelper.prefs?.getBool(SharedKeys.female)?? true;
//                               },
//                               child: Container(
//                                 height: 200.sp,
//                                 width: 145.w,
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(12.sp),
//                                   border: SharedHelper.prefs?.getBool(SharedKeys.female)?? true ? Border.all(
//                                     color: AppColors.bmiPinkColor,
//                                     width: 2.w,
//                                   ) : null,
//                                 ),
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   children: [
//                                     SvgPicture.asset(AppAssets.female),
//                                     SizedBox(
//                                       height: 12.sp,
//                                     ),
//                                     Text(
//                                       "Female",
//                                       style: TextStyle(
//                                         color: AppColors.bmiGreyLightColor,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ),
//                         ),
//                       ],
//                     );
//                   },
//                 ),
//               ),
//               SizedBox(
//                 height: 12.sp,
//               ),
//
//               /// Height
//               Expanded(
//                 child: Container(
//                   padding: EdgeInsets.all(12.sp),
//                   width: 1.sw,
//                   decoration: BoxDecoration(
//                     color: AppColors.bmiGreyColor,
//                     borderRadius: BorderRadius.circular(12.sp),
//                   ),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     children: [
//                       Text(
//                         "Height",
//                         style: TextStyle(
//                           color: AppColors.bmiGreyLightColor,
//                           fontSize: 20.sp,
//                         ),
//                       ),
//                       SizedBox(
//                         height: 12.sp,
//                       ),
//                       BlocBuilder<BMICubit, BMIState>(
//                         buildWhen: (previous, current) {
//                           return current is ChangeHeightState;
//                         },
//                         builder: (context, state) {
//                         return RichText(
//                           text: TextSpan(
//                             children: [
//                               TextSpan(
//                                 text: "${SharedHelper.prefs?.getDouble(SharedKeys.height) ?? 150.toStringAsFixed(2)} ",
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 38.sp,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               ),
//                               TextSpan(
//                                 text: "cm",
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 20.sp,
//                                 ),
//                               ),
//                             ],
//                           ),
//                         );
//                       },),
//                       SizedBox(
//                         height: 12.sp,
//                       ),
//                       Slider(
//                         value: SharedHelper.prefs?.getDouble(SharedKeys.height) ?? 150,
//                         min: 50,
//                         max: 250,
//                         activeColor: AppColors.bmiPinkColor,
//                         onChanged: (value) {
//                           SharedHelper.prefs?.getDouble(SharedKeys.height) ?? 150;
//                         },
//                       ),
//                     ],
//                   ),
//                 ),
//               ),
//               SizedBox(
//                 height: 12.sp,
//               ),
//
//               /// Weight & Age
//               Expanded(
//                 child: Row(
//                   children: [
//                     Expanded(
//                       child: Container(
//                         height: 200,
//                         width: 200,
//                         decoration: BoxDecoration(
//                           color: AppColors.bmiDarkColor,
//                           borderRadius: BorderRadius.circular(12.sp),
//                         ),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               "Weight",
//                               style: TextStyle(
//                                 color: AppColors.bmiGreyLightColor,
//                                 fontSize: 20.sp,
//                               ),
//                             ),
//                             BlocBuilder<BMICubit, BMIState>(
//                               buildWhen: (previous, current) {
//                                 return current is IncrementWeightState || current is DecrementWeightState;
//                               },
//                               builder: (context, state) {
//                               return Text(
//                                 "${SharedHelper.prefs?.getInt(SharedKeys.weight) ?? 60}",
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 38.sp,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               );
//                             },),
//                             SizedBox(
//                               height: 12.sp,
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 IconButton(
//                                   onPressed: () {
//                                     BlocProvider.of<BMICubit>(context).decrementWeight();
//                                   },
//                                   icon: CircleAvatar(
//                                     backgroundColor:
//                                         AppColors.bmiGreyLightColor,
//                                     child: SvgPicture.asset(AppAssets.min),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   width: 6.w,
//                                 ),
//                                 IconButton(
//                                   onPressed: () {
//                                     BlocProvider.of<BMICubit>(context).incrementWeight();
//                                   },
//                                   icon: CircleAvatar(
//                                     backgroundColor:
//                                         AppColors.bmiGreyLightColor,
//                                     child: SvgPicture.asset(AppAssets.max),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                     SizedBox(
//                       width: 12,
//                     ),
//                     Expanded(
//                       child: Container(
//                         height: 200,
//                         width: 200,
//                         decoration: BoxDecoration(
//                           color: AppColors.bmiGreyColor,
//                           borderRadius: BorderRadius.circular(12.sp),
//                         ),
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               "Age",
//                               style: TextStyle(
//                                 color: AppColors.bmiGreyLightColor,
//                                 fontSize: 20.sp,
//                               ),
//                             ),
//                             BlocBuilder<BMICubit, BMIState>(
//                               buildWhen: (previous, current) {
//                                 return current is IncrementAgeState || current is DecrementAgeState;
//                               },
//                               builder: (context, state) {
//                               return Text(
//                                 "${SharedHelper.prefs?.getInt(SharedKeys.age) ?? 26}",
//                                 style: TextStyle(
//                                   color: Colors.white,
//                                   fontSize: 38.sp,
//                                   fontWeight: FontWeight.bold,
//                                 ),
//                               );
//                             },),
//                             SizedBox(
//                               height: 12.sp,
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 IconButton(
//                                   onPressed: () {
//                                     BlocProvider.of<BMICubit>(context).decrementAge();
//                                   },
//                                   icon: CircleAvatar(
//                                     backgroundColor:
//                                         AppColors.bmiGreyLightColor,
//                                     child: SvgPicture.asset(AppAssets.min),
//                                   ),
//                                 ),
//                                 SizedBox(
//                                   width: 6.w,
//                                 ),
//                                 IconButton(
//                                   onPressed: () {
//                                     BlocProvider.of<BMICubit>(context).incrementAge();
//                                   },
//                                   icon: CircleAvatar(
//                                     backgroundColor:
//                                         AppColors.bmiGreyLightColor,
//                                     child: SvgPicture.asset(AppAssets.max),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                           ],
//                         ),
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//               SizedBox(
//                 height: 15,
//               ),
//               SizedBox(
//                 width: 1.sw,
//                 height: 100,
//                 child: ElevatedButton(
//                   onPressed: () {},
//                   child: Text(
//                     "Calculate",
//                     style: TextStyle(
//                       color: Colors.white,
//                       fontSize: 27.sp,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   style: ElevatedButton.styleFrom(
//                     backgroundColor: AppColors.bmiPinkColor,
//                     // Shadow color
//                     // Elevation (shadow depth)
//                     shape: RoundedRectangleBorder(
//                       borderRadius:
//                           BorderRadius.circular(15), // Rounded corners
//                     ),
//                   ),
//                 ),
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
