import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:login_app_2025/constants/app_colors.dart';

// --- Placeholder/Shim for missing project classes (AppColors) ---

// --- End Shims ---

class UpcomingEventsCard extends StatelessWidget {
  const UpcomingEventsCard({super.key});

  @override
  Widget build(BuildContext context) {
    // Example data for the event
    const String eventDate = '10 JUN';
    const String eventTitle = '20th Company Anniversary Gala';
    const String eventDescription = 'A formal celebration of the company’s 20th year, mandatory for all members.';

    return GestureDetector(
      onTap: () {
        // Handle navigation to event details
      },
      child: Card(
        // The card uses elevation and a rounded shape for a modern look
        elevation: 4,
        margin: const EdgeInsets.only(bottom: 16.0),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        child: Container(
          height: 120,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(12),
            // Use a slight gradient or color overlay for visual appeal
            gradient: LinearGradient(
              colors: [AppColors.dataViz1.withAlpha(0), AppColors.dataViz3.withAlpha(200)],
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ),
          ),
          child: Stack(
            children: [
              // Subtle background overlay for texture (matches user's intent)
              Container(
                decoration: BoxDecoration(
                  color: Colors.black.withOpacity(0.15),
                  borderRadius: BorderRadius.circular(12),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(16.0),
                child: Row(
                  children: [
                    // Date Indicator (Left Side)
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 8),
                      decoration: BoxDecoration(
                        color: AppColors.dataViz3, // Amber color for highlight
                        borderRadius: BorderRadius.circular(8),
                      ),
                      child: Text(
                        eventDate,
                        style: Theme.of(context).textTheme.titleMedium!.copyWith(
                          color: Colors.white,
                          fontWeight: FontWeight.w900,
                          fontSize: 16,
                        ),
                        textAlign: TextAlign.center,
                      ),
                    ),
                    const SizedBox(width: 16),
                    // Event Details (Right Side)
                    Expanded(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            eventTitle,
                            style: Theme.of(context).textTheme.titleMedium!.copyWith(
                              fontWeight: FontWeight.bold,
                              color: AppColors.cardDefaultBackground, // White text
                              overflow: TextOverflow.ellipsis,
                            ),
                            maxLines: 1,
                          ),
                          const SizedBox(height: 4),
                          Text(
                            eventDescription,
                            style: Theme.of(context).textTheme.bodySmall!.copyWith(
                              color: AppColors.surfaceBackground, // Light gray text
                              overflow: TextOverflow.ellipsis,
                            ),
                            maxLines: 2,
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              // Arrow indicator
              const Positioned(
                right: 10,
                top: 10,
                child: Icon(CupertinoIcons.chevron_forward, color: Colors.white70, size: 20),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
