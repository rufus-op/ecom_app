import 'package:flutter/material.dart';

class PaymentMethodOption extends StatelessWidget {
  final String title;
  final String subtitle;
  final IconData icon;
  final bool isSelected;
  final Function onTap;

  PaymentMethodOption({
    required this.title,
    required this.subtitle,
    required this.icon,
    required this.isSelected,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap as void Function()?,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 12.0),
        child: Row(
          children: [
            Icon(icon),
            const SizedBox(width: 16.0),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(title,
                      style: const TextStyle(fontWeight: FontWeight.bold)),
                  const SizedBox(height: 4.0),
                  Text(subtitle,
                      style:
                          TextStyle(fontSize: 12.0, color: Colors.grey[600])),
                ],
              ),
            ),
            Icon(
              isSelected ? Icons.check_circle_outline : Icons.circle_outlined,
              color: isSelected
                  ? Theme.of(context).primaryColor
                  : Colors.grey[400],
            ),
          ],
        ),
      ),
    );
  }
}
