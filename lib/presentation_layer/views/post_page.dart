import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:repository_riverpod_mvvm/presentation_layer/common_widgets/common_app_bar.dart';
import 'package:repository_riverpod_mvvm/presentation_layer/view_models/post_page_view_model.dart';

class PostPage extends ConsumerWidget {
  const PostPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final vm = ref.watch(postPageViewModelProvider);
    return Scaffold(
      appBar: CommonAppBar(vm.pageTitle),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  controller: vm.contentController,
                  enabled: true,
                  style: const TextStyle(color: Colors.black),
                  obscureText: false,
                  maxLines: 1,
                  decoration: InputDecoration(
                    labelText: vm.contentLabel,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextFormField(
                  controller: vm.accountIdController,
                  enabled: true,
                  style: const TextStyle(color: Colors.black),
                  obscureText: false,
                  maxLines: 1,
                  decoration: InputDecoration(
                    labelText: vm.accountIdLabel,
                  )),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: ElevatedButton(
                  onPressed: () => vm.onPost(context: context),
                  child: Text(vm.pageTitle)),
            )
          ],
        ),
      ),
    );
  }
}
