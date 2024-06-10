import 'package:flutter/material.dart';
import 'package:my_firstapplication/features/dashboard_screen/widgets/container_button.dart';
import 'package:my_firstapplication/features/dashboard_screen/widgets/header_card.dart';
import 'package:my_firstapplication/features/form_screen/form_class/form_class.dart';
import 'package:my_firstapplication/features/pending_approval/pending_screen/pending_class.dart';

class MediumScreen extends StatefulWidget {
  const MediumScreen({super.key});

  @override
  State<MediumScreen> createState() => _MediumScreenState();
}

class _MediumScreenState extends State<MediumScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          const HeaderCard(),
          GridView.count(
            crossAxisCount: 2,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              ButtonCard(
                title: 'Total Form Request',
                icon: Icons.create,
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const FFFormScreen()));
                },
              ),
              ButtonCard(
                title: 'Total Pending Approval',
                icon: Icons.pending_actions_outlined,
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>const PendingApprovalScreen()));
                },
              ),
              ButtonCard(
                title: 'Approval Form',
                icon: Icons.approval,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              ButtonCard(
                title: 'Pending Issuance',
                icon: Icons.incomplete_circle,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
            ],
          ),
        ],
      ),
    );
  }
}
