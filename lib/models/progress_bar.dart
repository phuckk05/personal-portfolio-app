class ProgressBar {
  final String svgPath;
  final String title;
  final double value;
  const ProgressBar({
    required this.svgPath,
    required this.title,
    required this.value,
  });

  static const List<ProgressBar> list = [
    ProgressBar(
      svgPath: 'assets/svgs/dart-original.svg',
      title: 'Dart',
      value: 0.8,
    ),
    ProgressBar(
      svgPath: 'assets/svgs/flutter-original.svg',
      title: 'Flutter',
      value: 0.8,
    ),
    ProgressBar(
      svgPath: 'assets/svgs/reactnative-original-wordmark.svg',
      title: 'React Native',
      value: 0.2,
    ),
    ProgressBar(
      svgPath: 'assets/svgs/firebase-original.svg',
      title: 'Firebase',
      value: 0.7,
    ),
    ProgressBar(
      svgPath: 'assets/svgs/kotlin-original.svg',
      title: 'Kotlin',
      value: 0.7,
    ),
    ProgressBar(
      svgPath: 'assets/svgs/swift-original.svg',
      title: 'Swift',
      value: 0.3,
    ),
    ProgressBar(
      svgPath: 'assets/svgs/github-original.svg',
      title: 'Git/Github',
      value: 0.7,
    ),
    ProgressBar(
      svgPath: 'assets/svgs/spring-original.svg',
      title: 'Spring Boot',
      value: 0.4,
    ),
    ProgressBar(
      svgPath: 'assets/svgs/csharp-original.svg',
      title: 'C#',
      value: 0.7,
    ),
    ProgressBar(
      svgPath: 'assets/svgs/javascript-original.svg',
      title: 'Java Script',
      value: 0.6,
    ),
    ProgressBar(
      svgPath: 'assets/svgs/go-original-wordmark.svg',
      title: 'Go',
      value: 0.2,
    ),
  ];
}
