class AppState {
  bool isLightMode;

  AppState({this.isLightMode = true});

  factory AppState.darkMode() => AppState(isLightMode: false);

  void toggleDarkMode() => isLightMode = !isLightMode;

  @override
  String toString() {
    return 'State{isLightMode: $isLightMode}';
  }
}
