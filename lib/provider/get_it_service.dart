import 'package:get_it/get_it.dart';
import 'package:take_home/network/get_data.dart';
import 'package:take_home/repository/data_repo.dart';

final getIt = GetIt.instance;

void setup() {
  getIt.registerSingleton<IDataRepo>(
    DataRepo(
      getNetworkData: GetNetworkData(),
    ),
  );
}
