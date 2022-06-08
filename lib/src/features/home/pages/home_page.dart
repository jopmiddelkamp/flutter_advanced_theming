import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../src.dart';

class HomePage extends StatefulWidget {
  const HomePage({
    super.key,
  });

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  late bool _pillSelected;

  @override
  void initState() {
    _pillSelected = false;
    super.initState();
  }

  @override
  Widget build(
    BuildContext context,
  ) {
    return Scaffold(
      appBar: CustomAppBar(
        title: const Text('Home'),
        actions: const [
          Center(
            child: CustomBadge(
              colorScheme: CustomBadgeColorSchemes.onPrimary,
              child: Icon(Icons.notifications),
              count: 7,
            ),
          ),
          SizedBox(width: 8),
          Center(
            child: CustomBadge(
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
                const CustomBadge(
                  child: Icon(Icons.notifications),
                  count: 7,
                ),
                const SizedBox(height: 16),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    CustomPill(
                      child: const Text('Pill'),
                      selected: _pillSelected,
                      onPressed: () {
                        setState(() {
                          _pillSelected = !_pillSelected;
                        });
                      },
                    ),
                    const SizedBox(width: 16),
                    const CustomPill(
                      child: Text('Pill'),
                      enabled: false,
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
