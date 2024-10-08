import 'package:flutter/material.dart';

import '../widgets/widgets.dart';
import '../utils/utils.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final size = context.deviceSize;
    final textTheme = context.textTheme;

    return Container(
      padding: EdgeInsets.symmetric(
        horizontal: size.width * 0.1,
        vertical: SpacingSize.s20,
      ),
      child: Row(
        children: [
          CircleAvatar(
            child: Image.asset(
              "assets/images/psssa_logo.png",
            ),
          ),
          const SizedBox(
            width: SpacingSize.s16,
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  "Public Servants' Social Security Association",
                  style: textTheme.titleLarge,
                  maxLines: 2,
                  softWrap: true,
                  overflow: TextOverflow.fade,
                ),
                Text(
                  "Ye mengest serategnoch maheberawi wastena astedader",
                  style: textTheme.titleLarge,
                  maxLines: 2,
                  softWrap: true,
                  overflow: TextOverflow.fade,
                ),
              ],
            ),
          ),
          // const Spacer(),
          ElevatedButton(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => const PasswordChangeView(),
              );
            },
            child: const Text("Change Password"),
          ),
        ],
      ),
    );
  }
}
