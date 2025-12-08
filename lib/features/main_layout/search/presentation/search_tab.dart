import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/core/di/di.dart';
import 'package:movies_app/core/resources/assets_manager.dart';
import 'package:movies_app/core/resources/values_manager.dart';
import 'package:movies_app/core/widgets/custom_movie_item.dart';
import 'package:movies_app/core/widgets/custom_text_filed.dart';
import 'package:movies_app/features/main_layout/search/presentation/cubit/search_provider.dart';
import 'package:movies_app/generated/l10n.dart';
import 'package:provider/provider.dart';

class SearchTab extends StatefulWidget {
  const SearchTab({super.key});

  @override
  State<SearchTab> createState() => _SearchTabState();
}

class _SearchTabState extends State<SearchTab> {
  TextEditingController controller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => getIt<SearchProvider>(),
      child: SafeArea(
        child: Padding(
          padding: REdgeInsets.all(AppSize.s16),
          child: Column(
            children: [
              Consumer<SearchProvider>(
                builder: (context, searchProvider, child) {
                  return CustomTextFiled(
                    controller: controller,
                    icon: Icons.search,
                    label: S.of(context).search,
                    hint: S.of(context).search,
                    onChanged: (value) {
                      searchProvider.getSearchMovies(value);
                    },
                  );
                },
              ),
              Consumer<SearchProvider>(
                builder: (context, searchProvider, child) {
                  if (searchProvider.isLoading) {
                    return Expanded(
                      child: Center(child: CupertinoActivityIndicator()),
                    );
                  }
                  if (searchProvider.moviesList.isEmpty &&
                      searchProvider.errorMessage == null) {
                    return Padding(
                      padding: REdgeInsets.only(top: 300.h),
                      child: Image.asset(
                        ImageAssets.noMoviesImage,
                        height: 124.h,
                        width: 124.w,
                      ),
                    );
                  }
                  if (searchProvider.errorMessage != null) {
                    return Expanded(
                      child: Center(child: Text(searchProvider.errorMessage!)),
                    );
                  }
                  return Expanded(
                    child: GridView.builder(
                      physics: BouncingScrollPhysics(),
                      padding: REdgeInsets.only(top: 13, left: 16),

                      scrollDirection: Axis.vertical,
                      itemBuilder: (context, index) {
                        return CustomMovieItem(
                          moviesEntity: searchProvider.moviesList[index],
                        );
                      },
                      itemCount: searchProvider.moviesList.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            childAspectRatio: 0.75,
                            mainAxisSpacing: 8,
                          ),
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
