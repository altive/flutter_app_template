import 'package:authenticator/authenticator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('initialization', () async {
    // TestWidgetsFlutterBinding.ensureInitialized();
    // await Firebase.initializeApp();
    final sut = Authenticator(auth: MockAuth());
    expect(sut, isA<Authenticator>());
  });
}

class MockAuth extends Fake implements FirebaseAuth {}
