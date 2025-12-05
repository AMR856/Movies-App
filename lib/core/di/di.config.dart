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
import 'package:movies_app/features/main_layout/search/data/data_source/remote/search_api_remote_data_source.dart'
    as _i245;
import 'package:movies_app/features/main_layout/search/data/data_source/remote/search_remote_data_source.dart'
    as _i541;
import 'package:movies_app/features/main_layout/search/data/repo_impl/search_repo_impl.dart'
    as _i629;
import 'package:movies_app/features/main_layout/search/domain/repos/search_repos.dart'
    as _i828;
import 'package:movies_app/features/main_layout/search/domain/use_cases/get_search_movie_use_case.dart'
    as _i780;
import 'package:movies_app/features/main_layout/search/presentation/cubit/search_provider.dart'
    as _i762;
import 'package:movies_app/features/movie_details/data/data_source/remote/details_api_remote_data_source.dart'
    as _i761;
import 'package:movies_app/features/movie_details/data/data_source/remote/details_remote_data_source.dart'
    as _i211;
import 'package:movies_app/features/movie_details/data/repo_impl/details_repo_impl.dart'
    as _i955;
import 'package:movies_app/features/movie_details/domain/repos/details_repos.dart'
    as _i943;
import 'package:movies_app/features/movie_details/domain/use_cases/get_details_movie_use_case.dart'
    as _i225;
import 'package:movies_app/features/movie_details/presentation/cubit/details_movie_cubit.dart'
    as _i492;
import 'package:movies_app/features/movie_details/presentation/cubit/movie_suggestions_cubit.dart'
    as _i1050;

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
    gh.singleton<_i211.DetailsRemoteDataSource>(
      () => _i761.DetailsApiRemoteDataSource(),
    );
    gh.singleton<_i541.SearchRemoteDataSource>(
      () => _i245.SearchApiRemoteDataSource(),
    );
    gh.lazySingleton<_i439.MoviesRepositories>(
      () => _i514.MoviesRepositoriesImpl(
        moviesApiRemoteDataSource: gh<_i393.MoviesRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i943.DetailsRepos>(
      () => _i955.DetailsRepoImpl(
        detailsApiRemoteDataSource: gh<_i211.DetailsRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i828.SearchRepos>(
      () => _i629.SearchRepoImpl(
        searchRemoteDataSource: gh<_i541.SearchRemoteDataSource>(),
      ),
    );
    gh.lazySingleton<_i225.GetDetailsMovieUseCase>(
      () =>
          _i225.GetDetailsMovieUseCase(detailsRepos: gh<_i943.DetailsRepos>()),
    );
    gh.lazySingleton<_i39.GetMoviesUseCase>(
      () => _i39.GetMoviesUseCase(
        moviesRepositories: gh<_i439.MoviesRepositories>(),
      ),
    );
    gh.factory<_i492.DetailsMovieCubit>(
      () => _i492.DetailsMovieCubit(
        getDetailsMovieUseCase: gh<_i225.GetDetailsMovieUseCase>(),
      ),
    );
    gh.factory<_i1050.MovieSuggestionsCubit>(
      () => _i1050.MovieSuggestionsCubit(
        getDetailsMovieUseCase: gh<_i225.GetDetailsMovieUseCase>(),
      ),
    );
    gh.lazySingleton<_i780.GetSearchMovieUseCase>(
      () => _i780.GetSearchMovieUseCase(searchRepos: gh<_i828.SearchRepos>()),
    );
    gh.factory<_i95.GenresCubit>(
      () => _i95.GenresCubit(getMoviesUseCase: gh<_i39.GetMoviesUseCase>()),
    );
    gh.factory<_i280.MoviesCubit>(
      () => _i280.MoviesCubit(getMoviesUseCase: gh<_i39.GetMoviesUseCase>()),
    );
    gh.factory<_i762.SearchProvider>(
      () => _i762.SearchProvider(
        getSearchMovieUseCase: gh<_i780.GetSearchMovieUseCase>(),
      ),
    );
    return this;
  }
}
