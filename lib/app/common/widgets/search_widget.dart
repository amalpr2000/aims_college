import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:get/get.dart';

class SearchButtonWidget extends StatelessWidget {
  const SearchButtonWidget({
    super.key,
    required this.searchQuery,
    required this.isSearching,
  });

  final RxString searchQuery;
  final RxBool isSearching;

  @override
  Widget build(BuildContext context) {
    return IconButton(
        onPressed: () {
          if (isSearching.value == true) {
            searchQuery.value = '';
          }
          isSearching.value = !(isSearching.value);
        },
        icon: Obx(() => isSearching.value
            ? const FaIcon(
                FontAwesomeIcons.xmark,
                size: 20,
              )
            : const FaIcon(
                FontAwesomeIcons.magnifyingGlass,
                size: 20,
              )));
  }
}

class SearchTextFieldWidget extends StatelessWidget {
  const SearchTextFieldWidget({
    super.key,
    required this.searchQuery,
    this.width,
  });
  final RxString searchQuery;
  final double? width;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: Get.height * .06696,
      width: width ?? Get.width * .8,
      child: TextField(
        autofocus: true,
        keyboardType: TextInputType.name,
        onChanged: (value) {
          searchQuery.value = value;
        },
        decoration: InputDecoration(
            filled: true,
            fillColor: Colors.blueGrey[50],
            contentPadding: const EdgeInsets.all(8),
            enabledBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white, width: 0.0),
                borderRadius: BorderRadius.circular(12)),
            hintText: 'Try search here',
            hintStyle: const TextStyle(fontSize: 14),
            labelStyle: const TextStyle(color: Colors.black),
            focusedBorder: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white, width: 0.0),
                borderRadius: BorderRadius.circular(12)),
            border: OutlineInputBorder(
                borderSide: const BorderSide(color: Colors.white, width: 0.0),
                borderRadius: BorderRadius.circular(12)),
            prefixIcon: const Icon(
              Icons.search,
            )),
      ),
    );
  }
}
