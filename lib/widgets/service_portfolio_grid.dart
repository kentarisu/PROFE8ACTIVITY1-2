import 'package:flutter/material.dart';

class ServicePortfolioGrid extends StatelessWidget {
  const ServicePortfolioGrid({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 600,
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: CustomStaggeredGrid(
          children: portfolioItems.asMap().entries.map((entry) {
            int index = entry.key;
            PortfolioItem item = entry.value;

            // Create staggered effect with varying heights
            double height;
            bool isFullWidth = false;

            if (index % 3 == 0) {
              height = 140; // Increased from 120
              isFullWidth = true; // Full width
            } else if (index % 2 == 0) {
              height = 200; // Increased from 180
            } else {
              height = 160; // Increased from 140
            }

            return StaggeredGridItem(
              height: height,
              isFullWidth: isFullWidth,
              child: PortfolioTile(item: item),
            );
          }).toList(),
        ),
      ),
    );
  }
}

class CustomStaggeredGrid extends StatelessWidget {
  final List<StaggeredGridItem> children;

  const CustomStaggeredGrid({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: _buildRows(),
      ),
    );
  }

  List<Widget> _buildRows() {
    List<Widget> rows = [];
    List<StaggeredGridItem> leftColumn = [];
    List<StaggeredGridItem> rightColumn = [];

    for (int i = 0; i < children.length; i++) {
      StaggeredGridItem item = children[i];

      if (item.isFullWidth) {
        // Add any pending items in columns
        if (leftColumn.isNotEmpty || rightColumn.isNotEmpty) {
          rows.add(_buildTwoColumnRow(leftColumn, rightColumn));
          leftColumn.clear();
          rightColumn.clear();
        }
        // Add full width item
        rows.add(Padding(
          padding: const EdgeInsets.only(bottom: 12),
          child: SizedBox(height: item.height, child: item.child),
        ));
      } else {
        // Distribute items between left and right columns
        double leftHeight =
            leftColumn.fold(0.0, (sum, item) => sum + item.height + 12);
        double rightHeight =
            rightColumn.fold(0.0, (sum, item) => sum + item.height + 12);

        if (leftHeight <= rightHeight) {
          leftColumn.add(item);
        } else {
          rightColumn.add(item);
        }
      }
    }

    // Add remaining items
    if (leftColumn.isNotEmpty || rightColumn.isNotEmpty) {
      rows.add(_buildTwoColumnRow(leftColumn, rightColumn));
    }

    return rows;
  }

  Widget _buildTwoColumnRow(
      List<StaggeredGridItem> leftItems, List<StaggeredGridItem> rightItems) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 12),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              children: leftItems
                  .map((item) => Padding(
                        padding: const EdgeInsets.only(bottom: 12, right: 6),
                        child: SizedBox(height: item.height, child: item.child),
                      ))
                  .toList(),
            ),
          ),
          Expanded(
            child: Column(
              children: rightItems
                  .map((item) => Padding(
                        padding: const EdgeInsets.only(bottom: 12, left: 6),
                        child: SizedBox(height: item.height, child: item.child),
                      ))
                  .toList(),
            ),
          ),
        ],
      ),
    );
  }
}

class StaggeredGridItem {
  final Widget child;
  final double height;
  final bool isFullWidth;

  StaggeredGridItem({
    required this.child,
    required this.height,
    this.isFullWidth = false,
  });
}

class PortfolioItem {
  final String title;
  final String type;
  final String duration;
  final Color color;
  final IconData icon;

  PortfolioItem({
    required this.title,
    required this.type,
    required this.duration,
    required this.color,
    required this.icon,
  });
}

final List<PortfolioItem> portfolioItems = [
  PortfolioItem(
    title: 'Sarah & Mike Wedding',
    type: 'Wedding Video',
    duration: '12:30',
    color: Colors.pink,
    icon: Icons.favorite,
  ),
  PortfolioItem(
    title: 'TechCorp Promo',
    type: 'Corporate',
    duration: '2:45',
    color: Colors.blue,
    icon: Icons.business,
  ),
  PortfolioItem(
    title: 'Summer Vibes MV',
    type: 'Music Video',
    duration: '3:22',
    color: Colors.orange,
    icon: Icons.music_video,
  ),
  PortfolioItem(
    title: 'Instagram Reel',
    type: 'Social Media',
    duration: '0:30',
    color: Colors.purple,
    icon: Icons.phone_android,
  ),
  PortfolioItem(
    title: 'Product Showcase',
    type: 'Commercial',
    duration: '1:15',
    color: Colors.green,
    icon: Icons.shopping_cart,
  ),
  PortfolioItem(
    title: 'Travel Documentary',
    type: 'Documentary',
    duration: '8:45',
    color: Colors.teal,
    icon: Icons.travel_explore,
  ),
  PortfolioItem(
    title: 'Brand Story',
    type: 'Corporate',
    duration: '4:20',
    color: Colors.indigo,
    icon: Icons.business_center,
  ),
  PortfolioItem(
    title: 'Event Highlight',
    type: 'Event',
    duration: '6:15',
    color: Colors.deepOrange,
    icon: Icons.event,
  ),
];

class PortfolioTile extends StatelessWidget {
  final PortfolioItem item;

  const PortfolioTile({super.key, required this.item});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () => _showPortfolioDialog(context),
      child: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              item.color.withOpacity(0.8),
              item.color.withOpacity(0.6),
            ],
          ),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
              color: item.color.withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            ),
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.all(12),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisSize: MainAxisSize.min,
            children: [
              Row(
                children: [
                  Icon(
                    item.icon,
                    color: Colors.white,
                    size: 20,
                  ),
                  const Spacer(),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 6,
                      vertical: 2,
                    ),
                    decoration: BoxDecoration(
                      color: Colors.white.withOpacity(0.2),
                      borderRadius: BorderRadius.circular(8),
                    ),
                    child: Text(
                      item.duration,
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              Flexible(
                child: Text(
                  item.title,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 14,
                    fontWeight: FontWeight.bold,
                  ),
                  maxLines: 2,
                  overflow: TextOverflow.ellipsis,
                ),
              ),
              const SizedBox(height: 2),
              Text(
                item.type,
                style: const TextStyle(
                  color: Colors.white70,
                  fontSize: 10,
                ),
              ),
              const SizedBox(height: 4),
              const Row(
                children: [
                  Icon(
                    Icons.play_circle_outline,
                    color: Colors.white70,
                    size: 14,
                  ),
                  SizedBox(width: 4),
                  Text(
                    'Preview',
                    style: TextStyle(
                      color: Colors.white70,
                      fontSize: 10,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _showPortfolioDialog(BuildContext context) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: Text(item.title),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              children: [
                Icon(item.icon, color: item.color),
                const SizedBox(width: 8),
                Text(
                  item.type,
                  style: const TextStyle(fontWeight: FontWeight.w600),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Text('Duration: ${item.duration}'),
            const SizedBox(height: 16),
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: item.color.withOpacity(0.1),
                borderRadius: BorderRadius.circular(8),
              ),
              child: const Text(
                'In a real app, this would show a video preview using the staggered grid layout.',
                style: TextStyle(fontStyle: FontStyle.italic),
              ),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('Close'),
          ),
          ElevatedButton(
            onPressed: () {
              Navigator.pop(context);
              ScaffoldMessenger.of(context).showSnackBar(
                SnackBar(content: Text('Added ${item.title} to favorites!')),
              );
            },
            style: ElevatedButton.styleFrom(backgroundColor: item.color),
            child: const Text('Add to Favorites',
                style: TextStyle(color: Colors.white)),
          ),
        ],
      ),
    );
  }
}
