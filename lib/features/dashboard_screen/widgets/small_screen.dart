import 'package:flutter/material.dart';
import 'package:my_firstapplication/features/dashboard_screen/widgets/container_button.dart';
import 'package:my_firstapplication/features/dashboard_screen/widgets/header_card.dart';
import 'package:my_firstapplication/features/form_screen/form_class/form_class.dart';

class SmallScreen extends StatefulWidget {
  const SmallScreen({super.key});

  @override
  State<SmallScreen> createState() => _SmallScreenState();
}

class _SmallScreenState extends State<SmallScreen> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const BouncingScrollPhysics(),
      child: Column(
        children: [
          const HeaderCard(),
          Column(
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
              const SizedBox(height: 5),
              ButtonCard(
                title: 'Total Pending Approval',
                icon: Icons.pending_actions_outlined,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 10),
              ButtonCard(
                title: 'Approval Form',
                icon: Icons.approval,
                onTap: () {
                  Navigator.pop(context);
                },
              ),
              const SizedBox(height: 5),
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
