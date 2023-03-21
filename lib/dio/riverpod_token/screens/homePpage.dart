import 'package:butun_http_ornekleri/dio/riverpod_token/riverpod/riverpod_managnment.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:grock/grock.dart';

class RiverHome extends ConsumerStatefulWidget {
  const RiverHome({Key? key}) : super(key: key);

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _RiverHomeState();
}

class _RiverHomeState extends ConsumerState<RiverHome> {
  @override
  void initState() {
    ref.read(homeRiverpod).getData();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var state = ref.watch(homeRiverpod);
    return Scaffold(
      appBar: AppBar(
        title: Text("Home Page"),
      ),
      body: state.isLoading
          ? Center(
              child: CircularProgressIndicator(),
            )
          : GrockList(
              itemCount: state.datas.length,
              itemBuilder: (context, index) {
                var item = state.datas[index]!;
                return Card(
                  child: ListTile(
                    title: Text(item.title ?? ""),
                    subtitle: Text(item.description ?? ""),
                  ),
                );
              },
            ),
    );
  }
}
