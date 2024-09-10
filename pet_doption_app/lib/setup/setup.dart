import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:pet_doption_app/src/modules/Auth/domain/repositories/user_authentication_repository.dart';
import 'package:pet_doption_app/src/modules/Auth/domain/use_cases/user_authentication_use_case.dart';
import 'package:pet_doption_app/src/modules/Auth/external/datasource/user_authentication_datasource_impl.dart';
import 'package:pet_doption_app/src/modules/Auth/infra/datasource/user_authentication_datasource.dart';
import 'package:pet_doption_app/src/modules/Auth/infra/repositories/user_authentication_repository_impl.dart';
import 'package:pet_doption_app/src/modules/Auth/infra/use_cases/user_authentication_use_case_impl.dart';
import 'package:pet_doption_app/src/modules/Auth/presentation/cubit/user_authentication_cubit.dart';
import 'package:pet_doption_app/src/modules/register_pet/domain/entities/pet_info_entity.dart';
import 'package:pet_doption_app/src/modules/register_pet/domain/use_cases/add_pet_information_use_case.dart';
import 'package:pet_doption_app/src/modules/register_pet/domain/use_cases/get_pet_information_use_case.dart';
import 'package:pet_doption_app/src/modules/register_pet/presentation/cubit/add_pet_info_cubit.dart';
import 'package:pet_doption_app/src/modules/register_pet/presentation/cubit/get_pet_info_cubit.dart';

Dio dio = Dio();

final setup = GetIt.instance;

Future<void> registerDependencies() async {
  setupDatasources();
  setupRepositories();
  setupUseCases();
  setupCubits();
  setupEntities();
}

void setupDatasources() {
  setup.registerFactory<UserAuthenticationDatasource>(
      () => UserAuthenticationDatasourceImpl());
}

void setupRepositories() {
  setup.registerFactory<UserAuthenticationRepository>(
    () => UserAuthenticationRepositoryImpl(
      datasource: GetIt.I.get<UserAuthenticationDatasource>(),
    ),
  );
}

void setupUseCases() {
  setup.registerFactory<UserAuthenticationUseCase>(
    () => UserAuthenticationUseCaseImpl(
      repository: GetIt.I.get<UserAuthenticationRepository>(),
    ),
  );

  setup.registerFactory<AddPetInformationUseCase>(
    () => AddPetInformationUseCase(
      petInfoEntity: GetIt.I.get<PetInfoEntity>(),
    ),
  );

  setup.registerFactory<GetPetInformationUseCase>(
    () => GetPetInformationUseCase(),
  );
}

void setupCubits() {
  setup.registerFactory<UserAuthenticationCubit>(
    () => UserAuthenticationCubit(
      userAuthenticationUseCase: GetIt.I.get<UserAuthenticationUseCase>(),
    ),
  );

  setup.registerFactory<AddPetInfoCubit>(
    () => AddPetInfoCubit(
      addPetInformationUseCase: GetIt.I.get<AddPetInformationUseCase>(),
    ),
  );
  setup.registerFactory<GetPetInfoCubit>(
    () => GetPetInfoCubit(
      getPetInformationUseCase: GetIt.I.get<GetPetInformationUseCase>(),
    ),
  );
}

void setupEntities() {
  setup.registerFactory<PetInfoEntity>(
    () => PetInfoEntity(
      name: '',
      race: '',
      age: '',
      description: '',
      imageUrl: '',
      sex: '',
      weight: '',
      localization: '',
    ),
  );
}
