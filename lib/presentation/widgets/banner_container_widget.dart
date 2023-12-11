import 'package:application_edspert/domain/entity/banner/banner_response_entity.dart';
import 'package:flutter/material.dart';

class BannerContainerWidget extends StatelessWidget {
  final BannerDataEntity banner;
  const BannerContainerWidget({super.key, required this.banner});

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: Image.network(
        banner.eventImage,
        fit: BoxFit.cover,
        errorBuilder: (context, error, stackTrace) {
          return const Text(
            'No IMG',
          );
        },
      ),
    );
  }
}
