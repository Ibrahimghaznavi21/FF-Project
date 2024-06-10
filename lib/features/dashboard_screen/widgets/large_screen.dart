import 'package:flutter/material.dart';
import 'package:my_firstapplication/features/dashboard_screen/widgets/container_button.dart';
import 'package:my_firstapplication/features/dashboard_screen/widgets/header_card.dart';
import 'package:my_firstapplication/features/form_screen/form_class/form_class.dart';
import 'package:my_firstapplication/features/pending_approval/pending_screen/pending_class.dart';

class LargeScreen extends StatefulWidget {
  const LargeScreen({super.key});

  @override
  State<LargeScreen> createState() => _LargeScreenState();
}

class _LargeScreenState extends State<LargeScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          const HeaderCard(),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Expanded(
                child: ButtonCard(
                  title: 'Total Form Request ',
                  icon: Icons.create,
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const FFFormScreen()));
                  },
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: ButtonCard(
                  title: 'Total Pending Approval',
                  icon: Icons.pending_actions_outlined,
                  onTap: () {
                    Navigator.push(context, MaterialPageRoute(builder: (context)=>const PendingApprovalScreen()));
                  },
                ),
              ),
            ],
          ),
          const SizedBox(height: 10),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Expanded(
                child: ButtonCard(
                  title: 'Approval Form',
                  icon: Icons.approval,
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
              const SizedBox(width: 5),
              Expanded(
                child: ButtonCard(
                  title: 'Pending Issuance',
                  icon: Icons.incomplete_circle,
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
