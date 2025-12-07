import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/di/di.dart';
import 'package:movies_app/core/resources/assets_manager.dart';
import 'package:movies_app/core/resources/color_manager.dart';
import 'package:movies_app/core/resources/font_manager.dart';
import 'package:movies_app/core/resources/values_manager.dart';
import 'package:movies_app/core/routes_manager/routes_manager.dart';
import 'package:movies_app/core/widgets/custom_elevated_button.dart';
import 'package:movies_app/core/widgets/custom_movie_item.dart';
import 'package:movies_app/features/main_layout/profile/presentation/cubit/get_favorite_cubit.dart';
import 'package:movies_app/features/main_layout/profile/presentation/cubit/get_profile_cubit.dart';
import 'package:movies_app/features/main_layout/profile/presentation/cubit/history_cubit.dart';
import 'package:movies_app/features/main_layout/profile/presentation/widgets/count_widget.dart';
import 'package:movies_app/features/main_layout/profile/presentation/widgets/custom_toggle.dart';

enum ProfileContent { favorites, history }

class ProfileTab extends StatefulWidget {
  const ProfileTab({super.key});

  @override
  State<ProfileTab> createState() => _ProfileTabState();
}

class _ProfileTabState extends State<ProfileTab> {
  ProfileContent currentContent = ProfileContent.favorites;

