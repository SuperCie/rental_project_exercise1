import 'package:flutter/material.dart';

class PolicyPage extends StatelessWidget {
  const PolicyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          'RENTAL POLICY',
          style: TextStyle(fontWeight: FontWeight.bold),
        ),
        backgroundColor: Colors.indigo.shade200,
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(24),
            child: Text(
              "This privacy policy describes how Rental Bali App collects, uses, and shares your personal information when you use our mobile app, website, or other services.\n\n"
              "What personal information do we collect?\n\n"
              "We collect the following personal information from you:\n\n"
              "Your name\n"
              "Your email address\n"
              "Your phone number\n"
              "We may also collect other perosonal information from you, such as your preferences and interests.\n\n"
              "How do we use your personal information?..\n"
              "We use your personal information for the following purposes:\n\n"
              "To provide you with our services\n"
              "To improve our services\n"
              "To contact you\n"
              "To market our services to you\n"
              "To comply with applicable laws and regulations\n\n"
              "How do we share your personal information?\n"
              "We may share your personal information with the following third parties:\n\n"
              "How do we share your personal information?\n"
              "We may share your personal information with the following third parties:\n\n"
              "Our payment Processors\n"
              "Our marketing partners\n"
              "Our legal counsel\n"
              "We will not sell or rent your personal information to third parties.\n\n"
              "How do we protect your personal information?\n"
              "We take the security of your personal information very seriously. We use a variety of security measures to protect your personal information from unauthorized access, use, disclosure, alteration, or destruction, including:\n\n"
              "Physical security measures\n"
              "Technical security measures\n"
              "Administrative security measures\n\n"
              "How can you access, correct, or delete your personal information?\n"
              "You have the right access, correct, or delete your personal information. You can do this by contacting us at info@charlesdevelopment.com.\n\n"
              "Changes to this privacy policy\n"
              "We may update this privacy policy from time to time. If we make any significant changes to this privacy policy, we will notify you by email or through our website.\n\n"
              "Contact us\n"
              "If you have any questions about this privacy policy, please contact us at info@charlesdevelopment.com.",
              style: TextStyle(fontWeight: FontWeight.bold),
              textAlign: TextAlign.justify,
            ),
          ),
        ),
      ),
    );
  }
}
