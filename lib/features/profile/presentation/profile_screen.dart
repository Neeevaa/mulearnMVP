import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/profile_bloc.dart';
import '../models/user_profile.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ProfileBloc()..add(LoadProfile()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Profile'),
          actions: [
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                // TODO: Navigate to edit profile screen
              },
            ),
          ],
        ),
        body: BlocBuilder<ProfileBloc, ProfileState>(
          builder: (context, state) {
            if (state is ProfileLoading) {
              return const Center(child: CircularProgressIndicator());
            }
            if (state is ProfileError) {
              return Center(child: Text(state.message));
            }
            if (state is ProfileLoaded) {
              return _ProfileView(profile: state.profile);
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}

class _ProfileView extends StatelessWidget {
  final UserProfile profile;

  const _ProfileView({required this.profile});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);

    return ListView(
      padding: const EdgeInsets.all(16),
      children: [
        Center(
          child: Stack(
            alignment: Alignment.bottomRight,
            children: [
              CircleAvatar(
                radius: 60,
                backgroundImage: profile.avatar != null
                    ? NetworkImage(profile.avatar!)
                    : null,
                child: profile.avatar == null
                    ? Text(
                        profile.name[0].toUpperCase(),
                        style: theme.textTheme.displayMedium,
                      )
                    : null,
              ),
              Container(
                decoration: BoxDecoration(
                  color: theme.colorScheme.primary,
                  shape: BoxShape.circle,
                ),
                child: IconButton(
                  icon: const Icon(Icons.camera_alt),
                  color: theme.colorScheme.onPrimary,
                  onPressed: () {
                    // TODO: Implement image upload
                  },
                ),
              ),
            ],
          ),
        ),
        const SizedBox(height: 24),
        Text(
          profile.name,
          style: theme.textTheme.headlineMedium,
          textAlign: TextAlign.center,
        ),
        if (profile.bio != null) ...[
          const SizedBox(height: 8),
          Text(
            profile.bio!,
            style: theme.textTheme.bodyLarge,
            textAlign: TextAlign.center,
          ),
        ],
        if (profile.location != null) ...[
          const SizedBox(height: 8),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(Icons.location_on, size: 16, color: theme.colorScheme.secondary),
              const SizedBox(width: 4),
              Text(profile.location!),
            ],
          ),
        ],
        const SizedBox(height: 24),
        _ProfileSection(
          title: 'Karma Points',
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('${profile.karmaPoints} points'),
              Text('Rank #${profile.rank}'),
            ],
          ),
        ),
        if (profile.interests.isNotEmpty)
          _ProfileSection(
            title: 'Interests',
            child: Wrap(
              spacing: 8,
              runSpacing: 8,
              children: profile.interests
                  .map((interest) => Chip(label: Text(interest)))
                  .toList(),
            ),
          ),
        if (profile.skills.isNotEmpty)
          _ProfileSection(
            title: 'Skills',
            child: Column(
              children: profile.skills.entries
                  .map(
                    (skill) => Padding(
                      padding: const EdgeInsets.only(bottom: 8),
                      child: Row(
                        children: [
                          Expanded(child: Text(skill.key)),
                          _SkillLevel(level: skill.value),
                        ],
                      ),
                    ),
                  )
                  .toList(),
            ),
          ),
        if (profile.achievements.isNotEmpty)
          _ProfileSection(
            title: 'Achievements',
            child: ListView.builder(
              shrinkWrap: true,
              physics: const NeverScrollableScrollPhysics(),
              itemCount: profile.achievements.length,
              itemBuilder: (context, index) {
                return ListTile(
                  leading: const Icon(Icons.emoji_events),
                  title: Text(profile.achievements[index]),
                );
              },
            ),
          ),
      ],
    );
  }
}

class _ProfileSection extends StatelessWidget {
  final String title;
  final Widget child;

  const _ProfileSection({
    required this.title,
    required this.child,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.only(bottom: 16),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              title,
              style: Theme.of(context).textTheme.titleLarge,
            ),
            const SizedBox(height: 16),
            child,
          ],
        ),
      ),
    );
  }
}

class _SkillLevel extends StatelessWidget {
  final int level;

  const _SkillLevel({required this.level});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: List.generate(5, (index) {
        return Icon(
          index < level ? Icons.star : Icons.star_border,
          color: Theme.of(context).colorScheme.primary,
          size: 20,
        );
      }),
    );
  }
}