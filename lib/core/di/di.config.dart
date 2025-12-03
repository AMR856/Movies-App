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
import 'package:movies_app/feature/main_layout/home/data/data_source/remote/movies_api_remote_data_source.dart'
    as _i845;
import 'package:movies_app/feature/main_layout/home/data/data_source/remote/movies_remote_data_source.dart'
    as _i832;
import 'package:movies_app/feature/main_layout/home/data/repositories_impl/movies_repositories_impl.dart'
    as _i924;
import 'package:movies_app/feature/main_layout/home/domain/repositories/movies_repositories.dart'
    as _i891;
import 'package:movies_app/feature/main_layout/home/domain/use_cases/get_movies_use_case.dart'
    as _i559;
import 'package:movies_app/feature/main_layout/home/presentation/cubit/genres_cubit.dart'
    as _i593;
import 'package:movies_app/feature/main_layout/home/presentation/cubit/movies_cubit.dart'
    as _i319;

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.singleton<_i832.MoviesRemoteDataSource>(
      () => _i845.MoviesApiRemoteDataSource(),
    );
    gh.lazySingleton<_i891.MoviesRepositories>(
      () => _i924.MoviesRepositoriesImpl(
        moviesApiRemoteDataSource: gh<_i832.MoviesRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i559.GetMoviesUseCase>(
      () => _i559.GetMoviesUseCase(
        moviesRepositories: gh<_i891.MoviesRepositories>(),
      ),
    );
    gh.factory<_i593.GenresCubit>(
      () => _i593.GenresCubit(getMoviesUseCase: gh<_i559.GetMoviesUseCase>()),
    );
    gh.factory<_i319.MoviesCubit>(
      () => _i319.MoviesCubit(getMoviesUseCase: gh<_i559.GetMoviesUseCase>()),
    );
    return this;
  }
}
