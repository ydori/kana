import "package:flutter/material.dart";

class ChartCard extends StatelessWidget {
  const ChartCard({
    super.key,
    required this.title,
    required this.subtitle,
    required this.onTap,
  });

  final String title;
  final String subtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      child: InkWell(
        onTap: onTap,
        splashFactory: NoSplash.splashFactory,
        child: AspectRatio(
          aspectRatio: 1.0,
          child: Container(
            width: double.infinity,
            padding: EdgeInsets.all(16.0),
            alignment: Alignment.center,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Text(
                  title,
                  style: Theme.of(context).textTheme.headlineLarge,
                ),
                SizedBox(height: 8.0),
                Text(
                  subtitle,
                  style: Theme.of(context).textTheme.titleSmall?.copyWith(
                        color: Colors.grey[700],
                      ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
