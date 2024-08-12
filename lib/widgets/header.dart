import 'package:flutter/material.dart';

import '../widgets/widgets.dart';
import '../utils/utils.dart';

class Header extends StatelessWidget {
  const Header({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(
        horizontal: 150,
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
          const Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text("Public Servants' Social Security Association"),
              Text("Ye mengest serategnoch maheberawi wastena astedader"),
            ],
          ),
          const Spacer(),
          ElevatedButton.icon(
            onPressed: () {
              showDialog(
                context: context,
                builder: (context) => const NewRecordView(),
              );
            },
            icon: const Icon(Icons.add),
            label: const Text("New Record"),
          ),
          const SizedBox(
            width: SpacingSize.s16,
          ),
          IconButton(
            onPressed: () {
              showMenu(
                context: context,
                position: const RelativeRect.fromLTRB(200, 75, 150, 0),
                items: [
                  PopupMenuItem(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) => const PasswordChangeView(),
                      );
                    },
                    child: const Text("Change Password"),
                  ),
                ],
              );
            },
            icon: const Icon(Icons.settings),
          ),
        ],
      ),
    );
  }
}
