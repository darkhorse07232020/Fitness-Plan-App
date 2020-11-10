class LanguageModel {
  final String icon;
  final String title;
  final String subtitle;
  bool isSelected;

  LanguageModel({this.icon, this.title, this.subtitle,this.isSelected});
}

List<LanguageModel> languageList = [
  LanguageModel(
    icon: 'assets/country/us.png',
    title: 'English',
    subtitle: 'English',
    isSelected: false,
  ),
  LanguageModel(
    icon: 'assets/country/ae.png',
    title: 'Arabic',
    subtitle: 'عربى',
    isSelected: false,
  ),
  LanguageModel(
    icon: 'assets/country/es.png',
    title: 'Spanish',
    subtitle: 'España',
    isSelected: false,
  ),
  LanguageModel(
    icon: 'assets/country/fr.png',
    title: 'French (France)',
    subtitle: 'Français - France',
    isSelected: false,
  ),
  LanguageModel(
    icon: 'assets/country/ca.png',
    title: 'French (Canada)',
    subtitle: 'Français - Canadian',
    isSelected: false,
  ),
  LanguageModel(
    icon: 'assets/country/br.png',
    title: 'Brazillian',
    subtitle: 'Brazillian',
    isSelected: false,
  ),
  LanguageModel(
    icon: 'assets/country/de.png',
    title: 'Deutsh',
    subtitle: 'Deutsh',
    isSelected: false,
  ),
];
