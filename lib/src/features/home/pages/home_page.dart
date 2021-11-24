import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../src.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: CustomAppBar(
        title: const Text('Home'),
        actions: [
          const Center(
            child: Badge(
              child: Icon(
                Icons.notifications,
              ),
              count: 7,
            ),
          ),
          const SizedBox(width: 8),
          Center(
            // Override the badge with a custom theme
            child: BadgeTheme.merge(
              data: const BadgeThemeData(
                backgroundColor: Colors.purple,
              ),
              child: const Badge(
                child: Icon(
                  Icons.notifications,
                ),
                count: 7,
              ),
            ),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: Container(
        padding: const EdgeInsets.all(16.0),
        width: double.infinity,
        child: Card(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Press the button to fetch a new Theme.'),
                const SizedBox(height: 16),
                ElevatedButton(
                  onPressed: () {
                    context
                        .read<TenantThemeBloc>()
                        .add(const TenantThemeToggle());
                  },
                  child: const Text('Update theme'),
                ),
                const SizedBox(height: 16),
                Pill(
                  onPressed: () {
                    debugPrint('### Pill pressed');
                  },
                  child: const Text('Pill'),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class ColorfulAppBarBottom extends StatelessWidget
    implements PreferredSizeWidget {
  const ColorfulAppBarBottom({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(
    BuildContext context,
  ) {
    final theme = TenantTheme.of(context);
    return PreferredSize(
      preferredSize: const Size.fromHeight(48),
      child: Container(
        width: double.infinity,
        color: theme.colorScheme.primaryDarker,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Row(
            children: [
              Pill.onDarkSurface(
                onPressed: () {
                  debugPrint('### Pill pressed');
                },
                child: const Text('Pill'),
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(48);
}
