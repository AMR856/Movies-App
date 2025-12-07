import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/core/resources/color_manager.dart';
import 'package:movies_app/core/widgets/custom_movie_item.dart';
import 'package:movies_app/features/main_layout/browser/presentation/widgets/custom_tab_bar.dart';
import 'package:movies_app/core/di/di.dart';
import 'package:movies_app/features/main_layout/browser/presentation/cubit/movies_by_genre_cubit.dart';
import 'package:movies_app/features/main_layout/browser/presentation/cubit/genre_tab_cubit.dart';

class BrowserTab extends StatefulWidget {
  const BrowserTab({super.key});

  @override
  State<BrowserTab> createState() => _BrowserTabState();
}

class _BrowserTabState extends State<BrowserTab> {
  final List<String> genres = [
    'Action',
    'Adventure',
    'Animation',
    'Comedy',
    'Crime',
    'Documentary',
    'Drama',
    'Family',
    'Fantasy',
    'History',
    'Horror',
    'Musical',
    'Mystery',
    'Romance',
    'Sci-Fi',
    'Sport',
    'Thriller',
    'War',
    'Western',
  ];

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (_) => GenreTabCubit(),
        ),
        BlocProvider(
          create: (_) =>
              getIt<MoviesByGenreCubit>()..getMoviesByGenre(genres[0]),
        ),
      ],
      child: SafeArea(
        child: Padding(
          padding: REdgeInsets.all(16),
          child: Column(
            children: [
              BlocBuilder<GenreTabCubit, int>(
                builder: (context, selectedIndex) {
                  return CustomTabBar(
                    genres: genres,
                    selectedTapBgColor: ColorManager.yellow,
                    selectedTapFgColor: ColorManager.primary,
                    unSelectedTapBgColor: ColorManager.primary,
                    unSelectedTapFgColor: ColorManager.yellow,
                    onTapGenre: (genre) {
                      final index = genres.indexOf(genre);
                      context.read<GenreTabCubit>().selectTab(index);
                      context.read<MoviesByGenreCubit>().getMoviesByGenre(
                        genre,
                      );
                    },
                  );
                },
              ),
              SizedBox(height: 16.h),

              Expanded(
                child: BlocBuilder<MoviesByGenreCubit, GenresState>(
                  builder: (context, state) {
                    if (state is GenreMoviesLoading) {
                      return const Center(child: CircularProgressIndicator());
                    } else if (state is GenreMoviesError) {
                      return Center(
                        child: Text(
                          state.message,
                          style: TextStyle(
                            color: ColorManager.white,
                            fontSize: 16.sp,
                          ),
                        ),
                      );
                    } else if (state is GenreMoviesSuccess) {
                      final movies = state.movies;
                      if (movies.isEmpty) {
                        return Center(
                          child: Text(
                            "No movies found",
                            style: TextStyle(
                              color: ColorManager.white,
                              fontSize: 16.sp,
                            ),
                          ),
                        );
                      }
                      return GridView.builder(
                        physics: const BouncingScrollPhysics(),
                        padding: REdgeInsets.all(0),
                        itemCount: movies.length,
                        gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 2,
                          childAspectRatio: 0.75,
                          mainAxisSpacing: 12.h,
                          crossAxisSpacing: 12.w,
                        ),
                        itemBuilder: (context, index) => CustomMovieItem(
                          moviesEntity: movies[index],
                        ),
                      );
                    }
                    return const SizedBox.shrink();
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
