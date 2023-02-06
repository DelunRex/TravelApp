import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../app_theme.dart';
import '../Landing/bloc/landing_bloc.dart';

class PlaceTile extends StatefulWidget {
  const PlaceTile({
    super.key,
    required this.title,
    required this.price,
    required this.path,
    required this.landingBloc,
  });

  final String title;
  final String price;
  final String path;
  final LandingBloc landingBloc;

  @override
  State<PlaceTile> createState() => _PlaceTileState();
}

class _PlaceTileState extends State<PlaceTile> {
  @override
  Widget build(BuildContext context) {
    return Card(
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.r)),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 8.h),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              width: 86.w,
              height: 100.h,
              child: Image.asset(
                widget.path,
                fit: BoxFit.cover,
              ),
            ),
            SizedBox(width: 10.w),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  widget.title,
                  style: AppTheme.h3.copyWith(
                    fontFamily: 'Urbanist',
                    color: AppTheme.black,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.h),
                  child: Text(
                    widget.price,
                    style: AppTheme.h3.copyWith(
                      fontSize: 14.sp,
                      fontWeight: FontWeight.w500,
                      fontFamily: 'Urbanist',
                      color: AppTheme.orange,
                    ),
                  ),
                ),
                Row(
                  children: [
                    RatingBar(
                      initialRating: 4,
                      itemSize: 14,
                      itemPadding: EdgeInsets.only(right: 3.w),
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
                        color: AppTheme.black,
                        fontFamily: 'Urbanist',
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 5.h),
                  child: Text(
                    'A resort is a place used for\nvacation, relaxation or as a day...',
                    style: AppTheme.h3.copyWith(
                      fontSize: 12.sp,
                      fontWeight: FontWeight.w400,
                      fontFamily: 'Urbanist',
                      color: const Color(0xFF767676),
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.only(left: 10.w),
              child: GestureDetector(
                onTap: () {
                  if (widget.title == 'Baga Beach Resort') {
                    widget.landingBloc.localStorageService
                            .isBagaBeachResortLiked =
                        !widget.landingBloc.localStorageService
                            .isBagaBeachResortLiked;
                    setState(() {});
                  } else {
                    widget.landingBloc.localStorageService.isKutaResortLiked =
                        !widget
                            .landingBloc.localStorageService.isKutaResortLiked;
                    setState(() {});
                  }
                },
                child: Align(
                    alignment: Alignment.topRight,
                    child: CircleAvatar(
                      radius: 16,
                      backgroundColor: AppTheme.white,
                      child: Icon(
                          ((widget.title == 'Baga Beach Resort')
                                  ? widget.landingBloc.localStorageService
                                      .isBagaBeachResortLiked
                                  : widget.landingBloc.localStorageService
                                      .isKutaResortLiked)
                              ? Icons.favorite
                              : Icons.favorite_outline,
                          color: ((widget.title == 'Baga Beach Resort')
                                  ? widget.landingBloc.localStorageService
                                      .isBagaBeachResortLiked
                                  : widget.landingBloc.localStorageService
                                      .isKutaResortLiked)
                              ? AppTheme.orange
                              : AppTheme.black),
                    )),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
