import 'package:flutter/material.dart';
import 'package:flutterstudy/pages/element/widgets/element_title_view.dart';

class WrapLayoutView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 19),
      child: Container(
        color: Colors.white,
        child: Column(
          children: [
            ElementTitleView('流式布局-Wrap'),
            Padding(
              padding: EdgeInsets.all(12),
              child: Wrap(
                children: List.generate(10, (i) {
                  double w = 50.0 + 10 * i;
                  return Container(
                    color: Colors.primaries[i],
                    height: 50,
                    width: w,
                    child: Text('$i'),
                  );
                }),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: Wrap(
                direction: Axis.vertical,
                children: List.generate(4, (i) {
                  double w = 50.0 + 10 * i;
                  return Container(
                    color: Colors.primaries[i],
                    height: 50,
                    width: w,
                    child: Text('$i'),
                  );
                }),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: Wrap(
                alignment: WrapAlignment.spaceBetween,
                children: List.generate(10, (i) {
                  double w = 50.0 + 10 * i;
                  return Container(
                    color: Colors.primaries[i],
                    height: 50,
                    width: w,
                    child: Text('$i'),
                  );
                }),
              ),
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: Wrap(
                spacing: 5,
                runSpacing: 3,
                crossAxisAlignment: WrapCrossAlignment.start,
                children: List.generate(10, (i) {
                  double w = 50.0 + 10 * i;
                  double h = 50.0 + 5 * i;
                  return Container(
                    color: Colors.primaries[i],
                    height: h,
                    alignment: Alignment.center,
                    width: w,
                    child: Text('$i'),
                  );
                }),
              )
            ),
            Padding(
              padding: EdgeInsets.all(12),
              child: Wrap(
                verticalDirection: VerticalDirection.up,
                children: List.generate(10, (i) {
                  double w = 50.0 + 10 * i;
                  return Container(
                    color: Colors.primaries[i],
                    height: 50,
                    width: w,
                    child: Text('$i'),
                  );
                }),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
