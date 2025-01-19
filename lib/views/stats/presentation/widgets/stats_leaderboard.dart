import 'package:flutter/material.dart';

class LeaderboardSheet extends StatelessWidget {
  final List<LeaderboardEntry> entries;

  const LeaderboardSheet({
    super.key,
    required this.entries,
  });

  @override
  Widget build(BuildContext context) {
    return DraggableScrollableSheet(
      snap: true,
      initialChildSize: 0.31,
      minChildSize: 0.31,
      maxChildSize: 0.8,
      builder: (context, scrollController) {
        return Stack(
          children: [
            const SizedBox(
              height: double.maxFinite,
              width: double.maxFinite,
            ),
            Positioned(
              top: 15,
              bottom: 0,
              left: 0,
              right: 0,
              child: Container(
                decoration: const BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.vertical(
                    top: Radius.circular(32),
                  ),
                ),
                child: Column(
                  children: [
                    // Handle
                    Container(
                      margin: const EdgeInsets.symmetric(vertical: 12),
                      width: 40,
                      height: 4,
                      decoration: BoxDecoration(
                        color: Colors.grey[300],
                        borderRadius: BorderRadius.circular(2),
                      ),
                    ),
                    // List
                    Expanded(
                      child: ListView.builder(
                        controller: scrollController,
                        padding: const EdgeInsets.symmetric(horizontal: 16),
                        itemCount: entries.length,
                        itemBuilder: (context, index) {
                          final entry = entries[index];
                          return _LeaderboardItem(
                            rank: index + 1,
                            entry: entry,
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const Positioned(
              left: 0,
              right: 0,
              child: CircleAvatar(
                backgroundColor: Colors.white,
              ),
            )
          ],
        );
      },
    );
  }
}

class _LeaderboardItem extends StatelessWidget {
  final int rank;
  final LeaderboardEntry entry;

  const _LeaderboardItem({
    required this.rank,
    required this.entry,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(bottom: 8),
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(
        color: Colors.grey[100],
        borderRadius: BorderRadius.circular(16),
      ),
      child: Row(
        children: [
          // Rank
          SizedBox(
            width: 24,
            child: Text(
              rank.toString(),
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                color: Colors.grey,
              ),
            ),
          ),
          // Avatar
          CircleAvatar(
            radius: 20,
            backgroundImage: AssetImage(entry.avatarPath),
          ),
          const SizedBox(width: 12),
          // Name and points
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  entry.name,
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  '${entry.points} points',
                  style: TextStyle(
                    color: Colors.grey[600],
                    fontSize: 12,
                  ),
                ),
              ],
            ),
          ),
          // Medal or rank badge
          _buildRankBadge(rank),
        ],
      ),
    );
  }

  Widget _buildRankBadge(int rank) {
    IconData icon;
    Color color;

    switch (rank) {
      case 1:
        icon = Icons.emoji_events;
        color = Colors.amber;
        break;
      case 2:
        icon = Icons.workspace_premium;
        color = Colors.grey[400]!;
        break;
      case 3:
        icon = Icons.military_tech;
        color = Colors.brown[300]!;
        break;
      default:
        return const SizedBox.shrink();
    }

    return Container(
      padding: const EdgeInsets.all(8),
      decoration: BoxDecoration(
        color: color.withOpacity(0.2),
        borderRadius: BorderRadius.circular(8),
      ),
      child: Icon(
        icon,
        color: color,
        size: 20,
      ),
    );
  }
}

class LeaderboardEntry {
  final String name;
  final int points;
  final String avatarPath;
  final String? countryCode;

  const LeaderboardEntry({
    required this.name,
    required this.points,
    required this.avatarPath,
    this.countryCode,
  });
}
