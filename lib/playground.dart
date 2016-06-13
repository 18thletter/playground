library playground;

import 'package:playground/infrastructure.dart';
import 'package:corsac_bootstrap/corsac_bootstrap.dart';

export 'package:playground/domain.dart';
export 'package:playground/infrastructure.dart';
export 'package:logging/logging.dart';

/// Bootstrap class for playground.
///
/// This takes care of project's assempbly process.
class Bootstrap extends CorsacBootstrap {
  Bootstrap() {
    projectName = 'playground';
    logLevel = Level.INFO;

    // Register your modules here:
    modules.add(new InfrastructureKernelModule());
  }
}
