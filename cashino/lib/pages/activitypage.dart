import 'package:flutter/material.dart';

class activity extends StatefulWidget {
  @override
  _activityState createState() => _activityState();
}

class _activityState extends State<activity> {
  TextEditingController _searchController = TextEditingController();
  List<BoxData> _allBoxes = [];

  List<BoxData> _filteredBoxes = [];
  FilterType _selectedFilter = FilterType.all;

  @override
  void initState() {
    super.initState();
    _updateDataList();
  }

  void _updateDataList() {
    // Retrieve data from DataHandling and convert it to BoxData
    _allBoxes = DataHandling.dataList.map((data) {
      return BoxData(
        color: Colors.white,
        leftText: data['receiver'] ?? '',
        rightText: data['amount'] ?? '',
      );
    }).toList();

    // Apply filters
    _filterBoxes(_searchController.text);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: TextField(
            controller: _searchController,
            onChanged: _filterBoxes,
            decoration: InputDecoration(
              labelText: 'Search',
              border: OutlineInputBorder(),
            ),
          ),
        ),
        SizedBox(height: 10),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            _buildFilterButton(FilterType.all),
            _buildFilterButton(FilterType.credits),
            _buildFilterButton(FilterType.debits),
          ],
        ),
        SizedBox(height: 10),
        Expanded(
          child: ListView.builder(
            itemCount: _filteredBoxes.length,
            itemBuilder: (context, index) {
              return _buildBox(_filteredBoxes[index]);
            },
          ),
        ),
      ],
    );
  }

  Widget _buildBox(BoxData box) {
    return Container(
      width: 400.0,
      height: 100.0,
      decoration: BoxDecoration(
        border: Border.all(color: Colors.black, width: 2.0),
      ),
      margin: EdgeInsets.all(10.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Align(
            alignment: Alignment.centerLeft,
            child: Text(
              box.leftText,
              style: TextStyle(fontSize: 17, color: Colors.black),
            ),
          ),
          Align(
            alignment: Alignment.centerRight,
            child: Text(
              box.rightText,
              style: TextStyle(fontSize: 20, color: Colors.black),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildFilterButton(FilterType filterType) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          _selectedFilter = filterType;
          _filterBoxes(_searchController.text);
        });
      },
      style: ElevatedButton.styleFrom(
        primary: _selectedFilter == filterType ? Colors.blue : null,
      ),
      child: Text(filterType == FilterType.credits ? 'Credits' : filterType == FilterType.debits ? 'Debits' : 'All'),
    );
  }

  void _filterBoxes(String searchText) {
    setState(() {
      _filteredBoxes = _allBoxes
          .where((box) =>
              box.leftText.toLowerCase().contains(searchText.toLowerCase()) &&
              (_selectedFilter == FilterType.all ||
                  (_selectedFilter == FilterType.credits && box.rightText.startsWith('+')) ||
                  (_selectedFilter == FilterType.debits && box.rightText.startsWith('-'))))
          .toList();
    });
  }
}

enum FilterType {
  all,
  credits,
  debits,
}

class BoxData {
  final Color color;
  final String leftText;
  final String rightText;

  BoxData({required this.color, required this.leftText, required this.rightText});
}

class DataHandling {
  static List<Map<String, String>> dataList = [];

  static void handleData(String receiver, String amount) {
    // Create a map with the submitted data
    Map<String, String> dataMap = {
      'receiver': receiver,
      'amount': amount,
    };

    // Add the map to the list
    dataList.add(dataMap);

    // Print the updated list (for demonstration purposes)
    print('Updated data list: $dataList');
  }
}
