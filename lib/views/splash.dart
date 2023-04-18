import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../constants.dart';
import '../controllers/splash.controller.dart';
import '../route/route.name.dart';
import '../widgets/custom.text.dart';

class Splash extends GetView<SplashController> {
  Splash({Key? key}) : super(key: key);

  SplashController splashController = Get.put(SplashController());
  PageController pageController = PageController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: PageView.builder(
          controller: pageController,
          scrollDirection: Axis.horizontal,
          itemCount: 3,
          itemBuilder: (context, index) => Stack(
            children: [
              _buildCarousel(),
              Center(
                child: Stack(
                  children: [
                    SizedBox(
                      height: 100,
                      child: Positioned(
                        top: 379.h,
                        child: CustomText(
                          text:
                              "Get the latest and updated Articles Easily with us",
                          colour: AppColours.primaryWhite,
                          weight: FontWeight.w700,
                          size: 20.sp,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Stack(
                children: [
                  Positioned(
                    bottom: 40.h,
                    left: 16.w,
                    child: Obx(
                      () => AnimatedSmoothIndicator(
                        activeIndex: splashController.currentIntegerIndex.value,
                        count: 3,
                        effect: ExpandingDotsEffect(
                          dotColor: AppColours.primaryWhite,
                          activeDotColor: AppColours.primaryWhite,
                          expansionFactor: 2,
                          radius: 5.r,
                          dotWidth: 8.w,
                          dotHeight: 4.h,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
              Stack(
                children: [
                  Positioned(
                    bottom: 34.h,
                    right: 20.w,
                    child: GestureDetector(
                      onTap: () {
                        Get.toNamed(RouteName.landingPage);
                      },
                      child: Obx(
                        () => CustomText(
                          // if current index is equal to 2, change "skip" to "continue"
                          text: splashController.currentIntegerIndex.value == 2
                              ? "Continue"
                              : "Skip",
                          colour: AppColours.primaryBlack,
                          weight: FontWeight.w400,
                          size: 20.sp,
                          style: FontStyle.italic,
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
    );
  }

  Widget _buildCarousel() {
    return CarouselSlider(
      items: [
        Stack(
          children: [
            Image.asset("images/news.jpg"),
            Positioned(
              top: 440.h,
              right: 10.w,
              left: 10.w,
              child: SizedBox(
                height: 100,
                width: 400,
                child: CustomText(
                  text:
                      "Come on, get the latest articles and updates everyday and add insight, your trusted knowledge with us",
                  colour: AppColours.primaryWhite,
                  weight: FontWeight.w700,
                  size: 16.sp,
                ),
              ),
            ),
          ],
        ),
        Stack(
          children: [
            Image.asset("images/new.jpg"),
            Positioned(
              top: 440.h,
              left: 20.w,
              right: 10.w,
              child: SizedBox(
                height: 100,
                width: 400,
                child: CustomText(
                  text:
                      "Come on, get the latest articles and updates everyday and add insight, your trusted knowledge with us",
                  colour: AppColours.primaryWhite,
                  weight: FontWeight.w700,
                  size: 16.sp,
                ),
              ),
            )
          ],
        ),
        Stack(
          children: [
            Image.asset("images/break.jpg"),
            Positioned(
              top: 440.h,
              right: 12.w,
              left: 10.w,
              child: SizedBox(
                height: 100,
                width: 400,
                child: CustomText(
                  text:
                      "Come on, get the latest articles and updates everyday and add insight, your trusted knowledge with us",
                  colour: AppColours.primaryWhite,
                  weight: FontWeight.w700,
                  size: 16.sp,
                ),
              ),
            ),
          ],
        ),
      ],
      options: CarouselOptions(
        // height: 667.h,
        aspectRatio: 375.w / 667.h,
        enableInfiniteScroll: false,
        viewportFraction: 1,
        onPageChanged: (index, reason) {
          splashController.swipePage(index, reason);
        },
      ),
    );
  }
}
