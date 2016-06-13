#!/usr/bin/env dart
library playground.cli;

import 'dart:async';
import 'dart:io';

import 'package:playground/playground.dart';

Future main(List<String> args) async {
  var script = new File(Platform.script.path);
  var projectRoot = script.parent.parent.path + Platform.pathSeparator;
  var bootstrap = new Bootstrap();
  var console = await bootstrap.createConsole(projectRoot: projectRoot);
  return console.run(args);
}
