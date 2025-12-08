import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/di/di.dart';
import 'package:movies_app/core/resources/assets_manager.dart';
import 'package:movies_app/core/resources/color_manager.dart';
import 'package:movies_app/core/resources/font_manager.dart';
import 'package:movies_app/core/resources/values_manager.dart';
import 'package:movies_app/core/widgets/custom_elevated_button.dart';
import 'package:movies_app/features/main_layout/home/domain/entities/movies_entity.dart';
import 'package:movies_app/features/movie_details/data/models/add_favorite_request.dart';
import 'package:movies_app/features/movie_details/presentation/cubit/add_to_favorite_cubit.dart';
import 'package:movies_app/features/movie_details/presentation/cubit/delete_favorite_cubit.dart';
import 'package:movies_app/features/movie_details/presentation/cubit/details_movie_cubit.dart';
import 'package:movies_app/features/movie_details/presentation/cubit/is_favorite_cubit.dart';
import 'package:movies_app/features/movie_details/presentation/cubit/movie_suggestions_cubit.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/custom_button_details.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/custom_cast_item.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/custom_movie_suggestion.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/loading.dart';
import 'package:movies_app/features/movie_details/presentation/widgets/toasts.dart';
import 'package:movies_app/generated/l10n.dart';
import 'package:url_launcher/url_launcher.dart';

