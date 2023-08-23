import 'package:flutter/material.dart';

Container customSearchbar(void serach(String value)) {
  return Container(
    margin: const EdgeInsets.symmetric(horizontal: 5, vertical: 10),
    padding: const EdgeInsets.symmetric(horizontal: 16),
    decoration: BoxDecoration(
      color: const Color.fromARGB(255, 23, 23, 23),
      borderRadius: BorderRadius.circular(5),
    ),
    child: Row(
      children: [
        Icon(
          Icons.search,
          color: Colors.grey,
        ),
        SizedBox(width: 10),
        Expanded(
          child: TextField(
            onChanged: (value) => serach(value),
            style: TextStyle(color: Colors.white),
            decoration: InputDecoration(
              hintStyle: const TextStyle(color: Colors.grey),
              hintText: "Search stock",
              border: InputBorder.none,
            ),
          ),
        ),
      ],
    ),
  );
}
