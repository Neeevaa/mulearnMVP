import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:intl/intl.dart';
import '../bloc/learning_circles_bloc.dart';
import '../models/learning_circle.dart';

class LearningCirclesScreen extends StatelessWidget {
  const LearningCirclesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => LearningCirclesBloc()..add(LoadLearningCircles()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Learning Circles'),
        ),
        body: BlocBuilder<LearningCirclesBloc, LearningCirclesState>(
          builder: (context, state) {
            if (state is LearningCirclesLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is LearningCirclesError) {
              return Center(child: Text(state.message));
            }
            if (state is LearningCirclesLoaded) {
              return ListView.builder(
                itemCount: state.circles.length,
                itemBuilder: (context, index) {
                  return _LearningCircleCard(circle: state.circles[index]);
                },
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}

class _LearningCircleCard extends StatelessWidget {
  final LearningCircle circle;

  const _LearningCircleCard({required this.circle});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: InkWell(
        onTap: () {
          // TODO: Navigate to circle details
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (circle.imageUrl.isNotEmpty)
              Image.network(
                circle.imageUrl,
                height: 150,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
            Padding(
              padding: const EdgeInsets.all(16),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    circle.name,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(circle.description),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Icon(Icons.person, size: 16, color: Theme.of(context).colorScheme.secondary),
                      const SizedBox(width: 4),
                      Text('Mentor: ${circle.mentor}'),
                    ],
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(Icons.category, size: 16, color: Theme.of(context).colorScheme.secondary),
                      const SizedBox(width: 4),
                      Text(circle.category),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text('${circle.memberCount} members'),
                          Text(
                            'Next Meeting: ${DateFormat('MMM d, y').format(circle.nextMeeting)}',
                            style: Theme.of(context).textTheme.bodySmall,
                          ),
                        ],
                      ),
                      ElevatedButton(
                        onPressed: () {
                          final bloc = context.read<LearningCirclesBloc>();
                          if (circle.isJoined) {
                            bloc.add(LeaveLearningCircle(circle.id));
                          } else {
                            bloc.add(JoinLearningCircle(circle.id));
                          }
                        },
                        child: Text(circle.isJoined ? 'Leave' : 'Join'),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}