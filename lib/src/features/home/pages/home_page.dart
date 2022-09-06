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
              backgroundColor: Colors.purple,
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
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text('Select tenant:'),
                const SizedBox(height: 16),
                const _TenantRadioList(),
                const Text('Select theme mode:'),
                const SizedBox(height: 16),
                const _ThemeModeRadioList(),
                const SizedBox(height: 16),
                const Text('Widget examples:'),
                const SizedBox(height: 16),
                Row(
                  children: [
                    const CustomBadge(
                      child: Icon(Icons.notifications),
                      count: 7,
                    ),
                    const SizedBox(width: 16),
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

class _TenantRadioList extends StatelessWidget {
  const _TenantRadioList();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (_, index) {
        return _TenantRadioListItem(
          index: index,
        );
      },
      separatorBuilder: (_, __) => const Divider(
        height: 1,
      ),
      itemCount: 2,
    );
  }
}

class _TenantRadioListItem extends StatelessWidget {
  const _TenantRadioListItem({
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    final selectedTenantId = context.select<TenantThemeBloc, int>(
      (bloc) => bloc.state.tenantId,
    );
    final tenantId = index + 1;
    return RadioListTile<int>(
      title: Text('Tenant $tenantId'),
      value: tenantId,
      groupValue: selectedTenantId,
      onChanged: (_) {
        final bloc = context.read<TenantThemeBloc>();
        bloc.add(SwitchTenant(tenantId));
      },
    );
  }
}

class _ThemeModeRadioList extends StatelessWidget {
  const _ThemeModeRadioList();

  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      shrinkWrap: true,
      itemBuilder: (_, index) {
        return _ThemeModeRadioListItem(
          index: index,
        );
      },
      separatorBuilder: (_, __) => const Divider(
        height: 1,
      ),
      itemCount: ThemeMode.values.length,
    );
  }
}

class _ThemeModeRadioListItem extends StatelessWidget {
  const _ThemeModeRadioListItem({
    required this.index,
  });

  final int index;

  @override
  Widget build(BuildContext context) {
    final selectedThemeMode = context.select<TenantThemeBloc, ThemeMode>(
      (bloc) => bloc.state.themeMode,
    );
    final themeMode = ThemeMode.values[index];
    return RadioListTile<ThemeMode>(
      title: Text(themeMode.name),
      value: themeMode,
      groupValue: selectedThemeMode,
      onChanged: (_) {
        final bloc = context.read<TenantThemeBloc>();
        bloc.add(SwitchThemeMode(themeMode));
      },
    );
  }
}
