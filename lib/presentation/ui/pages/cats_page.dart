import 'package:cats/presentation/providers/cats_provider.dart';
import 'package:cats/presentation/entities/positioned_cat.dart';
import 'package:cats/presentation/ui/widgets/cat_widget.dart';
import 'package:cats/presentation/ui/widgets/get_button.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'dart:ui';
import 'dart:math';

const bottomMargin = 40;

class CatsPage extends StatelessWidget {
  CatsPage({required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    /// Needed to be rebuilt every time a cat is added to the loaded cats array in the provider.
    /// Counter variable is reassigned every time which is needed in order observers will be notified.
    /// Array variable is not reassigned.
    context.select((CatsProvider p) => p.countLoadedCats);

    List<PositionedCat> cats = context.select((CatsProvider p) => p.loadedCats);

    /// To avoid declaring non-final variables as member-class variables in a stateless widget
    /// we calculate here, in every rebuilding, but they are fast operations.
    /// Performance is not affected.
    List values = _getMaxTopLeftValues();
    int maxTop = values[0];
    int maxLeft = values[1];

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      backgroundColor: Colors.grey.shade300,
      body: Stack(
        children: [
          Stack(
            children: List.generate(
              cats.length,
              (index) => Positioned(
                child: Transform.rotate(
                  /// Limit rotation to this range (-Pi/2, Pi/2) in order to avoid face down
                  angle: pi * cats[index].angle - pi / 2,
                  child: CatWidget(positionedCat: cats[index]),
                ),
                top: cats[index].position.top,
                left: cats[index].position.left,
              ),
            ),
          ),
          Positioned(
            child: GetButton(
              getCall: (context) {
                context.read<CatsProvider>().getRandomCat(maxTop, maxLeft);
              },
              selectGetData: (context) =>
                  context.select((CatsProvider p) => p.currentCatGet),
            ),
            bottom: 20,
            right: 20,
          ),
        ],
      ),
    );
  }

  /// Private methods

  List<int> _getMaxTopLeftValues() {
    double width = MediaQueryData.fromWindow(window).size.width;
    double screenHeight = MediaQueryData.fromWindow(window).size.height;
    var padding = MediaQueryData.fromWindow(window).padding;
    double height = screenHeight - padding.top - padding.bottom;

    int maxTop = (height - catPhotoHeight - bottomMargin).round();
    int maxLeft = (width - catPhotoWidth).round();

    return [maxTop, maxLeft];
  }
}
