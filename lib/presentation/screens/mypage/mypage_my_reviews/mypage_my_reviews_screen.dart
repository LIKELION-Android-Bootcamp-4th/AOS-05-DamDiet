import 'package:damdiet/presentation/routes/app_routes.dart';
import 'package:damdiet/presentation/screens/mypage/mypage_my_reviews/mypage_my_reviews_viewmodel.dart';
import 'package:damdiet/presentation/screens/mypage/mypage_my_reviews/widgets/mypage_review_list_item.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../../../core/widgets/damdiet_appbar.dart';

class MyPageMyReviewsScreen extends StatefulWidget {
  const MyPageMyReviewsScreen({super.key});

  @override
  State<MyPageMyReviewsScreen> createState() => _MyPageMyReviewsScreen();
}

class _MyPageMyReviewsScreen extends State<MyPageMyReviewsScreen> {

  @override
  void initState() {
    super.initState();
    Future.microtask((){
      context.read<MyPageMyReviewsViewModel>().fetchMyReviews();
    });
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
    if (viewModel.isLoading) {
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
          onTapEdit: () {
            // 수정 페이지 이동 (id와 함께)
            Navigator.pushNamed(context, AppRoutes.reviewEdit, arguments: review.id);
          },
          onTapDelete: () {
            // 리뷰 삭제
          },
        );
      },
    );
  }
}


