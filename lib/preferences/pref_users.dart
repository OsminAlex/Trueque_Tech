import 'package:shared_preferences/shared_preferences.dart';

class PreferenciasUsuaios {
  //generar instancia
  static late SharedPreferences _prefs;

  //inicializar las preferencias
  static Future init() async {
    _prefs = await SharedPreferences.getInstance();
  }

  String get ultimapagina {
    return _prefs.getString('ultimapagina') ?? 'Login';
  }

  set ultimapagina(String value) {
    _prefs.setString('ultimapagina', value);
  }
}
