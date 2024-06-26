import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:palm_codes/core/core.dart';

final url = dotenv.getString('REST_SERVER_URL');

final homePath = '${url}books/?page=';
