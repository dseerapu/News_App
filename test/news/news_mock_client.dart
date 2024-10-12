import 'package:mockito/mockito.dart';
import 'package:http/http.dart' as http;

class NewsMockClient extends Mock implements http.Client {
 @override
  Future<http.Response> get(Uri url, {Map<String, String>? headers}) {
    // This method now properly returns a Future<http.Response>.
    return super.noSuchMethod(
      Invocation.method(#get, [url, headers]),
      returnValue: Future.value(http.Response('{}', 200)), // Default empty response
      returnValueForMissingStub: Future.value(http.Response('{}', 200)), // Prevents null issues
    );
  }
}