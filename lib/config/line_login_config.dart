// class LineLoginConfig {
//   static const String apiBaseUrl = 'https://gecc-skko.moph.go.th:3001';
//   static const String lineRedirectUri = '$apiBaseUrl/auth/line';
//
//   static const String lineChannelId = '2000816125';
//   static const String lineScope = 'profile openid';
//
//   static const String lineState = 'secureRandomState';
//   static String get authorizeUrl => Uri.https(
//     'access.line.me',
//     '/oauth2/v2.1/authorize',
//     {
//       'response_type': 'code',
//       'client_id': lineChannelId,
//       'redirect_uri': lineRedirectUri,
//       'state': lineState,
//       'scope': lineScope,
//     },
//   ).toString();
// }

//test account
class LineLoginConfig {
  static const String apiBaseUrl = 'http://192.168.64.3:8088';
  static const String lineRedirectUri = '$apiBaseUrl/auth/line';

  static const String lineChannelId = '2007479642';
  static const String lineScope = 'profile openid';

  static const String lineState = 'secureRandomState';
  static String get authorizeUrl => Uri.https(
    'access.line.me',
    '/oauth2/v2.1/authorize',
    {
      'response_type': 'code',
      'client_id': lineChannelId,
      'redirect_uri': lineRedirectUri,
      'state': lineState,
      'scope': lineScope,
    },
  ).toString();
}