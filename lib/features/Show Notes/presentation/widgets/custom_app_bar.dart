import 'package:flutter/material.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    super.key,
    required this.isSearching,
    required this.searchController,
    this.onPressed,
  });
  final bool isSearching;
  final TextEditingController searchController;
  final void Function()? onPressed;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      title:
          isSearching
              ? SizedBox(
                height: 50,
                child: TextField(
                  autofocus: true,
                  controller: searchController,
                  cursorColor: Colors.white,
                  decoration: customInputDecoration(),
                ),
              )
              : Text('Notes', style: TextStyle(fontSize: 25)),
      actions: [
        IconButton(
          onPressed: onPressed,
          icon: Icon(
            isSearching ? Icons.close : Icons.search,
            size: 30,
            color: Colors.white,
          ),
        ),
      ],
    );
  }

  InputDecoration customInputDecoration() {
    return InputDecoration(
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.white),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.white),
      ),
      focusedBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(8),
        borderSide: BorderSide(color: Colors.white),
      ),
    );
  }
}
