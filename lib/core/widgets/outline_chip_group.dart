import 'package:flutter/material.dart';
import '../theme/appcolor.dart';

class OutlineChipGroup extends StatelessWidget {
  final List<String> labels;
  final List<String> values;
  final String? selectedValue;
  final ValueChanged<String?> onSelected;

  const OutlineChipGroup({
    super.key,
    required this.labels,
    required this.selectedValue,
    required this.onSelected, required this.values,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
      spacing: 12,
      runSpacing: 12,
      children: List.generate(
        labels.length,
            (index) => OutlineChipButton(
          label: labels[index],
          value: values[index],
          selectedValue: selectedValue,
          onSelected: (selected) {
            if (selectedValue == selected) {
              onSelected(null);
            } else {
              onSelected(selected);
            }
          },
        ),
      ),
    );
  }
}

class OutlineChipGridGroup extends StatelessWidget {
  final List<String> labels;
  final List<String> values;
  final String? selectedValue;
  final ValueChanged<String?> onSelected;
  final int crossAxisCount;

  const OutlineChipGridGroup({
    super.key,
    required this.labels,
    required this.values,
    required this.selectedValue,
    required this.onSelected,
    this.crossAxisCount = 2,
  });

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemCount: labels.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        mainAxisSpacing: 12,
        crossAxisSpacing: 12,
        childAspectRatio: 3.5,
      ),
      itemBuilder: (context, index) {
        return OutlineChipButton(
          label: labels[index],
          value: values[index],
          selectedValue: selectedValue,
          onSelected: (selected) {
            if (selectedValue == selected) {
              onSelected(null);
            } else {
              onSelected(selected);
            }
          },
        );
      },
    );
  }
}

class OutlineChipButton extends StatelessWidget {
  final String label;
  final String value;
  final String? selectedValue;
  final ValueChanged<String> onSelected;

  const OutlineChipButton({
    super.key,
    required this.label,
    required this.value,
    required this.selectedValue,
    required this.onSelected,
  });


  @override
  Widget build(BuildContext context) {
    final isSelected = selectedValue == value;

    return OutlinedButton(
      style: _buttonStyle(isSelected),
      onPressed: () => onSelected(value),
      child: Text(
        label,
        style: TextStyle(fontSize: 14, fontFamily: 'PretendardMedium'),
      ),
    );
  }

  ButtonStyle _buttonStyle(bool isSelected) {
    return OutlinedButton.styleFrom(
      padding: const EdgeInsets.all(14.0),
      foregroundColor: isSelected ? AppColors.primaryColor : AppColors.textHint,
      side: BorderSide(
        color: isSelected ? AppColors.primaryColor : AppColors.textHint,
      ),
    );
  }
}
