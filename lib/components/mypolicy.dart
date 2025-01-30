import 'package:balirental_project1/components/support/policytext.dart';
import 'package:flutter/material.dart';

class Mypolicy extends StatefulWidget {
  const Mypolicy({super.key});

  @override
  State<Mypolicy> createState() => _MypolicyState();
}

class _MypolicyState extends State<Mypolicy> {
  bool _agreePolicy = false;

  void _handlePolicyAgreed() {
    setState(() {
      _agreePolicy = true; // Update checkbox state on agreement
    });
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Checkbox(
          value: _agreePolicy,
          onChanged: (value) {
            setState(() {
              _agreePolicy = value!;
            });
          },
        ),
        Text(
          'I Have read ',
          style: TextStyle(fontSize: 12),
        ),
        GestureDetector(
          onTap: () => showDialog(
            context: context,
            builder: (context) => AlertDialog(
              content: Textpolicy(
                onAgreed: _handlePolicyAgreed,
              ),
            ),
          ),
          child: Text(
            'Data Use Policy ',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                decoration: TextDecoration.underline),
          ),
        ),
        Text(
          'Including ',
          style: TextStyle(fontSize: 12),
        ),
        GestureDetector(
          onTap: () => showDialog(
              context: context,
              builder: (context) => AlertDialog(
                    content: Textpolicy(
                      onAgreed: _handlePolicyAgreed,
                    ),
                  )),
          child: Text(
            'Cookies',
            style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 12,
                decoration: TextDecoration.underline),
          ),
        )
      ],
    );
  }
}
