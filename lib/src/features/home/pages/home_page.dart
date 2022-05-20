import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../src.dart';

class HomePage extends StatelessWidget {
  const HomePage({
    super.key,
  });

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: CustomAppBar(
        title: const Text('Home'),
        actions: const [
          Center(
            child: Badge.onPrimary(
              child: Icon(Icons.notifications),
              count: 7,
            ),
          ),
          SizedBox(width: 8),
          Center(
            child: Badge(
              child: Icon(Icons.notifications),
              count: 7,
              background: Colors.purple,
            ),
          ),
          SizedBox(width: 16),
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
                const Badge(
                  child: Icon(Icons.notifications),
                  count: 7,
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Pill(
                      onPressed: () {
                        debugPrint('### Pill pressed');
                      },
                      child: const Text('Pill'),
                    ),
                    const SizedBox(width: 16),
                    const Pill(
                      child: Text('Pill'),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
