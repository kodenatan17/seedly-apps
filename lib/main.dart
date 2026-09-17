import 'package:flutter/material.dart';

import 'app.dart';
import 'cores/dependency/injection.dart';

void main() {
  registerCoreDependencies();
  runApp(SeedlyApp());
}
