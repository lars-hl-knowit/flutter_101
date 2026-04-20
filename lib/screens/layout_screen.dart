import 'package:app/util/app_colors.dart';
import 'package:app/widgets/screen_scaffold.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';

class LayoutScreen extends StatelessWidget {
  const LayoutScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenScaffold(
      title: 'Layout',
      child: SingleChildScrollView(
        child: Column(
          spacing: 32,
          children: [
            _buildSubtitle('Column'),
            _buildColumn(),
            _buildSubtitle('Row'),
            _buildRow(),
            _buildSubtitle('Wrap'),
            _buildWrap(),
          ],
        ),
      ),
    );
  }

  Text _buildSubtitle(String text) {
    return Text(
      text,
      style: TextStyle(fontSize: 24, color: AppColors.knowitBlack),
    );
  }

  Widget _buildColumn() => Container(
    color: AppColors.knowitBlack,
    width: double.infinity,
    child: Column(
      crossAxisAlignment: .center,
      mainAxisAlignment: .start,
      mainAxisSize: .max,
      spacing: 0.0,
      verticalDirection: .down,
      children: _buildItems(),
    ),
  );

  Widget _buildRow() => Container(
    color: AppColors.knowitBlack,
    height: 200,
    child: SingleChildScrollView(
      scrollDirection: .horizontal,
      child: Row(
        crossAxisAlignment: .center,
        mainAxisAlignment: .start,
        mainAxisSize: .max,
        spacing: 0.0,
        verticalDirection: .down,
        children: _buildItems(),
      ),
    ),
  );

  Wrap _buildWrap() => Wrap(
    crossAxisAlignment: .start,
    alignment: .start,
    spacing: 0.0,
    verticalDirection: .down,
    direction: .horizontal,
    runAlignment: .start,
    runSpacing: 0.0,
    children: _buildItems(),
  );

  List<Widget> _buildItems() {
    final colors = [AppColors.pink, AppColors.purple, AppColors.green, AppColors.blue];

    List<Widget> items = [];

    const boxSize = 120.0;

    for (var i = 0; i < colors.length; i++) {
      items.add(
        Container(
          width: boxSize,
          height: boxSize,
          color: colors[i],
        ),
      );
    }

    return items;
  }
}
