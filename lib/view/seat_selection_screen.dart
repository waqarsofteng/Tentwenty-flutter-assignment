// import 'package:flutter/material.dart';
// import 'package:flutter_bloc/flutter_bloc.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// import 'package:tentwenty_flutter_assignment/configs/images/image_urls.dart';
// import 'package:tentwenty_flutter_assignment/configs/widgets/back_button.dart';
// import '../bloc/seat_selection/seat_bloc.dart';
// import '../bloc/seat_selection/seat_event.dart';
// import '../bloc/seat_selection/seat_state.dart';
// import '../configs/color/app_colors.dart';
// import '../configs/widgets/seat_layout.dart';
//
// class SeatSelectionScreen extends StatefulWidget {
//   const SeatSelectionScreen({super.key});
//
//   @override
//   State<SeatSelectionScreen> createState() => _SeatSelectionScreenState();
// }
//
// class _SeatSelectionScreenState extends State<SeatSelectionScreen> {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       backgroundColor: AppColors.lightGrey,
//       appBar: AppBar(
//         elevation: 0,
//         backgroundColor: AppColors.white,
//         centerTitle: true,
//         leading: CustomBackButton(iconColor: AppColors.black),
//         title: Column(
//           children: [
//             Text(
//               'The King’s Man',
//               style: TextStyle(color: AppColors.black, fontSize: 16.sp),
//             ),
//             SizedBox(height: 4.h),
//             Text(
//               'March 5, 2021 | 12:30 Hall 1',
//               style: TextStyle(color: Colors.blue, fontSize: 12.sp),
//             ),
//           ],
//         ),
//       ),
//       body: Column(
//         children: [
//           SizedBox(height: 30.h),
//           //Center(child: SeatGrid(onSeatSelected: (seat, row, price) {})),
//           BlocBuilder<SeatBloc, SeatState>(
//             builder: (context, state) {
//               return Center(
//                 child: Transform.scale(
//                   scale: state.scale,
//                   child: Column(
//                     children: [
//                       SvgPicture.asset(ImageUrls.MaskGroup),
//                       Text(
//                         'SCREEN',
//                         style: TextStyle(color: Colors.grey, fontSize: 8.sp),
//                       ),
//                       SizedBox(height: 10.h),
//                       Row(
//                         children: [
//                           SizedBox(
//                             height: 145.52.h,
//                             child: Column(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text('1', style: TextStyle(fontSize: 5.38.sp, fontWeight: FontWeight.w700),),
//                                 Text('2', style: TextStyle(fontSize: 5.38.sp, fontWeight: FontWeight.w700),),
//                                 Text('3', style: TextStyle(fontSize: 5.38.sp, fontWeight: FontWeight.w700),),
//                                 Text('4', style: TextStyle(fontSize: 5.38.sp, fontWeight: FontWeight.w700),),
//                                 Text('5', style: TextStyle(fontSize: 5.38.sp, fontWeight: FontWeight.w700),),
//                                 Text('6', style: TextStyle(fontSize: 5.38.sp, fontWeight: FontWeight.w700),),
//                                 Text('7', style: TextStyle(fontSize: 5.38.sp, fontWeight: FontWeight.w700),),
//                                 Text('8', style: TextStyle(fontSize: 5.38.sp, fontWeight: FontWeight.w700),),
//                                 Text('9', style: TextStyle(fontSize: 5.38.sp, fontWeight: FontWeight.w700),),
//                               ],
//                             ),
//                           ),
//                           SizedBox(
//                             width: 10.w,
//                           ),
//                           SeatGrid(onSeatSelected: (seat, row, price) {}),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               );
//             },
//           ),
//           SizedBox(height: 40.h),
//           Align(
//             alignment: Alignment.bottomRight,
//             child: Padding(
//               padding: EdgeInsets.only(right: 10.w),
//               child: Row(
//                 mainAxisAlignment: MainAxisAlignment.end,
//                 children: [
//                   zoomButton(
//                     text: '-',
//                     onTap: () => context.read<SeatBloc>().add(ZoomOutEvent()),
//                   ),
//                   SizedBox(width: 20.w),
//                   zoomButton(
//                     text: '+',
//                     onTap: () => context.read<SeatBloc>().add(ZoomInEvent()),
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         Padding(
//           padding: EdgeInsets.all(20.sp),
//           child: Container(
//             height: 5.h,
//             width: .infinity,
//             decoration: BoxDecoration(
//               color: AppColors.greyC,
//               borderRadius: BorderRadius.circular(10.r)
//             ),
//           ),
//         ),
//         Spacer(),
//           Container(
//             height: 252.h,
//             color: AppColors.white,
//             child: Padding(
//               padding: EdgeInsets.all(21.sp),
//               child: Column(
//                 crossAxisAlignment: CrossAxisAlignment.start,
//                 children: [
//                   Row(
//                     children: [
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           _legend(ImageUrls.yellow, 'Selected'),
//                           SizedBox(height: 10.h),
//                           _legend(ImageUrls.pink, 'VIP (150\$)'),
//                         ],
//                       ),
//                       SizedBox(width: 30.w),
//                       Column(
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         children: [
//                           _legend(ImageUrls.grey, 'Not available'),
//                           SizedBox(height: 10.h),
//                           _legend(ImageUrls.blue, 'Regular (50 \$)'),
//                         ],
//                       ),
//                     ],
//                   ),
//                   SizedBox(height: 20.h),
//                   Container(
//                     height: 50.h,
//                     width: 108.w,
//                     decoration: BoxDecoration(
//                       color: AppColors.lightGrey,
//                       borderRadius: BorderRadius.circular(12),
//                     ),
//                     child: Padding(
//                       padding: EdgeInsets.all(8.sp),
//                       child: Row(
//                         mainAxisAlignment: MainAxisAlignment.center,
//                         children: [
//                           BlocBuilder<SeatBloc, SeatState>(
//                             builder: (context, state) {
//                               return RichText(
//                                 text: TextSpan(
//                                   children: [
//                                     TextSpan(
//                                       text: '${state.selectedSeat} ',
//                                       style: TextStyle(
//                                         fontSize: 14.sp,
//                                         color: Colors.black,
//                                       ),
//                                     ),
//                                     TextSpan(
//                                       text: '/ ${state.selectedRow} column',
//                                       style: TextStyle(
//                                         fontSize: 10.sp,
//                                         color: Colors.black,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               );
//                             },
//                           ),
//                           Spacer(),
//                           SizedBox(
//                             height: 20.h,
//                             child: SvgPicture.asset(ImageUrls.cross),
//                           ),
//                         ],
//                       ),
//                     ),
//                   ),
//                   SizedBox(height: 20.h),
//                   Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       Container(
//                         height: 50.h,
//                         width: 108.w,
//                         decoration: BoxDecoration(
//                           color: AppColors.lightGrey,
//                           borderRadius: BorderRadius.circular(12),
//                         ),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Text(
//                               'Total Price',
//                               style: TextStyle(
//                                 fontSize: 10.sp,
//                                 fontWeight: FontWeight.w400,
//                               ),
//                             ),
//                             BlocBuilder<SeatBloc, SeatState>(
//                               builder: (context, state) {
//                                 return Text(
//                                   '\$ ${state.totalPrice.toInt()}',
//                                   style: TextStyle(
//                                     fontSize: 16.sp,
//                                     fontWeight: FontWeight.w600,
//                                   ),
//                                 );
//                               },
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         height: 50.h,
//                         width: 216.w,
//                         child: ElevatedButton(
//                           style: ElevatedButton.styleFrom(
//                             backgroundColor: const Color(0xff64C7F5),
//                             elevation: 0,
//                             shape: RoundedRectangleBorder(
//                               borderRadius: BorderRadius.circular(12),
//                             ),
//                           ),
//                           onPressed: () {},
//                           child: Text(
//                             'Proceed to pay',
//                             style: TextStyle(
//                               fontSize: 14.sp,
//                               color: AppColors.white,
//                               fontWeight: FontWeight.w600,
//                             ),
//                           ),
//                         ),
//                       ),
//                     ],
//                   ),
//                 ],
//               ),
//             ),
//           ),
//         ],
//       ),
//     );
//   }
//
//   Widget _legend(String imagePath, String text) {
//     return Row(
//       mainAxisSize: MainAxisSize.min,
//       children: [
//         SizedBox(
//           height: 16.16.h,
//           width: 17.1.w,
//           child: SvgPicture.asset(imagePath),
//         ),
//         SizedBox(width: 6.w),
//         Text(
//           text,
//           style: TextStyle(fontSize: 12.sp, color: AppColors.greyC),
//         ),
//       ],
//     );
//   }
//
//
//   Widget zoomButton({required String text, required VoidCallback onTap}) {
//     return GestureDetector(
//       onTap: onTap,
//       child: Container(
//         height: 29.13.h,
//         width: 29.13.h,
//         decoration: BoxDecoration(
//           color: AppColors.white,
//           shape: BoxShape.circle,
//         ),
//         child: Center(
//           child: Text(
//             text,
//             style: TextStyle(fontSize: 18.sp),
//           ),
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:tentwenty_flutter_assignment/configs/images/image_urls.dart';
import 'package:tentwenty_flutter_assignment/configs/widgets/back_button.dart';
import '../bloc/seat_selection/seat_bloc.dart';
import '../bloc/seat_selection/seat_event.dart';
import '../bloc/seat_selection/seat_state.dart';
import '../configs/color/app_colors.dart';
import '../configs/widgets/seat_layout.dart';

class SeatSelectionScreen extends StatefulWidget {
  const SeatSelectionScreen({super.key});

  @override
  State<SeatSelectionScreen> createState() => _SeatSelectionScreenState();
}

class _SeatSelectionScreenState extends State<SeatSelectionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: AppColors.white,
        centerTitle: true,
        leading: CustomBackButton(iconColor: AppColors.black),
        title: Column(
          children: [
            Text(
              'The King’s Man',
              style: TextStyle(color: AppColors.black, fontSize: 16.sp),
            ),
            SizedBox(height: 4.h),
            Text(
              'March 5, 2021 | 12:30 Hall 1',
              style: TextStyle(color: Colors.blue, fontSize: 12.sp),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          SizedBox(height: 50.h),
          SizedBox(
            height: 300.h,
            child: BlocBuilder<SeatBloc, SeatState>(
              builder: (context, state) {
                return InteractiveViewer(
                  boundaryMargin: const EdgeInsets.all(20),
                  minScale: 0.6,
                  maxScale: 2.5,
                  scaleEnabled: true,
                  child: Center(
                    child: Transform.scale(
                      scale: state.scale,
                      child: Column(
                        children: [
                          SvgPicture.asset(ImageUrls.MaskGroup),
                          Text(
                            'SCREEN',
                            style: TextStyle(color: Colors.grey, fontSize: 8.sp),
                          ),
                          SizedBox(height: 10.h),
                          Row(
                            children: [
                              SizedBox(
                                height: 145.52.h,
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  children: List.generate(9, (index) {
                                    return Text(
                                      '${index + 1}',
                                      style: TextStyle(
                                          fontSize: 5.38.sp,
                                          fontWeight: FontWeight.w700),
                                    );
                                  }),
                                ),
                              ),
                              SizedBox(width: 10.w),
                              SeatGrid(onSeatSelected: (seat, row, price) {}),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          SizedBox(height: 30.h),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: EdgeInsets.only(right: 10.w),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  zoomButton(
                    text: '-',
                    onTap: () => context.read<SeatBloc>().add(ZoomOutEvent()),
                  ),
                  SizedBox(width: 20.w),
                  zoomButton(
                    text: '+',
                    onTap: () => context.read<SeatBloc>().add(ZoomInEvent()),
                  ),
                ],
              ),
            ),
          ),

          Padding(
            padding: EdgeInsets.all(20.sp),
            child: Container(
              height: 5.h,
              width: double.infinity,
              decoration: BoxDecoration(
                color: AppColors.greyC,
                borderRadius: BorderRadius.circular(10.r),
              ),
            ),
          ),

          Spacer(),
          Container(
            height: 252.h,
            color: AppColors.white,
            child: Padding(
              padding: EdgeInsets.all(21.sp),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _legend(ImageUrls.yellow, 'Selected'),
                          SizedBox(height: 10.h),
                          _legend(ImageUrls.pink, 'VIP (150\$)'),
                        ],
                      ),
                      SizedBox(width: 30.w),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          _legend(ImageUrls.grey, 'Not available'),
                          SizedBox(height: 10.h),
                          _legend(ImageUrls.blue, 'Regular (50 \$)'),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Container(
                    height: 50.h,
                    width: 108.w,
                    decoration: BoxDecoration(
                      color: AppColors.lightGrey,
                      borderRadius: BorderRadius.circular(12),
                    ),
                    child: Padding(
                      padding: EdgeInsets.all(8.sp),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          BlocBuilder<SeatBloc, SeatState>(
                            builder: (context, state) {
                              return RichText(
                                text: TextSpan(
                                  children: [
                                    TextSpan(
                                      text: '${state.selectedSeat} ',
                                      style: TextStyle(
                                        fontSize: 14.sp,
                                        color: Colors.black,
                                      ),
                                    ),
                                    TextSpan(
                                      text: '/ ${state.selectedRow} column',
                                      style: TextStyle(
                                        fontSize: 10.sp,
                                        color: Colors.black,
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                          Spacer(),
                          SizedBox(
                            height: 20.h,
                            child: SvgPicture.asset(ImageUrls.cross),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        height: 50.h,
                        width: 108.w,
                        decoration: BoxDecoration(
                          color: AppColors.lightGrey,
                          borderRadius: BorderRadius.circular(12),
                        ),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              'Total Price',
                              style: TextStyle(
                                fontSize: 10.sp,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                            BlocBuilder<SeatBloc, SeatState>(
                              builder: (context, state) {
                                return Text(
                                  '\$ ${state.totalPrice.toInt()}',
                                  style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.w600,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 50.h,
                        width: 216.w,
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            backgroundColor: const Color(0xff64C7F5),
                            elevation: 0,
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(12),
                            ),
                          ),
                          onPressed: () {},
                          child: Text(
                            'Proceed to pay',
                            style: TextStyle(
                              fontSize: 14.sp,
                              color: AppColors.white,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _legend(String imagePath, String text) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 16.16.h,
          width: 17.1.w,
          child: SvgPicture.asset(imagePath),
        ),
        SizedBox(width: 6.w),
        Text(
          text,
          style: TextStyle(fontSize: 12.sp, color: AppColors.greyC),
        ),
      ],
    );
  }

  Widget zoomButton({required String text, required VoidCallback onTap}) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 29.13.h,
        width: 29.13.h,
        decoration: BoxDecoration(
          color: AppColors.white,
          shape: BoxShape.circle,
        ),
        child: Center(
          child: Text(
            text,
            style: TextStyle(fontSize: 18.sp),
          ),
        ),
      ),
    );
  }
}