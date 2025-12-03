import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/di/di.dart';
import 'package:movies_app/core/resources/assets_manager.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:movies_app/core/resources/color_manager.dart';
import 'package:movies_app/core/widgets/custom_movie_item.dart';
import 'package:movies_app/feature/main_layout/home/presentation/cubit/genres_cubit.dart';
import 'package:movies_app/feature/main_layout/home/presentation/cubit/movies_cubit.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'dart:math';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
    final List<String> genres = [
    'Action',
    'Adventure',
    'Animation',
    'Biography',
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

  String getChangeIndex() {
    final random = Random();
    return genres[random.nextInt(genres.length - 1)];
  }
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => getIt<MoviesCubit>()..getMovies(),
        ),
        BlocProvider(
          create: (context) =>
              getIt<GenresCubit>()
                ..getMoviesGenres(getChangeIndex()),
        ),
      ],
      child: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              BlocBuilder<MoviesCubit, MoviesState>(
                builder: (context, state) {
                  if (state is MoviesLoading) {
                    return SizedBox(
                      height: 900.h,
                      child: Center(
                        child: CupertinoActivityIndicator(
                          color: ColorManager.white,
                        ),
                      ),
                    );
                  } else if (state is MoviesError) {
                    return SizedBox(
                      height: 900.h,
                      child: Center(
                        child: Text(
                          state.message,
                          style: TextStyle(color: ColorManager.white),
                        ),
                      ),
                    );
                  } else if (state is MoviesSuccess) {
                    return SizedBox(
                      height: 600.h,
                      width: double.infinity,
                      child: Stack(
                        fit: StackFit.expand,
                        children: [
                          ShaderMask(
                            shaderCallback: (bounds) {
                              return LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: [
                                  Colors.transparent,
                                  Colors.black,
                                ],
                                stops: [0.0, 0.9],
                              ).createShader(bounds);
                            },
                            blendMode: BlendMode.darken,
                            child: Image.network(
                              state
                                  .movies[state.currentCarouselIndex]
                                  .largeCoverImage!,
                              fit: BoxFit.fill,
                            ),
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.stretch,
                            children: [
                              Image.asset(
                                ImageAssets.testAvailableNow,
                                height: 93.h,
                                width: 267.w,
                              ),
                              Expanded(
                                child: CarouselSlider(
                                  options: CarouselOptions(
                                    onPageChanged: (index, reason) {
                                      context
                                          .read<MoviesCubit>()
                                          .changeCarouselIndex(index);
                                    },
                                    aspectRatio: 1,
                                    enlargeCenterPage: true,
                                    enlargeFactor: 0.4,
                                    viewportFraction: 0.42,
                                  ),
                                  items: state.movies
                                      .map(
                                        (movie) => CustomMovieItem(
                                          moviesEntity: movie,
                                        ),
                                      )
                                      .toList(),
                                ),
                              ),
                              Image.asset(
                                ImageAssets.testWatchNow,
                                height: 146.h,
                                width: 354.w,
                              ),
                              SizedBox(
                                height: 40.h,
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
                  }
                  return SizedBox(
                    height: 900,
                  );
                },
              ),
              BlocBuilder<GenresCubit, GenresState>(
                builder: (context, state) {
                  if (state is GenresLoading) {
                    return SizedBox(
                      height: 900.h,
                      child: Center(
                        child: CupertinoActivityIndicator(
                          color: ColorManager.white,
                        ),
                      ),
                    );
                  } else if (state is GenresError) {
                    return SizedBox(
                      height: 900.h,
                      child: Center(
                        child: Text(
                          state.message,
                          style: TextStyle(color: ColorManager.white),
                        ),
                      ),
                    );
                  } else if (state is GenresSuccess) {
                    return Container(
                      padding: REdgeInsets.only(left: 16),
                      color: Colors.black87,
                      child: Column(
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                              getChangeIndex(),
                                style: TextStyle(color: ColorManager.white),
                              ),
                              TextButton(
                                onPressed: () {},
                                child: Row(
                                  children: [
                                    Text(
                                      'See More',
                                      style: TextStyle(
                                        color: ColorManager.yellow,
                                      ),
                                    ),
                                    Icon(
                                      Icons.arrow_forward,
                                      color: ColorManager.yellow,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 220.h,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => CustomMovieItem(
                                moviesEntity: state.genres[index],
                                height: 220,
                                width: 146,
                              ),
                              itemCount: 6,
                              separatorBuilder: (context, index) => SizedBox(
                                width: 16.w,
                              ),
                            ),
                          ),
                        ],
                      ),
                    );
                  }
                  return SizedBox();
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}
