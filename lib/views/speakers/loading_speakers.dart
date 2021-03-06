import 'package:flutter/material.dart';
import 'package:letsattend/widgets/animation/shimmer.dart';

class LoadingSpeakers extends StatelessWidget {

  @override
  Widget build(BuildContext context) {

    final color = Colors.grey.withOpacity(0.5);

    final emptyDecoration = BoxDecoration(
      color: color,
      shape: BoxShape.circle,
    );

    final emptyAvatar = Container(
      width: 36,
      height: 36,
      decoration: emptyDecoration,
    );

    final emptyTitle = Container(
      height: 8,
      color: color,
    );

    final emptySubtitle = Container(
      height: 8,
      width: MediaQuery.of(context).size.width * 0.5,
      color: color,
    );

    final emptyContent = Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        emptyTitle,
        SizedBox(height: 8),
        emptySubtitle,
      ],
    );

    final emptyTile = ListTile(
      title: emptyContent,
      leading: emptyAvatar,
    );

    final titleWithShimmer = Shimmer.fromColors(
      baseColor: color,
      highlightColor: color.withOpacity(0.8),
      child: Padding(padding: EdgeInsets.symmetric(vertical: 8), child: emptyTile),
    );

    return ListView.builder(
      itemBuilder: (_, index) => titleWithShimmer,
      itemCount: (MediaQuery.of(context).size.height / 64.0).floor(),
    );

  }
}