import 'package:injectable/injectable.dart';

class DiEnvironment extends Environment {
  DiEnvironment(super.name);

  static const dummy = 'dummy';

  static const dev = Environment.dev;

  static const prod = Environment.prod;

  static const test = Environment.test;

  /// Environments that use HTTP connection rather than dummy data
  static const useNetwork = [dev, prod, test];
}
