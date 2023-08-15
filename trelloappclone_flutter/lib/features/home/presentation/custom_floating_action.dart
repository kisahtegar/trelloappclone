import 'package:flutter/material.dart';

class CustomFloatingAction extends StatelessWidget {
  final String title;
  final IconData icon;
  final String route;

  const CustomFloatingAction({
    super.key,
    required this.title,
    required this.icon,
    required this.route,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.pushNamed(context, route);
      },
      child: Text.rich(
        TextSpan(
          children: [
            WidgetSpan(
              child: SizedBox(
                width: 100,
                height: 30,
                child: Card(
                  child: Center(
                    child: Text(title),
                  ),
                ),
              ),
            ),
            const WidgetSpan(
              child: SizedBox(
                width: 20,
              ),
            ),
            WidgetSpan(
              child: CircleAvatar(
                backgroundColor: Colors.green[400],
                child: Icon(icon, color: Colors.white, size: 26),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