  @override
  void initState() {
    super.initState();
    getIt<ProfileCubit>().getProfile();
    getIt<FavoritesCubit>().getFavorites();
    getIt<HistoryCubit>().loadHistory();
  }

  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider<ProfileCubit>(
          create: (_) => getIt<ProfileCubit>()..getProfile(),
        ),
        BlocProvider<FavoritesCubit>(
          create: (_) => getIt<FavoritesCubit>()..getFavorites(),
        ),
        BlocProvider<HistoryCubit>(
          create: (_) => getIt<HistoryCubit>()..loadHistory(),
        ),
      ],
      child: BlocBuilder<ProfileCubit, ProfileState>(
        builder: (context, profileState) {
          if (profileState is ProfileLoading) {
            return const Center(child: CircularProgressIndicator());
          }

          if (profileState is ProfileError) {
            return Center(
              child: Text(
                profileState.message,
                style: TextStyle(color: ColorManager.white, fontSize: 30.sp),
              ),
            );
          }

          if (profileState is ProfileSuccess) {
            final profile = profileState.profile;

            return SingleChildScrollView(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    color: ColorManager.grey,
                    width: double.infinity,
                    padding: REdgeInsets.only(left: 6, right: 6, top: 20),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Column(
                              children: [
                                CircleAvatar(
                                  radius: AppSize.s60.r,
                                  backgroundImage: AssetImage(
                                    'assets/images/character${profile.avatarId}.png',
                                  ),
                                ),
                                SizedBox(height: AppSize.s14.h),
                                Text(
                                  profile.name ?? "Unknown User",
                                  style: TextStyle(
                                    color: ColorManager.white,
                                    fontSize: FontSize.s20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                            BlocBuilder<FavoritesCubit, FavoritesState>(
                              builder: (context, favState) {
                                int watchListCount = 0;
                                if (favState is FavoritesSuccess) {
                                  watchListCount = favState.favorites.length;
                                }
                                return GestureDetector(
                                  onTap: () => setState(
                                    () => currentContent =
                                        ProfileContent.favorites,
                                  ),
                                  child: CountWidget(
                                    text: 'Watch List',
                                    num: watchListCount,
                                  ),
                                );
                              },
                            ),
                            BlocBuilder<HistoryCubit, HistoryState>(
                              builder: (context, histState) {
                                int historyCount = 0;
                                if (histState is HistorySuccess) {
                                  historyCount = histState.history.length;
                                }
                                return GestureDetector(
                                  onTap: () => setState(
                                    () =>
                                        currentContent = ProfileContent.history,
                                  ),
                                  child: CountWidget(
                                    text: 'History',
                                    num: historyCount,
                                  ),
                                );
                              },
                            ),
                          ],
                        ),
                        SizedBox(height: 23.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            CustomElevatedButton(
                              text: 'Edit Profile',
                              bgColor: ColorManager.yellow,
                              fgColor: ColorManager.primary,
                              horizontal: 60,
                              onPressed: () {
                                Navigator.pushNamed(
                                  context,
                                  RoutesManager.updateProfile,
                                  arguments: {
                                    'name': profile.name,
                                    'phone': profile.phone,
                                    'avatarId': profile.avatarId,
                                  },
                                ).then((_) {
                                  context.read<ProfileCubit>().getProfile();
                                });
                              },
                            ),
                            CustomElevatedButton(
                              text: 'Exit',
                              bgColor: ColorManager.red,
                              fgColor: ColorManager.white,
                              horizontal: 39,
                              onPressed: () {},
                              isIcon: true,
                            ),
                          ],
                        ),
                        SizedBox(height: 30.h),
                        UnderlineToggleSwitch(
                          currentIndex:
                              currentContent == ProfileContent.favorites
                              ? 0
                              : 1,
                          onChanged: (index) {
                            setState(() {
                              currentContent = index == 0
                                  ? ProfileContent.favorites
                                  : ProfileContent.history;
                            });
                          },
                        ),
                      ],
                    ),
                  ),

                  if (currentContent == ProfileContent.favorites)
                    BlocBuilder<FavoritesCubit, FavoritesState>(
                      builder: (context, favState) {
                        if (favState is FavoritesLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (favState is FavoritesError) {
                          return Center(
                            child: Text(
                              favState.message,
                              style: TextStyle(
                                color: ColorManager.white,
                                fontSize: 24.sp,
                              ),
                            ),
                          );
                        }
                        if (favState is FavoritesSuccess) {
                          final favorites = favState.favorites;
                          if (favorites.isEmpty) {
                            return SizedBox(
                              height:
                                  MediaQuery.of(context).size.height - 360.h,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      ImageAssets.noMoviesImage,
                                      height: 120.h,
                                      width: 120.w,
                                    ),
                                    SizedBox(height: 20.h),
                                    Text(
                                      "No Favorites Yet",
                                      style: TextStyle(
                                        color: ColorManager.white,
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }
                          return GridView.builder(
                            padding: REdgeInsets.all(12),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 12.h,
                                  crossAxisSpacing: 12.w,
                                  childAspectRatio: 0.5,
                                ),
                            itemCount: favorites.length,
                            itemBuilder: (context, index) {
                              final fav = favorites[index];
                              return CustomMovieItem(
                                moviesEntity: fav.toMovieEntity(),
                              );
                            },
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    )
                  else
                    BlocBuilder<HistoryCubit, HistoryState>(
                      builder: (context, histState) {
                        if (histState is HistoryLoading) {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                        if (histState is HistoryError) {
                          return Center(
                            child: Text(
                              histState.message,
                              style: TextStyle(
                                color: ColorManager.white,
                                fontSize: 24.sp,
                              ),
                            ),
                          );
                        }
                        if (histState is HistorySuccess) {
                          final history = histState.history;
                          if (history.isEmpty) {
                            return SizedBox(
                              height:
                                  MediaQuery.of(context).size.height - 360.h,
                              child: Center(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    Image.asset(
                                      ImageAssets.noMoviesImage,
                                      height: 120.h,
                                      width: 120.w,
                                    ),
                                    SizedBox(height: 20.h),
                                    Text(
                                      "No History Yet",
                                      style: TextStyle(
                                        color: ColorManager.white,
                                        fontSize: 20.sp,
                                        fontWeight: FontWeight.w600,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            );
                          }
                          return GridView.builder(
                            padding: REdgeInsets.all(12),
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            gridDelegate:
                                SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 3,
                                  mainAxisSpacing: 12.h,
                                  crossAxisSpacing: 12.w,
                                  childAspectRatio: 0.5,
                                ),
                            itemCount: history.length,
                            itemBuilder: (context, index) {
                              final item = history[index];
                              return CustomMovieItem(
                                moviesEntity: item.toMovieEntity(),
                              );
                            },
                          );
                        }
                        return const SizedBox.shrink();
                      },
                    ),
                ],
              ),
            );
          }

          return const SizedBox.shrink();
        },
      ),
    );
  }
}
