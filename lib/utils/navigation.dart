enum Screen {
  home('/home'),

  unknown('');

  final String name;
  const Screen(this.name);
}

Screen getRoute(String route) {
  final path = route.split('?').first;
  return Screen.values.firstWhere(
    (screen) => screen.name == path,
    orElse: () => Screen.unknown,
  );
}
