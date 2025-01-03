import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:toko_rame/core/constants/onboarding_contants.dart';
import 'package:toko_rame/core/theme/app_font.dart';
import 'package:toko_rame/features/onboarding/domain/entities/onboarding_content.dart';
import 'package:toko_rame/features/onboarding/presentation/widgets/onboarding_pagination.dart';
import 'package:toko_rame/ui/widgets/buttons.dart';

class OnboardingPage extends StatefulWidget {
  const OnboardingPage({super.key});

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  final CarouselSliderController imageCarouselController =
      CarouselSliderController();

  final CarouselSliderController textCarouselController =
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
            carouselController: imageCarouselController,
          ),
          OnboardingPagination(data: data, currentIndex: currentIndex),
          OnboardingDescriptions(
            currentIndex: currentIndex,
            contents: data,
            imageCarouselController: imageCarouselController,
            onPageChanged: (index) {
              setState(() {
                currentIndex = index;
              });
            },
            textCarouselController: textCarouselController,
          ),
        ],
      ),
    );
  }
}

class OnboardingDescriptions extends StatelessWidget {
  final List<OnboardingContent> contents;
  final Function(int) onPageChanged;
  final int currentIndex;
  final CarouselSliderController textCarouselController;
  final CarouselSliderController imageCarouselController;
  const OnboardingDescriptions(
      {super.key,
      required this.contents,
      required this.onPageChanged,
      required this.textCarouselController,
      required this.imageCarouselController,
      required this.currentIndex});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: Wrap(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 18, vertical: 34),
            decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(30),
                    topRight: Radius.circular(30))),
            child: Column(
              children: [
                CarouselSlider(
                  items: [
                    ...contents.map(
                        (content) => OnboardingContentDetail(content: content)),
                  ],
                  options: CarouselOptions(
                      // height is flexibe
                      height: MediaQuery.of(context).size.height * 0.2,
                      viewportFraction: 1,
                      enableInfiniteScroll: true,
                      onPageChanged: (index, reason) {
                        onPageChanged(index);
                      }),
                  carouselController: textCarouselController,
                ),
                OnboardingNextButton(
                    currentIndex: currentIndex,
                    contents: contents,
                    imageCarouselController: imageCarouselController,
                    textCarouselController: textCarouselController,
                    onPageChanged: onPageChanged)
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class OnboardingContentDetail extends StatelessWidget {
  final OnboardingContent content;
  const OnboardingContentDetail({
    super.key,
    required this.content,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
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
    );
  }
}

class OnboardingNextButton extends StatelessWidget {
  const OnboardingNextButton({
    super.key,
    required this.currentIndex,
    required this.contents,
    required this.imageCarouselController,
    required this.textCarouselController,
    required this.onPageChanged,
  });

  final int currentIndex;
  final List<OnboardingContent> contents;
  final CarouselSliderController imageCarouselController;
  final CarouselSliderController textCarouselController;
  final Function(int p1) onPageChanged;

  @override
  Widget build(BuildContext context) {
    return CustomFilledButton(
      title: "Selanjutnya",
      onPressed: () {
        if (currentIndex == contents.length - 1) {
          context.push('/');
          return;
        }
        imageCarouselController.nextPage(
            duration: const Duration(milliseconds: 500),
            curve: Curves.easeInOut);
        // given delay to make sure the carousel 1 is finished
        Future.delayed(
            const Duration(milliseconds: 100),
            () => {
                  textCarouselController.nextPage(
                      duration: const Duration(milliseconds: 500),
                      curve: Curves.easeInOut),
                  onPageChanged(currentIndex + 1)
                });
      },
    );
  }
}
