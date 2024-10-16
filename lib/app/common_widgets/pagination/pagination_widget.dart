import 'package:flutter/material.dart';

class PaginationWidget extends StatelessWidget {
  final int totalPages;
  final int currentPage;
  final Function(int) onPageSelected;

  const PaginationWidget({
    super.key,
    required this.totalPages,
    required this.currentPage,
    required this.onPageSelected,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        // Left arrow button
        IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: currentPage > 1
              ? () => onPageSelected(currentPage - 1)
              : null, // Disable if on the first page
        ),

        // Page numbers
        for (int page = 1; page <= totalPages; page++) ...[
          GestureDetector(
            onTap: () => onPageSelected(page),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: currentPage == page ? Colors.red : Colors.grey,
                  width: 1,
                ),
                color: currentPage == page
                    ? Colors.red.withOpacity(0.1)
                    : Colors.transparent,
              ),
              child: Text(
                page.toString(),
                style: TextStyle(
                  color: currentPage == page ? Colors.red : Colors.black,
                ),
              ),
            ),
          ),
        ],

        // Right arrow button
        IconButton(
          icon: const Icon(Icons.chevron_right),
          onPressed: currentPage < totalPages
              ? () => onPageSelected(currentPage + 1)
              : null, // Disable if on the last page
        ),
      ],
    );
  }
}
