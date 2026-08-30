import 'dart:io';

import 'package:flutter_test/flutter_test.dart';

void main() {
  test('private exercise key is never referenced by Flutter source', () {
    final source = Directory('lib')
        .listSync(recursive: true)
        .whereType<File>()
        .where((file) => file.path.endsWith('.dart'))
        .map((file) => file.readAsStringSync())
        .join('\n');

    expect(source, isNot(contains('EXERCISE_DB_API_KEY')));
    expect(source, isNot(contains('x-api-key')));
  });

  test('hardening migration keeps subscription writes server-only', () {
    final migration = File(
      'supabase/migrations/20260830150510_public_release_hardening.sql',
    ).readAsStringSync();

    expect(migration, contains('REVOKE ALL ON TABLE public.user_subscription'));
    expect(
      migration,
      contains(
        'GRANT SELECT ON TABLE public.user_subscription TO authenticated',
      ),
    );
    expect(migration, contains('reserve_workout_generation'));
    expect(migration, contains('TO service_role'));
  });
}
