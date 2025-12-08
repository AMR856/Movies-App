import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/di/di.dart';
import 'package:movies_app/core/resources/assets_manager.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:movies_app/core/resources/color_manager.dart';
import 'package:movies_app/core/widgets/custom_movie_item.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/features/main_layout/home/presentation/cubit/genres_cubit.dart';
import 'dart:math';
import 'package:movies_app/features/main_layout/home/presentation/cubit/movies_cubit.dart';
import 'package:movies_app/generated/l10n.dart';
import 'package:provider/provider.dart';
import 'package:movies_app/providers/config_provider.dart';

class HomeTab extends StatefulWidget {
  const HomeTab({super.key});

  @override
  State<HomeTab> createState() => _HomeTabState();
}

class _HomeTabState extends State<HomeTab> {
  final Map<String, String> genreMap = {
    'Action': 'أكشن',
    'Adventure': 'مغامرة',
    'Animation': 'رسوم متحركة',
    'Comedy': 'كوميديا',
    'Crime': 'جريمة',
    'Documentary': 'وثائقي',
    'Drama': 'دراما',
    'Family': 'عائلي',
    'Fantasy': 'خيال',
    'History': 'تاريخي',
    'Horror': 'رعب',
    'Musical': 'موسيقي',
    'Mystery': 'غموض',
    'Romance': 'رومانسي',
    'Sci-Fi': 'خيال علمي',
    'Sport': 'رياضي',
    'Thriller': 'إثارة',
    'War': 'حرب',
    'Western': 'غربي',
  };

  List<String> get genresEn => genreMap.keys.toList();
  List<String> get genresAr => genreMap.values.toList();

  String _currentGenre = 'Action';

  String getRandomGenre() {
    final random = Random();
    final randomIndex = random.nextInt(genresEn.length);
    _currentGenre = genresEn[randomIndex];
    return _currentGenre;
  }

  String getGenreInCurrentLanguage(BuildContext context) {
    final configProvider = Provider.of<ConfigProvider>(context, listen: false);
    
    if (configProvider.currentLanguage == 'en') {
      return _currentGenre;
    } else {
      return genreMap[_currentGenre] ?? _currentGenre;
    }
  }

  @override
  void initState() {
    super.initState();
    _currentGenre = genresEn[Random().nextInt(genresEn.length)];
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
                ..getMoviesGenres(_currentGenre), 
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
                    height: 900.h,
                  );
                },
              ),
              
              BlocBuilder<GenresCubit, GenresState>(
                builder: (context, state) {
                  return Container(
                    padding: REdgeInsets.only(left: 16, right: 16),
                    color: Colors.black87,
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              getGenreInCurrentLanguage(context), 
                              style: TextStyle(
                                color: ColorManager.white,
                                fontSize: 18.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: [
                                IconButton(
                                  onPressed: () {
                                    final newGenre = getRandomGenre();
                                    context.read<GenresCubit>().getMoviesGenres(newGenre);
                                  },
                                  icon: Icon(
                                    Icons.refresh,
                                    color: ColorManager.yellow,
                                  ),
                                ),
                                TextButton(
                                  onPressed: () {
                                  },
                                  child: Row(
                                    children: [
                                      Text(
                                        S.of(context).see_more,
                                        style: TextStyle(
                                          color: ColorManager.yellow,
                                          fontSize: 14.sp,
                                        ),
                                      ),
                                      Icon(
                                        Icons.arrow_forward,
                                        color: ColorManager.yellow,
                                        size: 16.w,
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                        
                        SizedBox(height: 16.h),
                        
                        if (state is GenresLoading)
                          SizedBox(
                            height: 220.h,
                            child: Center(
                              child: CupertinoActivityIndicator(
                                color: ColorManager.yellow,
                              ),
                            ),
                          )
                        else if (state is GenresError)
                          SizedBox(
                            height: 220.h,
                            child: Center(
                              child: Text(
                                state.message,
                                style: TextStyle(
                                  color: ColorManager.white,
                                  fontSize: 16.sp,
                                ),
                              ),
                            ),
                          )
                        else if (state is GenresSuccess)
                          SizedBox(
                            height: 220.h,
                            child: ListView.separated(
                              scrollDirection: Axis.horizontal,
                              itemBuilder: (context, index) => CustomMovieItem(
                                moviesEntity: state.genres[index],
                                height: 220.h,
                                width: 146.w,
                              ),
                              separatorBuilder: (context, index) => SizedBox(
                                width: 16.w,
                              ),
                              itemCount: state.genres.length.clamp(0, 6), 
                            ),
                          )
                        else
                          SizedBox(height: 220.h),
                      ],
                    ),
                  );
                },
              ),
            ],
          ),
        ),
      ),
    );
  }
}