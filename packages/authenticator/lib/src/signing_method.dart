enum SigningMethod {
  anonymous(providerId: 'firebase'),
  apple(providerId: 'apple.com'),
  google(providerId: 'google.com'),
  ;

  const SigningMethod({
    required this.providerId,
  });

  final String providerId;
}
