import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../bloc/karma_points_bloc.dart';
import '../models/karma_points.dart';

class KarmaPointsScreen extends StatelessWidget {
  const KarmaPointsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => KarmaPointsBloc()..add(LoadKarmaPoints()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Karma Points'),
        ),
        body: BlocBuilder<KarmaPointsBloc, KarmaPointsState>(
          builder: (context, state) {
            if (state is KarmaPointsLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is KarmaPointsError) {
              return Center(child: Text(state.message));
            }
            if (state is KarmaPointsLoaded) {
              return _KarmaPointsView(karmaPoints: state.karmaPoints);
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}

class _KarmaPointsView extends StatelessWidget {
  final KarmaPoints karmaPoints;

  const _KarmaPointsView({required this.karmaPoints});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              children: [
                Text(
                  karmaPoints.total.toString(),
                  style: theme.textTheme.headlineLarge?.copyWith(
                    color: theme.colorScheme.primary,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  'Total Karma Points',
                  style: theme.textTheme.titleMedium,
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Points Breakdown',
                  style: theme.textTheme.titleLarge,
                ),
                const SizedBox(height: 16),
                ...karmaPoints.breakdown.entries.map(
                  (entry) => Padding(
                    padding: const EdgeInsets.only(bottom: 8),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(entry.key),
                        Text(
                          entry.value.toString(),
                          style: theme.textTheme.titleMedium?.copyWith(
                            color: theme.colorScheme.primary,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 16),
        Card(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Recent Activities',
                  style: theme.textTheme.titleLarge,
                ),
                const SizedBox(height: 16),
                ...karmaPoints.recentActivities.map(
                  (activity) => _ActivityItem(activity: activity),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}

class _ActivityItem extends StatelessWidget {
  final KarmaActivity activity;

  const _ActivityItem({required this.activity});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return Padding(
      padding: const EdgeInsets.only(bottom: 16),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
            decoration: BoxDecoration(
              color: theme.colorScheme.primary,
              borderRadius: BorderRadius.circular(12),
            ),
            child: Text(
              '+${activity.points}',
              style: theme.textTheme.bodyMedium?.copyWith(
                color: theme.colorScheme.onPrimary,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
          const SizedBox(width: 12),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  activity.title,
                  style: theme.textTheme.titleMedium,
                ),
                Text(
                  activity.description,
                  style: theme.textTheme.bodyMedium,
                ),
                const SizedBox(height: 4),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      DateFormat('MMM d, y').format(activity.timestamp),
                      style: theme.textTheme.bodySmall,
                    ),
                    Container(
                      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 2),
                      decoration: BoxDecoration(
                        color: theme.colorScheme.surfaceVariant,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Text(
                        activity.category,
                        style: theme.textTheme.bodySmall,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}