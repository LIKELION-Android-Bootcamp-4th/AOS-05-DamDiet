import 'package:damdiet/data/datasource/review_datasource.dart';
import 'package:damdiet/data/repositories/review_repository.dart';
import 'package:damdiet/presentation/routes/app_routes.dart';
import 'package:damdiet/presentation/screens/mypage/mypage_my_reviews/mypage_my_reviews_viewmodel.dart';
import 'package:damdiet/presentation/screens/mypage/mypage_my_reviews/widgets/mypage_review_list_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/widgets/damdiet_appbar.dart';

class MyPageMyReviewsScreenWithProvider extends StatelessWidget {
  const MyPageMyReviewsScreenWithProvider({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => MyPageMyReviewsViewModel(
        ReviewRepository(ReviewDatasource()),
      ),
      child: const MyPageMyReviewsScreen(),
    );
  }
}

class MyPageMyReviewsScreen extends StatefulWidget {
  const MyPageMyReviewsScreen({super.key});

  @override
  State<MyPageMyReviewsScreen> createState() => _MyPageMyReviewsScreenState();
}

class _MyPageMyReviewsScreenState extends State<MyPageMyReviewsScreen> with WidgetsBindingObserver {
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addObserver(this);
    Future.microtask(() {
      context.read<MyPageMyReviewsViewModel>().fetchMyReviews();
    });
  }

  @override
  void dispose() {
    WidgetsBinding.instance.removeObserver(this);
    super.dispose();
  }

  @override
  void didChangeAppLifecycleState(AppLifecycleState state) {
    super.didChangeAppLifecycleState(state);
    if (state == AppLifecycleState.resumed) {
      context.read<MyPageMyReviewsViewModel>().fetchMyReviews();
    }
  }

  @override
  Widget build(BuildContext context) {
    final viewModel = context.watch<MyPageMyReviewsViewModel>();

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: DamdietAppbar(
        title: '내가 작성한 리뷰',
        showBackButton: true,
      ),
      body: _buildBody(viewModel),
    );
  }

  Widget _buildBody(MyPageMyReviewsViewModel viewModel) {
    if (viewModel.isLoading && viewModel.reviews.isEmpty) {
      return const Center(child: CircularProgressIndicator());
    }

    if (viewModel.errorMessage != null) {
      return Center(child: Text(viewModel.errorMessage!));
    }

    if (viewModel.reviews.isEmpty) {
      return const Center(child: Text('작성한 리뷰가 없습니다.'));
    }

    return ListView.builder(
      itemCount: viewModel.reviews.length,
      itemBuilder: (context, index) {
        final review = viewModel.reviews[index];
        return MypageReviewListItem(
          myReview: review,
          onTapEdit: () async {
            final wasEdited = await Navigator.pushNamed(
              context,
              AppRoutes.reviewEdit,
              arguments: review,
            );
            if (wasEdited == true && mounted) {
              viewModel.fetchMyReviews();
            }
          },
          onTapDelete: () {
            viewModel.deleteReview(review.id);
          },
        );
      },
    );
  }
}