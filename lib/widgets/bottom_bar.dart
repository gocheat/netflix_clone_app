import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      type: BottomNavigationBarType.fixed,
      currentIndex: 0,
      onTap: (index) => {

      },
      items: [
        BottomNavigationBarItem(
          icon: Icon(Icons.home, size: 18),
          label: '홈'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.search, size: 18),
          label: '검색'
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.save_alt, size: 18),
          label:  '컨텐츠 목록',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.list, size: 18),
          label:  '더보기',
        )
      ],
    );
  }
}
