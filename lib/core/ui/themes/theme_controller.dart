
import 'package:futurama/core/core_export.dart';
import 'package:shared_preferences/shared_preferences.dart';


class ThemeController extends BaseProvider {
  final String? key = "theme";
  final SharedPreferences localDataSource;
  bool? _currentTheme;

  bool get currentTheme => _currentTheme!; //Getter

  ThemeController({required this.localDataSource}) {
    _currentTheme = true;
    loadFromPrefs();
  }

  toggleTheme() {
    _currentTheme = !_currentTheme!;
    saveToPrefs();
    notifyListeners();
  }

  

  loadFromPrefs() async {
    
    _currentTheme = localDataSource.getBool(key!) ?? true;
    notifyListeners();
  }

  saveToPrefs() async {
  
    localDataSource.setBool(key!, currentTheme);
  }
}