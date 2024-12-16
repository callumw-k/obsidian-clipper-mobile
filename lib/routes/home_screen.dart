import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:logging/logging.dart';
import 'package:obsidian_clipper/extensions/text_theme_extensions.dart';
import 'package:obsidian_clipper/models/link.dart';
import 'package:obsidian_clipper/providers/dio.dart';
import 'package:obsidian_clipper/providers/get_it.dart';
import 'package:obsidian_clipper/providers/sqlite.dart';
import 'package:obsidian_clipper/routes/auto_route.gr.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sqflite/sqflite.dart';

part 'home_screen.freezed.dart';
part 'home_screen.g.dart';



@freezed
class LinkDto with _$LinkDto {
  factory LinkDto({
    required String title,
    required String image,
    required int id,
    // ignore: invalid_annotation_target
    @JsonKey(name: 'original_url') required String originalUrl,
  }) = _LinkDto;

  factory LinkDto.fromJson(Map<String, dynamic> json) => _$LinkDtoFromJson(json);
}

@riverpod
class LinkNotifier extends _$LinkNotifier {
  final client = getIt.get<AuthDioClient>().client;
  final db = getIt.get<DatabaseContext>().database;
  final logger = Logger('LinkNotifier');

  @override
  Future<List<Link>> build() async {
    return await sync();
  }

  Future<List<Link>> sync() async {
    var existingLinks = await getAll();
    final existingIds = existingLinks.map((link) => link.persistedId).toList();
    final newLinks = await fetchMissingLinks(existingIds);
    await batchInsert(newLinks);
    return [ ...existingLinks, ...newLinks];
  }

  Future<List<Link>> fetchMissingLinks(List<int> existingIds) async {
      final response = await client.post('/links/sync', data: {'link_ids': existingIds});
      logger.fine('Response data: ${response.data}');

      if (response.data is! List) throw Exception("Couldn't fetch links");

      var dtos = (response.data as List).map((item) => LinkDto.fromJson(item)).toList();
      var links = dtos.map((item) => Link.fromDto(item)).toList();

      logger.fine('Mapped list: ${dtos.toString()}');

      return links;
  }



  Future<List<Link>> getAll() async {
    var queryData = await db.query(linkTable);
    logger.fine('Query data $queryData');
    if (queryData.isEmpty) {
      return [];
    }
    return queryData.map((item) => Link.fromMap(item)).toList();
  }

  Future<Link> insert(Link link) async {
    link.id = await db.insert(linkTable, link.toMap());
    return link;
  }

  void createLink(Link link) async {
    var response = await client.post('/links', data: {'original_url': link.originalUrl});
    var dto = LinkDto.fromJson(response.data);
    link = Link.fromDto(dto);

    await insert(link);

    final previousState = await future;
    state = AsyncData([...previousState, link]);
  }

  Future<List<Link>> batchInsert(List<Link> links) async {
    await db.transaction((txn) async {
      var batch = txn.batch();
      for (var link in links) {
        batch.insert(linkTable, link.toMap(), conflictAlgorithm: ConflictAlgorithm.replace);
      }
      await batch.commit();
    });
    return links;
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
        child: Column(
          children: [
            switch (links) {
              AsyncData(:final value) => Flexible(
                child: ListView.builder(
                  shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final link = value[index];
                      return Padding(
                        padding: const EdgeInsets.all(24.0),
                        child: Container(
                          clipBehavior: Clip.hardEdge,
                          decoration: BoxDecoration(
                            color: Colors.transparent,
                            border: Border.all(
                              color: Theme.of(context).primaryColor,
                            ),
                            borderRadius: BorderRadius.circular(12),
                          ),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                             if (link.image.isNotEmpty) AspectRatio(
                                aspectRatio: 16 / 9,
                                child: Image.network(
                                  link.image,
                                  fit: BoxFit.cover,
                                ),
                              ),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                  link.title,
                                  style: context.fontSize(FontSize.large),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                    itemCount: value.length,
                  ),
              ),
              AsyncError() => const Text('Something went wrong'),
              _ => const SizedBox()
            },
            OutlinedButton(onPressed: () async  {
              var prefs = SharedPreferencesAsync();
              await prefs.clear();
              if (context.mounted) context.router.replaceAll([ LoginRoute(),]);
            }, child: Text('Logout')),
          ],
        ),
      ),
    );
  }
}
