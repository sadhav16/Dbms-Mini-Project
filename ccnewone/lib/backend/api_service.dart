
import 'dart:async';
import 'dart:html';
import 'package:http/http.dart';

class ApiService {
  Future<void> fetchData() {
    final completer = Completer<void>();
    final request = HttpRequest();

    request.open('GET', 'http://localhost:8080/events'); // Replace with your API URL

    // Handle the response when the request is successful
    unawaited(request.onLoad.first.then((_) {
      if (request.status == 200) {
        // Process the successful response
        print('Data fetched successfully: ${request.responseText}');
        completer.complete();
      } else {
        // Handle unexpected response statuses
        completer.completeError(ClientException('Error: ${request.status}', request.responseUrl as Uri?));
      }
    }));

    // Handle network errors
    unawaited(request.onError.first.then((_) {
      completer.completeError(
        ClientException('XMLHttpRequest error.', request.responseUrl as Uri?),
        StackTrace.current,
      );
    }));

    request.send();
    return completer.future;
  }
}
