import 'package:intl/intl.dart';

String endPoint =
    'https://newsapi.org/v2/top-headlines?country=us&category=business&apiKey=$apiKey';

const String apiKey = "ddad09e75c704ee99be13a3eddcdfc1d";

const String defaultImageURL = "https://www.outsystems.com/Forge_CW/_image.aspx/Q8LvY--6WakOw9afDCuuGfdpOypWf7wwQViUz4gj-GY=/newsapi-2023-01-04%2000-00-00-2023-08-11%2005-48-06";

String getCurrentDate =  DateFormat('yyyy-MM-dd').format(DateTime.now());