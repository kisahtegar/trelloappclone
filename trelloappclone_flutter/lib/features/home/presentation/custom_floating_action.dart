import 'package:flutter/material.dart';

class CustomFloatingAction extends StatelessWidget {

  const CustomFloatingAction({
    required this.title, required this.icon, required this.route, super.key,
  });
  final String title;
  final IconData icon;
  final String route;

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
