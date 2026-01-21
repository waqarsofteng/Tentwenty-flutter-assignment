import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:tentwenty_flutter_assignment/configs/color/app_colors.dart';
import 'package:tentwenty_flutter_assignment/configs/widgets/back_button.dart';
import 'package:tentwenty_flutter_assignment/view/seat_selection_screen.dart';
import '../bloc/movie_booking/movie_booking_bloc.dart';
import '../bloc/movie_booking/movie_booking_event.dart';
import '../bloc/movie_booking/movie_booking_state.dart';
import '../configs/images/image_urls.dart';
import '../configs/widgets/map_seat.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MovieBookingScreen extends StatelessWidget {
  const MovieBookingScreen({super.key});

  final List<String> dates = const [
    '5 Mar',
    '6 Mar',
    '7 Mar',
    '8 Mar',
    '9 Mar',
  ];

  final List<Map<String, String>> shows = const [
    {
      'time': '12:30',
      'hall': 'Cinetech + Hall 1',
      'price': '50\$',
      'bonus': '2500',
    },
    {'time': '13:30', 'hall': 'Cinetech', 'price': '75\$', 'bonus': '300'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.lightGrey,
      appBar: AppBar(
        backgroundColor: AppColors.white,
        elevation: 0,
        centerTitle: true,
        leading: CustomBackButton(iconColor: AppColors.black),
        title: Column(
          children: [
            Text(
              'The King’s Man',
              style: TextStyle(color: Colors.black, fontSize: 16.sp),
            ),
            SizedBox(height: 4.h),
            Text(
              'In Theaters December 22, 2021',
              style: TextStyle(
                color: Colors.blue,
                fontSize: 12.sp,
              ),
            ),
          ],
        ),
      ),
      body: Padding(
        padding: EdgeInsets.only(left: 20.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 30.h,
            ),
            Text(
              'Date',
              style: TextStyle(fontSize: 16.sp),
            ),
            SizedBox(height: 12.h),
            BlocBuilder<MovieBookingBloc, MovieBookingState>(
              builder: (context, state) {
                return SizedBox(
                  height: 32.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: dates.length,
                    itemBuilder: (context, index) {
                      final isSelected = state.selectedDateIndex == index;

                      return GestureDetector(
                        onTap: () {
                          context.read<MovieBookingBloc>().add(
                            SelectDateEvent(index),
                          );
                        },
                        child: Padding(
                          padding: EdgeInsets.only(right: 16.w),
                          child: Container(
                            height: 32.h,
                            width: 67.w,
                            alignment: Alignment.center,
                            decoration: BoxDecoration(
                              color: isSelected
                                  ? const Color(0xff6CC4F7)
                                  : AppColors.greyC,
                              borderRadius: BorderRadius.circular(10.r),
                            ),
                            child: Text(
                              dates[index],
                              style: TextStyle(
                                color: isSelected
                                    ? AppColors.white
                                    : AppColors.black,
                                fontSize: 12.sp,
                              ),
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
            SizedBox(height: 50.h),
            BlocBuilder<MovieBookingBloc, MovieBookingState>(
              builder: (context, state) {
                return SizedBox(
                  height: 250.h,
                  child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: shows.length,
                    itemBuilder: (context, index) {
                      final isSelected = state.selectedShowIndex == index;

                      return GestureDetector(
                        onTap: () {
                          context.read<MovieBookingBloc>().add(
                            SelectShowEvent(index),
                          );
                        },
                        child: Container(
                          height: 225.h,
                          width: 249.w,
                          margin: const EdgeInsets.only(right: 12),
                          child: _showCard(
                            time: shows[index]['time']!,
                            hall: shows[index]['hall']!,
                            price: shows[index]['price']!,
                            bonus: shows[index]['bonus']!,
                            selected: isSelected,
                          ),
                        ),
                      );
                    },
                  ),
                );
              },
            ),
            const Spacer(),
            GestureDetector(
              onTap: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (_) => const SeatSelectionScreen(),
                  ),
                );
              },
              child: Padding(
                padding: EdgeInsets.only(right: 20.w, bottom: 20.h),
                child: Container(
                  height: 50.h,
                  width: double.infinity,
                  alignment: Alignment.center,
                  decoration: BoxDecoration(
                    color: AppColors.blue,
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  child: Text(
                    'Select Seats',
                    style: TextStyle(
                      color: Colors.white,
                      fontWeight: FontWeight.w600,
                      fontSize: 14.sp,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _showCard({
    required String time,
    required String hall,
    required String price,
    required String bonus,
    bool selected = false,
  }) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Text(
              time,
              style: TextStyle(fontWeight: FontWeight.bold, fontSize: 12.sp),
            ),
            SizedBox(width: 4.w),
            Text(
              hall,
              style: TextStyle(fontSize: 12.sp, color: AppColors.grey),
            ),
          ],
        ),
        SizedBox(height: 10.h),
        Container(
          height: 145.h,
          width: 249.w,
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(12.r),
            border: Border.all(
              color: selected ? Colors.blue : AppColors.greyC,
              width: 1.5,
            ),
          ),
          child: Center(
            child: SizedBox(
              height: 113.h,
              width: 144.45.w,
              child: Column(
                children: [
                  SizedBox(
                    height: 20.h,
                    width: 144.45.w,
                    child: SvgPicture.asset(ImageUrls.MaskGroup),
                  ),
                  SeatMap(),
                ],
              ),
            ),
          ),
        ),
        SizedBox(height: 10.h),
        RichText(
          text: TextSpan(
            children: [
              TextSpan(
                text: 'From ',
                style: TextStyle(fontSize: 12.sp, color: AppColors.grey),
              ),
              TextSpan(
                text: price,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              TextSpan(
                text: ' or ',
                style: TextStyle(fontSize: 12.sp, color: AppColors.grey),
              ),
              TextSpan(
                text: bonus,
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),
              ),
              TextSpan(
                text: ' bonus ',
                style: TextStyle(
                  fontSize: 12.sp,
                  fontWeight: FontWeight.w700,
                  color: Colors.black,
                ),              ),
            ],
          ),
        ),
      ],
    );
  }
}
