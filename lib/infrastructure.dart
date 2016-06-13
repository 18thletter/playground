library playground.infrastructure;

import 'package:corsac_kernel/corsac_kernel.dart';
import 'package:corsac_console/corsac_console.dart';
import 'package:corsac_mysql/corsac_mysql.dart';
import 'package:playground/domain.dart';

/// Generic module to put anything related to infrastructure, like
/// service configuration for databases or other external resources.
class InfrastructureKernelModule extends KernelModule {
  @override
  Map getServiceConfiguration(String environment) {
    return {
      'console.commands' : DI.add([DI.get(NewCommand)]),
      const diType<Repository<Post>>() : DI.get(const diType<MySQLRepository<Post>>()),
      MySQL : DI.object(MySQL)
        ..constructor = 'fromUri'
        ..bindParameter('uri', 'mysql://root@127.0.0.1:3306/test'),
      const diType<MySQLRepository<Post>>() : DI.object()
        ..bindParameter('tableName', 'test')
    };
  }
}

class NewCommand extends Command {
  @override
  final String name = 'newCommand';

  @override
  final String description = 'a new command';

}
