import 'package:flutter/material.dart';

Card cardItem(Map<String, dynamic> data) {
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(12.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            width: 90,
            height: 90,
            margin: const EdgeInsets.only(right: 10.0),
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  data['image'],
                ),
              ),
              borderRadius: const BorderRadius.all(
                Radius.circular(16.0),
              ),
            ),
          ),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  data['title'],
                  overflow: TextOverflow.ellipsis,
                  style: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                const SizedBox(
                  height: 6.0,
                ),
                Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      data['rating']['count'].toString(),
                      style: const TextStyle(
                        fontSize: 10.0,
                      ),
                    ),
                    const SizedBox(
                      width: 4.0,
                    ),
                    const Icon(
                      Icons.circle,
                      size: 4.0,
                    ),
                    const SizedBox(
                      width: 4.0,
                    ),
                    Icon(
                      Icons.star,
                      color: Colors.orange[400],
                      size: 16.0,
                    ),
                    const SizedBox(
                      width: 4.0,
                    ),
                    Text(
                      data['rating']['rate'].toString(),
                      style: const TextStyle(
                        fontSize: 10.0,
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 6.0,
                ),
                Text(
                  data['category'],
                  style: const TextStyle(
                    fontSize: 10.0,
                  ),
                ),
                const SizedBox(
                  height: 6.0,
                ),
                Text(
                  "\$${data['price']}",
                  style: const TextStyle(
                    fontSize: 14.0,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    ),
  );
}
