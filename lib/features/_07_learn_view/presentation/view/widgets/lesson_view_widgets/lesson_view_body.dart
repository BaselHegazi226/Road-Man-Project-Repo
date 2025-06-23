//using list view
import 'package:flutter/material.dart';
import 'package:road_man_project/core/manager/tokens_manager.dart';
import 'package:road_man_project/features/_07_learn_view/data/model/learn_path_lesson_model.dart';
import 'package:road_man_project/features/_07_learn_view/presentation/view/widgets/lesson_view_widgets/lesson_view_card.dart';

class LessonViewBody extends StatefulWidget {
  const LessonViewBody({super.key, required this.learnLessonModelList});
  final List<LearnPathLessonModel> learnLessonModelList;

  @override
  State<LessonViewBody> createState() => _LessonViewBodyState();
}

class _LessonViewBodyState extends State<LessonViewBody> {
  late String userToken = '';
  int currentAllowedIndex = 0;

  @override
  void initState() {
    super.initState();
    _loadUserToken();
  }

  Future<void> _loadUserToken() async {
    final userTokensModel = await SecureStorageHelper.getUserTokens();
    if (!mounted) return;
    setState(() {
      userToken = userTokensModel?.token ?? '';
    });
  }

  void _onLessonCompleted() {
    setState(() {
      currentAllowedIndex++;
    });
  }

  @override
  Widget build(BuildContext context) {
    final double screenWidth = MediaQuery.sizeOf(context).width;
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: screenWidth * .04),
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        itemCount: widget.learnLessonModelList.length,
        itemBuilder: (context, index) {
          return LessonViewCard(
            learnPathLessonModel: widget.learnLessonModelList[index],
            userToken: userToken,
            index: index,
            currentAllowedIndex: currentAllowedIndex,
            onLessonCompleted: _onLessonCompleted,
          );
        },
      ),
    );
  }
}