class MovieDetails extends StatelessWidget {
  const MovieDetails({super.key, required this.moviesEntity});
  final MoviesEntity moviesEntity;

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) =>
          getIt<DetailsMovieCubit>()..getDetailsMovie(moviesEntity.id),
        ),
        BlocProvider(
          create: (context) =>
          getIt<MovieSuggestionsCubit>()
            ..getMovieSuggestions(moviesEntity.id),
        ),
        BlocProvider(
          create: (_) => getIt<AddFavoriteCubit>(),
        ),
        BlocProvider(
          create: (_) => getIt<DeleteFavoriteCubit>(),
        ),
      ],
      child: Scaffold(
        body: BlocBuilder<DetailsMovieCubit, DetailsMovieState>(
          builder: (context, state) {
            if (state is DetailsMovieLoading) {
              return Center(
                child: CupertinoActivityIndicator(color: ColorManager.white),
              );
            } else if (state is DetailsMovieError) {
              return Center(
                child: Text(
                  state.message,
                  style: TextStyle(color: ColorManager.white),
                ),
              );
            } else if (state is DetailsMovieSuccess) {
              List<String> screenShotsList = [
                state.detailsMovie.mediumScreenshotImage1!,
                state.detailsMovie.mediumScreenshotImage2!,
                state.detailsMovie.mediumScreenshotImage3!,
              ];
              return SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      padding: REdgeInsets.symmetric(
                        horizontal: 16,
                        vertical: 25,
                      ),
                      height: 766.h,
                      width: double.infinity,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          fit: BoxFit.fill,
                          colorFilter: ColorFilter.srgbToLinearGamma(),
                          image: NetworkImage(
                            state.detailsMovie.backgroundImageOriginal!,
                          ),
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {
                                  Navigator.pop(context);
                                },
                                icon: Icon(
                                  size: 29,
                                  Icons.arrow_back_ios,
                                  color: ColorManager.white,
                                ),
                              ),
                              FavoriteButtonWithListener(moviesEntity: moviesEntity),
                            ],
                          ),
                          Image.asset(
                            ImageAssets.stopMovie,
                            height: 97.h,
                            width: 97.w,
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                textAlign: TextAlign.center,
                                state.detailsMovie.titleLong!,
                                style: TextStyle(
                                  color: ColorManager.white,
                                  fontSize: AppSize.s24.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              Text(
                                textAlign: TextAlign.center,
                                '${state.detailsMovie.year!}',
                                style: TextStyle(
                                  color: ColorManager.white.withValues(
                                    alpha: 0.5,
                                  ),
                                  fontSize: AppSize.s20.sp,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              CustomElevatedButton(
                                horizontal: 0,
                                text: S.of(context).watch,
                                bgColor: ColorManager.red,
                                fgColor: ColorManager.white,
                                onPressed: () {
                                  launchUrl(Uri.parse(state.detailsMovie.url!));
                                },
                              ),
                              Padding(
                                padding: REdgeInsets.only(top: AppPadding.p16),
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    CustomButtonDetails(
                                      icon: Icons.favorite,
                                      text: '${state.detailsMovie.likeCount!}',
                                    ),
                                    CustomButtonDetails(
                                      icon: Icons.access_time_filled_rounded,
                                      text: '${state.detailsMovie.runtime!}',
                                    ),
                                    CustomButtonDetails(
                                      icon: Icons.star,
                                      text: '${state.detailsMovie.rating!}',
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                    Container(
                      padding: REdgeInsets.all(AppPadding.p16),
                      color: Colors.black54,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            S.of(context).screen_shots,
                            style: TextStyle(
                              color: ColorManager.white,
                              fontSize: AppSize.s24.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          ListView.separated(
                            padding: REdgeInsets.symmetric(
                              vertical: AppPadding.p8,
                            ),
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemBuilder: (context, index) => ClipRRect(
                              borderRadius: BorderRadius.circular(16),
                              child: Image.network(screenShotsList[index]),
                            ),
                            separatorBuilder: (context, index) =>
                                SizedBox(height: 13),
                            itemCount: screenShotsList.length,
                          ),
                          Text(
                            S.of(context).similar,
                            style: TextStyle(
                              color: ColorManager.white,
                              fontSize: AppSize.s24.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),

                          BlocBuilder<
                              MovieSuggestionsCubit,
                              MovieSuggestionsState
                          >(
                            builder: (context, state) {
                              if (state is MovieSuggestionsLoading) {
                                return Center(
                                  child: CupertinoActivityIndicator(
                                    color: ColorManager.white,
                                  ),
                                );
                              } else if (state is MovieSuggestionsError) {
                                return Center(
                                  child: Text(
                                    state.message,
                                    style: TextStyle(color: ColorManager.white),
                                  ),
                                );
                              } else if (state is MovieSuggestionsSuccess) {
                                return GridView.builder(
                                  padding: REdgeInsets.symmetric(
                                    vertical: AppPadding.p12,
                                  ),
                                  physics: NeverScrollableScrollPhysics(),
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemBuilder: (context, index) {
                                    return CustomMovieSuggestion(
                                      moviesSuggestionEntity:
                                      state.movieSuggestions[index],
                                    );
                                  },
                                  itemCount: state.movieSuggestions.length,
                                  gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 2,
                                    childAspectRatio: 0.70,
                                    mainAxisSpacing: 10,
                                    crossAxisSpacing: 12,
                                  ),
                                );
                              }
                              return SizedBox(
                                child: Text(
                                  '${S.of(context).loading}....',
                                  style: TextStyle(color: Colors.white),
                                ),
                              );
                            },
                          ),
                          Text(
                            S.of(context).summary,
                            style: TextStyle(
                              color: ColorManager.white,
                              fontSize: AppSize.s24.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            state.detailsMovie.descriptionFull!,
                            style: TextStyle(
                              color: ColorManager.white,
                              fontSize: AppSize.s14.sp,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                          Text(
                            '\n${S.of(context).cast}',
                            style: TextStyle(
                              color: ColorManager.white,
                              fontSize: AppSize.s24.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          ListView.separated(
                            padding: REdgeInsets.symmetric(
                              vertical: AppPadding.p12,
                            ),
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            itemCount: state.detailsMovie.cast.length,
                            itemBuilder: (context, index) => CustomCastItem(
                              castEntity: state.detailsMovie.cast[index],
                            ),
                            separatorBuilder: (context, index) =>
                                SizedBox(height: 10.h),
                          ),
                          Text(
                            S.of(context).genres,
                            style: TextStyle(
                              color: ColorManager.white,
                              fontSize: AppSize.s24.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          GridView.builder(
                            padding: REdgeInsets.symmetric(
                              vertical: AppPadding.p12,
                            ),
                            physics: NeverScrollableScrollPhysics(),
                            shrinkWrap: true,
                            scrollDirection: Axis.vertical,
                            itemBuilder: (context, index) {
                              return CustomElevatedButton(
                                text: state.detailsMovie.genres![index],
                                horizontal: AppPadding.p12,
                                bgColor: ColorManager.grey,
                                fgColor: Colors.white,
                                fontSize: FontSize.s16.sp,
                                fontWeight: FontWeight.w400,
                                onPressed: () {},
                              );
                            },
                            itemCount: state.detailsMovie.genres!.length,
                            gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 3,
                              childAspectRatio: 8 / 3.5,
                              mainAxisSpacing: 10,
                              crossAxisSpacing: 12,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              );
            }
            return Center(
              child: Text(
                '${S.of(context).loading}....',
                style: TextStyle(color: Colors.white),
              ),
            );
          },
        ),
      ),
    );
  }
}

class FavoriteButtonWithListener extends StatelessWidget {
  const FavoriteButtonWithListener({
    super.key,
    required this.moviesEntity,
  });

  final MoviesEntity moviesEntity;

  void _handleFavoriteActionState(BuildContext context, dynamic state) {
    Loading.stopLoading(context);
    if (state is AddFavoriteSuccess) {
      Toasts.showToast(ColorManager.green, state.message);
      context.read<IsFavoriteCubit>().checkFavorite(moviesEntity.id.toString());
    } else if (state is AddFavoriteError) {
      Toasts.showToast(ColorManager.red, state.message);
    }
    else if (state is DeleteFavoriteSuccess) {
      Toasts.showToast(ColorManager.green, state.message);
      context.read<IsFavoriteCubit>().checkFavorite(moviesEntity.id.toString());
    } else if (state is DeleteFavoriteError) {
      Toasts.showToast(ColorManager.red, state.message);
    }
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => getIt<IsFavoriteCubit>()..checkFavorite(moviesEntity.id.toString()),
      child: MultiBlocListener(
        listeners: [
          BlocListener<AddFavoriteCubit, AddFavoriteState>(
            listener: (context, state) {
              if (state is AddFavoriteLoading) {
                Loading.showLoading(context);
              } else {
                _handleFavoriteActionState(context, state);
              }
            },
          ),
          BlocListener<DeleteFavoriteCubit, DeleteFavoriteState>(
            listener: (context, state) {
              if (state is DeleteFavoriteLoading) {
                Loading.showLoading(context);
              } else {
                _handleFavoriteActionState(context, state);
              }
            },
          ),
        ],
        child: BlocBuilder<IsFavoriteCubit, IsFavoriteState>(
          builder: (context, state) {
            bool isFavorite = false;

            if (state is IsFavoriteSuccess) {
              isFavorite = state.entity.isFavorite;
            }

            return IconButton(
              onPressed: () {
                if (isFavorite) {
                  context.read<DeleteFavoriteCubit>().deleteFavorite(moviesEntity.id.toString());
                } else {
                  final request = AddFavoriteRequest(
                    movieId: moviesEntity.id.toString(),
                    name: moviesEntity.name ?? 'The movie',
                    rating: moviesEntity.rating,
                    imageURL: moviesEntity.largeCoverImage,
                    year: moviesEntity.year ?? '2025',
                  );
                  context.read<AddFavoriteCubit>().addToFavorite(request);
                }
              },
              icon: Icon(
                isFavorite ? Icons.favorite : Icons.favorite_outline_rounded,
                color: ColorManager.white,
                size: 29,
              ),
            );
          },
        ),
      ),
    );
  }
}