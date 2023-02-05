import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:travelapp/presentation/Landing/bloc/landing_bloc.dart';
import 'package:travelapp/presentation/components/search_field.dart';

import '../../app_theme.dart';
import '../components/category_chip.dart';
import '../components/place_tile.dart';

class LandingScreen extends StatelessWidget {
  const LandingScreen({super.key});
  static const String id = 'landing';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBody: true,
      backgroundColor: AppTheme.white,
      body: SafeArea(
          child: BlocProvider(
        create: (context) => LandingBloc()..init(),
        child: const LandingBody(),
      )),
    );
  }
}

class LandingBody extends StatefulWidget {
  const LandingBody({super.key});

  @override
  State<LandingBody> createState() => _LandingBodyState();
}

class _LandingBodyState extends State<LandingBody> {
  static bool isSelected1 = true;
  static bool isSelected2 = false;

  @override
  Widget build(BuildContext context) {
    final landingBloc = context.read<LandingBloc>();
    return SingleChildScrollView(
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 24.w),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 38.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Row(
                  children: [
                    const CircleAvatar(
                      backgroundColor: AppTheme.darkgrey,
                      radius: 16,
                    ),
                    SizedBox(
                      width: 10.w,
                    ),
                    Text(
                      'Hello, Vineetha',
                      style: AppTheme.h3.copyWith(
                        fontSize: 17.sp,
                        fontWeight: FontWeight.w500,
                        fontFamily: 'Inter',
                        color: AppTheme.black,
                      ),
                    ),
                  ],
                ),
                SvgPicture.asset('assets/icons/notification_icon.svg'),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(top: 35.h, bottom: 30.h),
              child: Text(
                'Where do you\nwant to explore today ?',
                style: AppTheme.h1.copyWith(
                  color: AppTheme.black,
                ),
              ),
            ),
            TrackSearchField(
                controller: landingBloc.controller,
                node: landingBloc.textFieldNode),
            Padding(
              padding: EdgeInsets.only(top: 30.h, bottom: 20.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Choose Category',
                    style: AppTheme.h3.copyWith(
                      fontFamily: 'Inter',
                      color: AppTheme.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'See All',
                    style: AppTheme.h3.copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromRGBO(0, 0, 0, 0.25),
                      fontFamily: 'Inter',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 60.h,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isSelected1 = !isSelected1;
                      });
                    },
                    child: CategoryChip(
                      title: 'Beach',
                      active: isSelected1,
                      path: 'assets/icons/beach.jpg',
                    ),
                  ),
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        isSelected2 = !isSelected2;
                      });
                    },
                    child: CategoryChip(
                      title: 'Mountain',
                      active: isSelected2,
                      path: 'assets/icons/mountain.jpg',
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 20.h,
            ),
            SizedBox(
              height: 250.h,
              child: ListView(
                shrinkWrap: true,
                scrollDirection: Axis.horizontal,
                children: [
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 180.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/kuta_beach.jfif')),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 20.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 8.w, top: 8.h),
                              child: Align(
                                alignment: Alignment.topRight,
                                child: GestureDetector(
                                  onTap: () {
                                    landingBloc.localStorageService
                                            .isKutaBeachLiked =
                                        !landingBloc.localStorageService
                                            .isKutaBeachLiked;
                                    setState(() {});
                                  },
                                  child: CircleAvatar(
                                    radius: 16,
                                    backgroundColor: AppTheme.white,
                                    child: Icon(
                                        landingBloc.localStorageService
                                                .isKutaBeachLiked
                                            ? Icons.favorite
                                            : Icons.favorite_outline,
                                        color: landingBloc.localStorageService
                                                .isKutaBeachLiked
                                            ? AppTheme.orange
                                            : AppTheme.black),
                                  ),
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 135.h,
                            ),
                            Text(
                              'Kuta Beach',
                              style: AppTheme.h2.copyWith(
                                color: AppTheme.white,
                                fontFamily: 'Urbanist',
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 5.h),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.location_on,
                                    size: 12,
                                    color: AppTheme.white,
                                  ),
                                  SizedBox(width: 4.w),
                                  Text(
                                    'Bali Indonesia',
                                    style: AppTheme.h2.copyWith(
                                      fontSize: 12.sp,
                                      color: AppTheme.white,
                                      fontFamily: 'Urbanist',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            RatingBar(
                              initialRating: 4,
                              itemSize: 10,
                              itemPadding:
                                  EdgeInsets.only(right: 3.w, bottom: 4.h),
                              ratingWidget: RatingWidget(
                                full: const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                empty: const Icon(
                                  Icons.star,
                                  color: AppTheme.darkgrey,
                                ),
                                half: Container(),
                              ),
                              onRatingUpdate: (double value) {},
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(
                    width: 15.w,
                  ),
                  GestureDetector(
                    onTap: () {},
                    child: Container(
                      width: 180.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.r),
                        image: const DecorationImage(
                            fit: BoxFit.cover,
                            image: AssetImage('assets/images/baga_beach.jfif')),
                      ),
                      child: Padding(
                        padding: EdgeInsets.only(left: 20.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(right: 8.w, top: 8.h),
                              child: GestureDetector(
                                onTap: () {
                                  landingBloc.localStorageService
                                          .isBagaBeachLiked =
                                      !landingBloc
                                          .localStorageService.isBagaBeachLiked;
                                  setState(() {});
                                },
                                child: Align(
                                    alignment: Alignment.topRight,
                                    child: CircleAvatar(
                                      radius: 16,
                                      backgroundColor: AppTheme.white,
                                      child: Icon(
                                          landingBloc.localStorageService
                                                  .isBagaBeachLiked
                                              ? Icons.favorite
                                              : Icons.favorite_outline,
                                          color: landingBloc.localStorageService
                                                  .isBagaBeachLiked
                                              ? AppTheme.orange
                                              : AppTheme.black),
                                    )),
                              ),
                            ),
                            SizedBox(
                              height: 135.h,
                            ),
                            Text(
                              'Baga Beach',
                              style: AppTheme.h2.copyWith(
                                color: AppTheme.white,
                                fontFamily: 'Urbanist',
                              ),
                            ),
                            Padding(
                              padding: EdgeInsets.symmetric(vertical: 5.h),
                              child: Row(
                                children: [
                                  const Icon(
                                    Icons.location_on,
                                    size: 12,
                                    color: AppTheme.white,
                                  ),
                                  SizedBox(width: 4.w),
                                  Text(
                                    'Goa India',
                                    style: AppTheme.h2.copyWith(
                                      fontSize: 12.sp,
                                      color: AppTheme.white,
                                      fontFamily: 'Urbanist',
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            RatingBar(
                              initialRating: 4,
                              itemSize: 10,
                              itemPadding:
                                  EdgeInsets.only(right: 3.w, bottom: 4.h),
                              ratingWidget: RatingWidget(
                                full: const Icon(
                                  Icons.star,
                                  color: Colors.amber,
                                ),
                                empty: const Icon(
                                  Icons.star,
                                  color: AppTheme.darkgrey,
                                ),
                                half: Container(),
                              ),
                              onRatingUpdate: (double value) {},
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: EdgeInsets.only(top: 30.h, bottom: 20.h),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Popular Package',
                    style: AppTheme.h3.copyWith(
                      fontFamily: 'Inter',
                      color: AppTheme.black,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  Text(
                    'See All',
                    style: AppTheme.h3.copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w500,
                      color: const Color.fromRGBO(0, 0, 0, 0.25),
                      fontFamily: 'Inter',
                    ),
                  ),
                ],
              ),
            ),
            PlaceTile(
              path: 'assets/images/kuta_resort.jfif',
              title: 'Kuta Resort',
              price: '₹20,000',
              landingBloc: landingBloc,
            ),
            SizedBox(
              height: 10.h,
            ),
            PlaceTile(
              path: 'assets/images/baga_beach.jfif',
              title: 'Baga Beach Resort',
              price: '₹15,000',
              landingBloc: landingBloc,
            ),
          ],
        ),
      ),
    );
  }
}
