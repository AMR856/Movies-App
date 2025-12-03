// GENERATED CODE - DO NOT MODIFY BY HAND
// dart format width=80

// **************************************************************************
// InjectableConfigGenerator
// **************************************************************************

// ignore_for_file: type=lint
// coverage:ignore-file

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'package:get_it/get_it.dart' as _i174;
import 'package:injectable/injectable.dart' as _i526;
import 'package:movies_app/features/main_layout/home/data/data_source/remote/movies_api_remote_data_source.dart'
    as _i434;
import 'package:movies_app/features/main_layout/home/data/data_source/remote/movies_remote_data_source.dart'
    as _i393;
import 'package:movies_app/features/main_layout/home/data/repositories_impl/movies_repositories_impl.dart'
    as _i514;
import 'package:movies_app/features/main_layout/home/domain/repositories/movies_repositories.dart'
    as _i439;
import 'package:movies_app/features/main_layout/home/domain/use_cases/get_movies_use_case.dart'
    as _i39;
import 'package:movies_app/features/main_layout/home/presentation/cubit/genres_cubit.dart'
    as _i95;
import 'package:movies_app/features/main_layout/home/presentation/cubit/movies_cubit.dart'
    as _i280;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i393.MoviesRemoteDataSource>(
      () => _i434.MoviesApiRemoteDataSource(),
    );
    gh.lazySingleton<_i439.MoviesRepositories>(
      () => _i514.MoviesRepositoriesImpl(
        moviesApiRemoteDataSource: gh<_i393.MoviesRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i39.GetMoviesUseCase>(
      () => _i39.GetMoviesUseCase(
        moviesRepositories: gh<_i439.MoviesRepositories>(),
      ),
    );
    gh.factory<_i95.GenresCubit>(
      () => _i95.GenresCubit(getMoviesUseCase: gh<_i39.GetMoviesUseCase>()),
    );
    gh.factory<_i280.MoviesCubit>(
      () => _i280.MoviesCubit(getMoviesUseCase: gh<_i39.GetMoviesUseCase>()),
    );
    return this;
  }
}
