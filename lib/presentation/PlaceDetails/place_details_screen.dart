import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:travelapp/app_theme.dart';

class PlaceDetailsScreen extends StatefulWidget {
  const PlaceDetailsScreen({super.key});
  static const String id = 'place_details';

  @override
  State<PlaceDetailsScreen> createState() => _PlaceDetailsScreenState();
}

class _PlaceDetailsScreenState extends State<PlaceDetailsScreen> {
  final data = Get.arguments;
  @override
  Widget build(BuildContext context) {
    final landingBloc = data[2];
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.cover,
                  image: AssetImage(data[1]),
                ),
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 24.w),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(height: 25.h),
                  Expanded(
                    flex: 3,
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.offAllNamed('landing');
                          },
                          child: const Icon(
                            Icons.arrow_back,
                            size: 24,
                            color: AppTheme.white,
                          ),
                        ),
                        GestureDetector(
                          onTap: () {
                            if (data[0] == 'Baga Beach') {
                              landingBloc.localStorageService.isBagaBeachLiked =
                                  !landingBloc
                                      .localStorageService.isBagaBeachLiked;
                              setState(() {});
                            } else if (data[0] == 'Kuta Beach') {
                              landingBloc.localStorageService.isKutaBeachLiked =
                                  !landingBloc
                                      .localStorageService.isKutaBeachLiked;
                              setState(() {});
                            } else if (data[0] == 'Baga Beach Resort') {
                              landingBloc.localStorageService
                                      .isBagaBeachResortLiked =
                                  !landingBloc.localStorageService
                                      .isBagaBeachResortLiked;
                              setState(() {});
                            } else {
                              landingBloc
                                      .localStorageService.isKutaResortLiked =
                                  !landingBloc
                                      .localStorageService.isKutaResortLiked;
                              setState(() {});
                            }
                          },
                          child: CircleAvatar(
                            radius: 16,
                            backgroundColor: AppTheme.white,
                            child: Icon(
                                ((data[0] == 'Baga Beach')
                                        ? landingBloc.localStorageService
                                            .isBagaBeachLiked
                                        : (data[0] == 'Kuta Beach')
                                            ? landingBloc.localStorageService
                                                .isKutaBeachLiked
                                            : (data[0] == 'Baga Beach Resort')
                                                ? landingBloc
                                                    .localStorageService
                                                    .isBagaBeachResortLiked
                                                : landingBloc
                                                    .localStorageService
                                                    .isKutaResortLiked)
                                    ? Icons.favorite
                                    : Icons.favorite_outline,
                                color: ((data[0] == 'Baga Beach')
                                        ? landingBloc.localStorageService
                                            .isBagaBeachLiked
                                        : (data[0] == 'Kuta Beach')
                                            ? landingBloc.localStorageService
                                                .isKutaBeachLiked
                                            : (data[0] == 'Baga Beach Resort')
                                                ? landingBloc
                                                    .localStorageService
                                                    .isBagaBeachResortLiked
                                                : landingBloc
                                                    .localStorageService
                                                    .isKutaResortLiked)
                                    ? AppTheme.orange
                                    : AppTheme.black),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        data[0],
                        style: AppTheme.h1.copyWith(
                          color: AppTheme.white,
                        ),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.location_on,
                            size: 12,
                            color: AppTheme.white,
                          ),
                          SizedBox(width: 4.w),
                          Text(
                            'Goa, India',
                            style: AppTheme.h2.copyWith(
                              fontSize: 12.sp,
                              fontWeight: FontWeight.w500,
                              color: AppTheme.white,
                              fontFamily: 'Urbanist',
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  Padding(
                    padding: EdgeInsets.only(top: 23.h, bottom: 20.h),
                    child: Text(
                      'One of the most happening beaches in Goa, Baga Beach is where you\nwill find water sports, fine dining restaurants, bars, and clubs. Situated\nin North Goa, Baga Beach is bordered by Calangute and Anjuna\nBeaches.',
                      style: AppTheme.h3.copyWith(
                        fontWeight: FontWeight.w400,
                        fontSize: 12.sp,
                        color: AppTheme.white,
                        fontFamily: 'Urbanist',
                      ),
                    ),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      RatingBar(
                        initialRating: 4,
                        itemSize: 15,
                        itemPadding: EdgeInsets.only(right: 3.w, bottom: 4.h),
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
                      Text(
                        '4.8',
                        style: AppTheme.h3.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 12.sp,
                          color: AppTheme.white,
                          fontFamily: 'Urbanist',
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        '${data[3]}/person',
                        style: AppTheme.h2.copyWith(
                          fontSize: 14.sp,
                          color: AppTheme.white,
                          fontFamily: 'Urbanist',
                        ),
                      ),
                      Container(
                        alignment: Alignment.center,
                        height: 45.h,
                        width: 103.w,
                        decoration: BoxDecoration(
                            color: AppTheme.yellow,
                            borderRadius: BorderRadius.circular(15.r)),
                        child: GestureDetector(
                          onTap: () {},
                          child: Text(
                            'Book Now',
                            textAlign: TextAlign.center,
                            style: AppTheme.h3.copyWith(
                              fontSize: 14.sp,
                              color: AppTheme.black,
                              fontFamily: 'Urbanist',
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
