import 'package:flutter/material.dart';
import 'package:toko_rame/features/onboarding/domain/entities/onboarding_content.dart';

class OnboardingPagination extends StatelessWidget {
  const OnboardingPagination({
    super.key,
    required this.data,
    required this.currentIndex,
  });

  final List<OnboardingContent> data;
  final int currentIndex;

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomCenter,
      child: SizedBox(
        height: MediaQuery.of(context).size.height * 0.2 + 21 + 40 + 34 + 34,
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
    );
  }
}
