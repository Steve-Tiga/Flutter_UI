import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterstudy/pages/expand/stateManagement/model/state_management_model.dart';
import 'package:flutterstudy/widgets/badge_text.dart';
import 'package:flutterstudy/widgets/image_round_text.dart';
import 'package:flutterstudy/res/resources.dart';

class StateManageListItem extends StatelessWidget {
  final StateModel stateModel;
  final VoidCallback callback;

  const StateManageListItem({this.stateModel, this.callback});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: callback,
      child: Container(
        padding: EdgeInsets.all(24),
        child: Row(
          children: [
            Expanded(
              flex: 4,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    stateModel.title,
                    textAlign: TextAlign.start,
                    style: HSLTextStyles.textSize16,
                  ),
                  SizedBox(
                    height: 6,
                  ),
                  Text(
                    stateModel.des,
                    textAlign: TextAlign.start,
                    style: HSLTextStyles.textDark14,
                  ),
                ],
              ),
            ),
            Expanded(
                flex: 1,
                child: stateModel.count > 0
                    ? BadgeText(
                        text: stateModel.count.toString(),
                        color: HSLColors.flamingo,
                      )
                    : SizedBox())
          ],
        ),
      ),
    );
  }
}
