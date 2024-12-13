import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';
import 'package:obsidian_clipper/providers/dio.dart';
import 'package:obsidian_clipper/providers/get_it.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_screen.freezed.dart';
part 'home_screen.g.dart';

@freezed
class Link with _$Link {
  factory Link({required String title, required String image}) = _Link;

  factory Link.fromJson(Map<String, dynamic> json) => _$LinkFromJson(json);
}

@riverpod
Future<List<Link>> fetchLinks(Ref ref) async {
  final logger = Logger('FetchLinksProviders');
  final client = (await getIt.getAsync<AuthDioClient>()).client;
  final response = await client.get('/links');
  logger.shout(response.data);
  if (response.data is! List) throw Exception("Couldn't fetch links");
  var list = (response.data as List).map((item) => Link.fromJson(item)).toList();
  logger.shout(list);
  return list;
}

@riverpod
class LinkNotifier extends _$LinkNotifier {
  @override
  List<Link> build() {
    return [];
  }
}

@RoutePage()
class HomeScreen extends ConsumerStatefulWidget {
  const HomeScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _HomeScreenState();
}

class _HomeScreenState extends ConsumerState<HomeScreen> {
  final logger = Logger('HomeScreenLogger');
  @override
  Widget build(BuildContext context) {
    final AsyncValue<List<Link>> links = ref.watch(fetchLinksProvider);
    logger.fine(links);

    return const Placeholder();
  }
}
