import 'package:brand_news_app/core/config/constants.dart';
import 'package:brand_news_app/models/source_model.dart';
import 'package:flutter/material.dart';

class TabItemWidget extends StatelessWidget {
  bool isSelected;
  final SourceModel sourceModel;

  TabItemWidget({
    super.key,
    required this.sourceModel,
    required this.isSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 2),
      decoration: BoxDecoration(
          color: isSelected ? Constants.theme.primaryColor : Colors.transparent,
          borderRadius: BorderRadius.circular(25),
          border: Border.all(
            color: Constants.theme.primaryColor,
            width: 2,
          )),
      child: Text(
        sourceModel.name,
        style: Constants.theme.textTheme.bodyMedium?.copyWith(
          color: isSelected ? Colors.white : Constants.theme.primaryColor,
        ),
      ),
    );
  }
}
