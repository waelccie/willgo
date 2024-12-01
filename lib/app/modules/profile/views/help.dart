import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../widgets/custom_text_field.dart';
import '../Widget/weidget_buildHelpType.dart';

class HelpCenterPage extends StatelessWidget {
  const HelpCenterPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Help Center'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 20),
            Text(
              "Hi, how we can help you?",
              style: GoogleFonts.inter(
                fontSize: 18,
                fontWeight: FontWeight.w500,
                color: Colors.black,
              ),
            ),
            const SizedBox(height: 16),
            const CustomTextField(
              height: 24,
              hint: "Search for food",
              prefixIcon: Icon(
                Icons.search,
              ),
            ),
            const SizedBox(height: 20),
            // List of Help Topics
            Expanded(
              child: ListView(
                children: [
                  buildHelpTile(
                    icon: Icons.apps,
                    title: "General",
                    subtitle: "Basic question about Restate",
                    iconColor: Colors.blue,
                  ),
                  buildHelpTile(
                    icon: Icons.attach_money,
                    title: "Sellers",
                    subtitle:
                        "All you need to know about selling your \nhome to Restate",
                    iconColor: Colors.orange,
                  ),
                  buildHelpTile(
                    icon: Icons.shopping_cart,
                    title: "Buyers",
                    subtitle:
                        "Everything you need to know about \n buying with Restate",
                    iconColor: Colors.red,
                  ),
                  buildHelpTile(
                    icon: Icons.person,
                    title: "Agents",
                    subtitle:
                        "How buying agents and listing agents\n can work with Restate",
                    iconColor: Colors.blue,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
