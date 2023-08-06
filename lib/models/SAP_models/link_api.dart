class LinkApi {
  static const String _login = 'http://s4training.citek.vn:8085/zservice_ht/login?sap-client=100';

  static String get login => _login;

  static String getLinkApp(String appName) {
    String link = '';
    switch (appName) {
      case 'LOGIN':
        link = _login;
        break;
    }
    return link;
  }
}