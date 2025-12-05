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
import 'package:movies_app/config/db/db_helper.dart' as _i83;
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
<<<<<<< HEAD
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
=======
import 'package:movies_app/features/main_layout/profile/data/local/history_local_data_source.dart'
    as _i209;
import 'package:movies_app/features/main_layout/profile/data/local/history_local_data_source_db.dart'
    as _i318;
import 'package:movies_app/features/main_layout/profile/data/remote/profile_api_remote_data_source.dart'
    as _i915;
import 'package:movies_app/features/main_layout/profile/data/remote/profile_remote_data_source.dart'
    as _i225;
import 'package:movies_app/features/main_layout/profile/data/repositories_impl/history_repository_impl.dart'
    as _i858;
import 'package:movies_app/features/main_layout/profile/data/repositories_impl/profile_repository_impl.dart'
    as _i24;
import 'package:movies_app/features/main_layout/profile/domain/repositories/get_history_repository.dart'
    as _i1022;
import 'package:movies_app/features/main_layout/profile/domain/repositories/get_profile_repository.dart'
    as _i851;
import 'package:movies_app/features/main_layout/profile/domain/use_cases/get_favorite_use_case.dart'
    as _i937;
import 'package:movies_app/features/main_layout/profile/domain/use_cases/get_history_use_case.dart'
    as _i447;
import 'package:movies_app/features/main_layout/profile/domain/use_cases/get_profile_use_case.dart'
    as _i799;
import 'package:movies_app/features/main_layout/profile/presentation/cubit/get_favorite_cubit.dart'
    as _i657;
import 'package:movies_app/features/main_layout/profile/presentation/cubit/get_profile_cubit.dart'
    as _i619;
import 'package:movies_app/features/main_layout/profile/presentation/cubit/history_cubit.dart'
    as _i592;
>>>>>>> feature/profile_tab

extension GetItInjectableX on _i174.GetIt {
  // initializes the registration of main-scope dependencies inside of GetIt
  _i174.GetIt init({
    String? environment,
    _i526.EnvironmentFilter? environmentFilter,
  }) {
    final gh = _i526.GetItHelper(this, environment, environmentFilter);
    gh.factory<_i83.DatabaseHelper>(() => _i83.DatabaseHelper());
    gh.singleton<_i225.ProfileRemoteDataSource>(
      () => _i915.ProfileApiRemoteDataSource(),
    );
    gh.singleton<_i393.MoviesRemoteDataSource>(
      () => _i434.MoviesApiRemoteDataSource(),
    );
<<<<<<< HEAD
    gh.singleton<_i211.DetailsRemoteDataSource>(
      () => _i761.DetailsApiRemoteDataSource(),
    );
    gh.singleton<_i541.SearchRemoteDataSource>(
      () => _i245.SearchApiRemoteDataSource(),
=======
    gh.lazySingleton<_i851.ProfileRepository>(
      () => _i24.ProfileRepositoryImpl(
        remoteDataSource: gh<_i225.ProfileRemoteDataSource>(),
      ),
>>>>>>> feature/profile_tab
    );
    gh.lazySingleton<_i439.MoviesRepositories>(
      () => _i514.MoviesRepositoriesImpl(
        moviesApiRemoteDataSource: gh<_i393.MoviesRemoteDataSource>(),
      ),
    );
<<<<<<< HEAD
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
=======
    gh.lazySingleton<_i937.GetFavoritesUseCase>(
      () =>
          _i937.GetFavoritesUseCase(repository: gh<_i851.ProfileRepository>()),
    );
    gh.lazySingleton<_i209.HistoryLocalDataSource>(
      () => _i318.HistoryLocalDataSourceImpl(gh<_i83.DatabaseHelper>()),
    );
    gh.factory<_i657.FavoritesCubit>(
      () => _i657.FavoritesCubit(
        getFavoritesUseCase: gh<_i937.GetFavoritesUseCase>(),
      ),
    );
    gh.lazySingleton<_i799.GetProfileUseCase>(
      () => _i799.GetProfileUseCase(
        profileRepository: gh<_i851.ProfileRepository>(),
      ),
    );
    gh.lazySingleton<_i1022.HistoryRepository>(
      () => _i858.HistoryRepositoryImpl(gh<_i209.HistoryLocalDataSource>()),
>>>>>>> feature/profile_tab
    );
    gh.lazySingleton<_i39.GetMoviesUseCase>(
      () => _i39.GetMoviesUseCase(
        moviesRepositories: gh<_i439.MoviesRepositories>(),
      ),
    );
<<<<<<< HEAD
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
=======
    gh.lazySingleton<_i447.GetHistoryUseCase>(
      () => _i447.GetHistoryUseCase(gh<_i1022.HistoryRepository>()),
    );
    gh.lazySingleton<_i447.InsertHistoryUseCase>(
      () => _i447.InsertHistoryUseCase(gh<_i1022.HistoryRepository>()),
    );
    gh.lazySingleton<_i447.DeleteHistoryUseCase>(
      () => _i447.DeleteHistoryUseCase(gh<_i1022.HistoryRepository>()),
>>>>>>> feature/profile_tab
    );
    gh.factory<_i95.GenresCubit>(
      () => _i95.GenresCubit(getMoviesUseCase: gh<_i39.GetMoviesUseCase>()),
    );
    gh.factory<_i280.MoviesCubit>(
      () => _i280.MoviesCubit(getMoviesUseCase: gh<_i39.GetMoviesUseCase>()),
    );
<<<<<<< HEAD
    gh.factory<_i762.SearchProvider>(
      () => _i762.SearchProvider(
        getSearchMovieUseCase: gh<_i780.GetSearchMovieUseCase>(),
      ),
    );
=======
    gh.factory<_i592.HistoryCubit>(
      () => _i592.HistoryCubit(
        getHistoryUseCase: gh<_i447.GetHistoryUseCase>(),
        insertHistoryUseCase: gh<_i447.InsertHistoryUseCase>(),
        deleteHistoryUseCase: gh<_i447.DeleteHistoryUseCase>(),
      ),
    );
    gh.factory<_i619.ProfileCubit>(
      () =>
          _i619.ProfileCubit(getProfileUseCase: gh<_i799.GetProfileUseCase>()),
    );
>>>>>>> feature/profile_tab
    return this;
  }
}
