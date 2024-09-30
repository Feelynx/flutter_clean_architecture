enum Environment {
  dev('https://dummyjson.com'),
  staging('https://dummyjson.com'),
  prod('https://dummyjson.com');

  const Environment(this.baseUrl);

  final String baseUrl;
}
