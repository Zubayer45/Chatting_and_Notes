// ignore_for_file: constant_identifier_names, avoid_print






class AppConstants {
  //global api
  //static const String baseUrl = 'http://103.110.218.55:3200/api/';

  //static const String baseUrl = 'http://202.40.189.4:8085/api/'; //Trial link
  //static const String baseUrl = 'http://202.40.189.4:8095/api/';
 //static const String baseUrl = 'http://202.40.189.4:8090/api/'; //final live Db
  // static const String baseUrl = 'http://103.159.73.49:8030/api/'; //office real ip
   static const String baseUrl = 'http://103.159.73.49:8040/api/';
  //static const String baseUrl = 'http://192.168.134.120:30/api/';
  //static const String baseUrl = 'http://192.168.0.22:8040/api/';// office local api
  //ADMIN PASSWORD:753159 for 95
  //local ApI
  //static const String baseUrl = 'http://192.168.134.120:5600/api/';
  // static const String baseUrl = 'http://192.168.31.204:30/api/';
  //static const String baseUrl ='http://192.168.1.92:88/api/';

  // static const String baseUrl = 'http://192.168.1.11:1004/api/';

  //app download link
  static const String appDownlinkUrl = 'http://103.110.218.56/apkbuild/';

  static const String loginUri = 'Userinfs/';

  //API routing
  static const String jwtTokenUri = 'Jwt';
  static const String hmsMblQuery = 'HmsMblQuery';
  //static const String jwtTokenUri = 'Jwt';

  //status
  static const String acknowledgedStatus = 'Acknowledged';
  static const String inprogressStatus = 'InProgress';
  static const String startTripStatus = 'StartTrip';
  static const String endTripStatus = 'EndTrip';
  static const String completedStatus = 'Completed';
  static const String draftStatus = 'Draft';
  static const String rejectedStatus = 'Rejected';
  static const String reassignedStatus = 'Reassigned';

  





  static const String nullTime = "1900-01-01T00:00:00";

  // sharePreference

  static const String TOKEN = 'tokenstr';
  static const String USER = 'user';

  static const String CONFIG = 'config';
  static const String GUEST_MODE = 'guest_mode';
  static const String CURRENCY = 'currency';

  static const String COUNTRY_CODE = 'country_code';
  static const String LANGUAGE_CODE = 'language_code';
  static const String THEME = 'theme';
  static const String SELECT_LANGUAGE_STATUS = 'select_language_status';

  // static List<LanguageModel> languages = [
  //   LanguageModel(imageUrl: '', languageName: 'English', countryCode: 'US', languageCode: 'en'),
  //   LanguageModel(imageUrl: '', languageName: 'Bangla', countryCode: 'BD', languageCode: 'bn'),
  // ];

  //   LanguageModel(imageUrl: '', languageName: 'English', countryCode: 'US', languageCode: 'en'),
  //   LanguageModel(imageUrl: '', languageName: 'Bangla', countryCode: 'BD', languageCode: 'bn'),
  // ];

  static void logPrint(Object? object) async {
    int defaultPrintLength = 1020;
    if (object == null || object.toString().length <= defaultPrintLength) {
      print(object);
    } else {
      String log = object.toString();
      int start = 0;
      int endIndex = defaultPrintLength;
      int logLength = log.length;
      int tmpLogLength = log.length;
      while (endIndex < logLength) {
        print(log.substring(start, endIndex));
        endIndex += defaultPrintLength;
        start += defaultPrintLength;
        tmpLogLength -= defaultPrintLength;
      }
      if (tmpLogLength > 0) {
        print(log.substring(start, logLength));
      }
    }
  }
}
