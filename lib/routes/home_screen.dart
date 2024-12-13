import 'package:auto_route/auto_route.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';
import 'package:obsidian_clipper/extensions/text_theme_extensions.dart';
import 'package:obsidian_clipper/providers/dio.dart';
import 'package:obsidian_clipper/providers/get_it.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'home_screen.freezed.dart';
part 'home_screen.g.dart';

@freezed
class Link with _$Link {
  factory Link({
    required String title,
    required String image,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'original_url') required String originalUrl,
  }) = _Link;

  factory Link.fromJson(Map<String, dynamic> json) => _$LinkFromJson(json);
}

fetchLinks(Dio client, Logger logger) async {
  final response = await client.get('/links');

  logger.shout(response.data);

  if (response.data is! List) throw Exception("Couldn't fetch links");

  var list = (response.data as List).map((item) => Link.fromJson(item)).toList();

  logger.shout(list);

  return list;
}

@riverpod
class LinkNotifier extends _$LinkNotifier {
  final client = getIt.get<AuthDioClient>().client;
  final logger = Logger('LinkNotifier');
  @override
  Future<List<Link>> build() async {
    return await fetchLinks(client, logger);
  }
}

abstract class LinkListItem {
  Widget buildTitle(BuildContext context);
  Widget buildImage(BuildContext context);
  Widget buildUrl(BuildContext context);
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
    final AsyncValue<List<Link>> links = ref.watch(linkNotifierProvider);
    logger.fine(links);

    return Scaffold(
      body: SafeArea(
        child: switch (links) {
          AsyncData(:final value) => ListView.builder(
              itemBuilder: (context, index) {
                final link = value[index];
                return Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    children: [
                      Image.network(link.image),
                      Text(
                        link.title,
                        style: context.fontSize(FontSize.large),
                      ),
                    ],
                  ),
                );
              },
              itemCount: value.length,
            ),
          AsyncError() => const Text('Something went wrong'),
          _ => const CircularProgressIndicator()
        },
      ),
    );
  }
}
