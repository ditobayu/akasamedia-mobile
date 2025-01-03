import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:toko_rame/core/constants/onboarding_contants.dart';
import 'package:toko_rame/core/theme/app_font.dart';
import 'package:toko_rame/features/onboarding/domain/entities/onboarding_content.dart';
import 'package:toko_rame/ui/widgets/buttons.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final CarouselSliderController carouselController1 =
      CarouselSliderController();

  final CarouselSliderController carouselController2 =
      CarouselSliderController();

  final List<OnboardingContent> data = OnboardingConstants.onboardingData;

  int currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const Image(image: AssetImage('assets/images/onboarding1.png')),
          CarouselSlider(
            items: [
              ...data.map((content) => Image(
                    fit: BoxFit.cover,
                    image: AssetImage(content.image),
                  )),
            ],
            options: CarouselOptions(
                height: MediaQuery.of(context).size.height * 0.8,
                viewportFraction: 1,
                enableInfiniteScroll: true,
                onPageChanged: (index, reason) {
                  setState(() {
                    currentIndex = index;
                  });
                }),
            carouselController: carouselController1,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: SizedBox(
              height:
                  MediaQuery.of(context).size.height * 0.2 + 21 + 40 + 34 + 34,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ...data.asMap().entries.map(
                        (entry) => AnimatedContainer(
                          curve: Curves.easeInOut,
                          duration: const Duration(milliseconds: 500),
                          width: currentIndex == entry.key ? 20 : 4,
                          height: 4,
                          margin: const EdgeInsets.symmetric(horizontal: 4),
                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(4),
                          ),
                        ),
                      )
                ],
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Wrap(
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 18, vertical: 34),
                  decoration: const BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(30),
                          topRight: Radius.circular(30))),
                  child: Column(
                    children: [
                      CarouselSlider(
                        items: [
                          ...data.map((content) => Column(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  Text(
                                    content.title,
                                    textAlign: TextAlign.center,
                                    style: AppTextStyles.title3,
                                  ),
                                  const SizedBox(height: 12),
                                  Text(
                                    textAlign: TextAlign.center,
                                    content.subtitle,
                                    style: AppTextStyles.xSmallNormalRegular,
                                  ),
                                ],
                              )),
                        ],
                        options: CarouselOptions(
                            // height is flexibe
                            height: MediaQuery.of(context).size.height * 0.2,
                            viewportFraction: 1,
                            enableInfiniteScroll: true,
                            onPageChanged: (index, reason) {
                              setState(() {
                                currentIndex = index;
                              });
                            }),
                        carouselController: carouselController2,
                      ),
                      CustomFilledButton(
                        title: "Selanjutnya",
                        onPressed: () {
                          if (currentIndex == data.length - 1) {
                            context.push('/');
                            return;
                          }
                          carouselController1.nextPage(
                              duration: const Duration(milliseconds: 500),
                              curve: Curves.easeInOut);
                          // given delay to make sure the carousel 1 is finished
                          Future.delayed(
                              const Duration(milliseconds: 100),
                              () => {
                                    carouselController2.nextPage(
                                        duration:
                                            const Duration(milliseconds: 500),
                                        curve: Curves.easeInOut),
                                    setState(() {
                                      currentIndex++;
                                    })
                                  });
                        },
                      )
                    ],
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
