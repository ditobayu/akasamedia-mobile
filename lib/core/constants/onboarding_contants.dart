import 'package:toko_rame/features/onboarding/domain/entities/onboarding_content.dart';

class OnboardingConstants {
  static final List<OnboardingContent> onboardingData = [
    OnboardingContent(
      title: 'Gratis Materi Belajar\nMenjadi Seller Handal',
      subtitle:
          'Nggak bisa jualan?\nJangan khawatir, Tokorame akan membimbing kamu\nhingga menjadi seller langsung dari ahlinya',
      image: 'assets/images/onboarding1.png',
    ),
    OnboardingContent(
      title: 'Ribuan Produk\ndengan Kualitas Terbaik',
      subtitle:
          'Tokorame menyediakan ribuan produk dengan kualitas\nderbaik dari seller terpercaya',
      image: 'assets/images/onboarding2.png',
    ),
    OnboardingContent(
      title: 'Toko Online Unik\nUntuk Kamu Jualan',
      subtitle: 'Subdomain unik dan toko online profesional\nsiap pakai',
      image: 'assets/images/onboarding3.png',
    ),
  ];
}
