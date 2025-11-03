import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/interest_groups_bloc.dart';
import '../models/interest_group.dart';

class InterestGroupsScreen extends StatelessWidget {
  const InterestGroupsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => InterestGroupsBloc()..add(LoadInterestGroups()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Interest Groups'),
        ),
        body: BlocBuilder<InterestGroupsBloc, InterestGroupsState>(
          builder: (context, state) {
            if (state is InterestGroupsLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is InterestGroupsError) {
              return Center(child: Text(state.message));
            }
            if (state is InterestGroupsLoaded) {
              return ListView.builder(
                itemCount: state.groups.length,
                itemBuilder: (context, index) {
                  return _InterestGroupCard(group: state.groups[index]);
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

class _InterestGroupCard extends StatelessWidget {
  final InterestGroup group;

  const _InterestGroupCard({required this.group});

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      child: InkWell(
        onTap: () {
          // TODO: Navigate to group details
        },
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            if (group.imageUrl.isNotEmpty)
              Image.network(
                group.imageUrl,
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
                    group.name,
                    style: Theme.of(context).textTheme.titleLarge,
                  ),
                  const SizedBox(height: 8),
                  Text(group.description),
                  const SizedBox(height: 8),
                  Wrap(
                    spacing: 8,
                    children: group.tags.map((tag) => Chip(label: Text(tag))).toList(),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text('${group.memberCount} members'),
                      ElevatedButton(
                        onPressed: () {
                          final bloc = context.read<InterestGroupsBloc>();
                          if (group.isJoined) {
                            bloc.add(LeaveInterestGroup(group.id));
                          } else {
                            bloc.add(JoinInterestGroup(group.id));
                          }
                        },
                        child: Text(group.isJoined ? 'Leave' : 'Join'),
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