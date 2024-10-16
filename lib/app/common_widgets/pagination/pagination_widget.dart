import 'package:flutter/material.dart';

class PaginationWidget extends StatefulWidget {
  final int totalPages;
  final int currentPage;
  final ValueChanged<int> onPageSelected;

  const PaginationWidget({
    super.key,
    required this.totalPages,
    required this.currentPage,
    required this.onPageSelected,
  });

  @override
  _PaginationWidgetState createState() => _PaginationWidgetState();
}

class _PaginationWidgetState extends State<PaginationWidget> {
  // Number of visible pages at a time
  final int visiblePages = 5;

  // Start and end indices for the visible page range
  late int startPage;
  late int endPage;

  @override
  void initState() {
    super.initState();
    _updateVisiblePages();
  }

  // Update the visible page range based on the current page
  void _updateVisiblePages() {
    startPage = ((widget.currentPage - 1) ~/ visiblePages) * visiblePages + 1;
    endPage = (startPage + visiblePages - 1).clamp(1, widget.totalPages);
  }

  @override
  void didUpdateWidget(covariant PaginationWidget oldWidget) {
    super.didUpdateWidget(oldWidget);
    if (oldWidget.currentPage != widget.currentPage) {
      _updateVisiblePages();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        // Left arrow button
        IconButton(
          icon: const Icon(Icons.chevron_left),
          onPressed: widget.currentPage > 1
              ? () => widget.onPageSelected(widget.currentPage - 1)
              : null, // Disable if on the first page
        ),

        // Page numbers (show limited number of pages based on start and end range)
        for (int page = startPage; page <= endPage; page++) ...[
          GestureDetector(
            onTap: () => widget.onPageSelected(page),
            child: Container(
              margin: const EdgeInsets.symmetric(horizontal: 4),
              padding: const EdgeInsets.all(8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(8),
                border: Border.all(
                  color: widget.currentPage == page ? Colors.red : Colors.grey,
                  width: 1,
                ),
                color: widget.currentPage == page
                    ? Colors.red.withOpacity(0.1)
                    : Colors.transparent,
              ),
              child: Text(
                page.toString(),
                style: TextStyle(
                  color: widget.currentPage == page ? Colors.red : Colors.black,
                ),
              ),
            ),
          ),
        ],

        // Right arrow button
        IconButton(
          icon: const Icon(Icons.chevron_right),
          onPressed: widget.currentPage < widget.totalPages
              ? () => widget.onPageSelected(widget.currentPage + 1)
              : null, // Disable if on the last page
        ),
      ],
    );
  }
}
