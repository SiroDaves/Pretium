class OnboardingPage {
  final String title;
  final String subtitle;
  final String icon;

  const OnboardingPage({
    required this.title,
    required this.subtitle,
    required this.icon,
  });
}

  final List<OnboardingPage> onboardingPages = const [
    OnboardingPage(
      title: "Direct Pay",
      subtitle: "Pay with crypto across Africa effortlessly",
      icon: "💳",
    ),
    OnboardingPage(
      title: "Accept Payments",
      subtitle: "Accept stablecoin payments hassle-free",
      icon: "👜",
    ),
    OnboardingPage(
      title: "Pay Bills",
      subtitle: "Pay for utility services and earn rewards",
      icon: "📄",
    ),
  ];
