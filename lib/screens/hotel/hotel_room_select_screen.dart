import 'dart:async';

import 'package:bta/utils/colors.dart';
import 'package:bta/utils/strings.dart';
import 'package:bta/widgets/my_button.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class HotelRoomsSelect extends StatefulWidget {
  const HotelRoomsSelect({super.key});

  @override
  _HotelRoomsSelectState createState() => _HotelRoomsSelectState();
}

class _HotelRoomsSelectState extends State<HotelRoomsSelect> {
  final GlobalKey<AnimatedListState> _listKey = GlobalKey<AnimatedListState>();

  final ScrollController _animatedListController = ScrollController();
  ListModel? _list;
  int? _selectedItem;
  late int _nextItem;
  List adultCount = ['1', '1', '1', '1', '1', '1', '1', '1', '1', '1'];

  List childCount = ['0', '0', '0', '0', '0', '0', '0', '0', '0', '0'];
  List<List> agesOfchild = [
    ['0', '0', '0', '0'],
    ['0', '0', '0', '0'],
    ['0', '0', '0', '0'],
    ['0', '0', '0', '0'],
    ['0', '0', '0', '0'],
    ['0', '0', '0', '0'],
    ['0', '0', '0', '0'],
    ['0', '0', '0', '0'],
    ['0', '0', '0', '0'],
    ['0', '0', '0', '0'],
  ];

  @override
  void initState() {
    super.initState();

    _list = ListModel<int>(
      listKey: _listKey,
      initialItems: <int>[1],
      removedItemBuilder: _buildRemovedItem,
    );
    _nextItem = 2;

    // agesOfchild.length = 10;
    int i = 0;
    while (i < 10) {
      print('while init ===========================');
      agesOfchild[i] = ['0', '0', '0', '0'];
      i++;
    }
    print(agesOfchild.toString());
    //getLastRoomsAdultsChild();
  }

  Widget _buildItem(
      BuildContext context, int index, Animation<double> animation) {
    print('buildItem ==================$index');

    return CardItem(
        animation: animation,
        item: _list![index],
        selected: _selectedItem == _list![index],
        list: _list,
        adultCountList: adultCount,
        childCountList: childCount,
        agesOfchild: agesOfchild,
        onTap: () {
          HapticFeedback.vibrate();
          _insert();
        },
        onPressedMinus: () {
          HapticFeedback.vibrate();
          _remove(index);
        });
  }

  Widget _buildRemovedItem(
      int item, BuildContext context, Animation<double> animation) {
    return CardItem(
      animation: animation,
      item: item,
      selected: false,
      onTap: () {},
      agesOfchild: const [],
      childCountList: const [],
      adultCountList: const [],
      onPressedMinus: () {},
      list: _list,
    );
  }

  void _insert() {
    final int index =
        _selectedItem == null ? _list!.length : _list!.indexOf(_selectedItem);
    print('${index}insert index===========');
    print('${_nextItem}_nextItem ===========');
    print('${_list}_list ===========');

    if (_list!.length < 10) {
      _list!.insert(index, _nextItem++);
    } else {
      // Fluttertoast.showToast(msg: '')
    }
    print('${_list!.length}_list.length ===========');

    Timer(
      const Duration(milliseconds: 220),
      () {
        _animatedListController.animateTo(
          _animatedListController.position.maxScrollExtent + 250,
          duration: const Duration(milliseconds: 500),
          curve: Curves.ease,
        );
      },
    );
  }

  void _remove(int index) async {
    print('deleting=====================$index');
    await _list!.removeAt(index);
    for (int i = index; i < _nextItem - 2; i++) {
      adultCount[i] = adultCount[i + 1];
      childCount[i] = childCount[i + 1];
    }
    _nextItem = _nextItem - 1;
  }

  @override
  Widget build(BuildContext context) {
    print('running build================${_list!.length}');
    return Scaffold(
      appBar: AppBar(
        iconTheme: const IconThemeData(color: Colors.white),
        title: const Text('Select Room',
            style: TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontStyle: FontStyle.italic)),
      ),
      body: Stack(children: [
        Padding(
          padding: const EdgeInsets.only(
            top: 16.0,
            left: 16,
            right: 16,
            // bottom: 100,
          ),
          child: AnimatedList(
            // padding: EdgeInsets.zero,
            controller: _animatedListController,
            key: _listKey,
            initialItemCount: _list!.length,
            itemBuilder: _buildItem,
          ),
        ),
        returnHotelRoomDoneButton(),
      ]),
    );
  }

  // adultChildrenInEachRoom() {
  //   return List();
  // }

  returnHotelRoomDoneButton() {
    return Positioned(
      bottom: 10,
      left: 10,
      right: 10,
      child: MyButton(
        borderRadius: 15.0,
        textColor: AppColors.white,
        color: AppColors.primary,
        onPressed: () {
          HapticFeedback.vibrate();

          List totalHotelRoomData = List.filled(4, null, growable: false);
          print('Room=================${_list!.length}');

          totalHotelRoomData[0] = _list!.length.toString();
          totalHotelRoomData[1] = adultCount;
          totalHotelRoomData[2] = childCount;
          totalHotelRoomData[3] = agesOfchild;

          Navigator.pop(context, totalHotelRoomData);
        },
        title: AppStrings.doneGuest,
      ),
    );
  }
}

typedef RemovedItemBuilder = Widget Function(
    int item, BuildContext context, Animation<double> animation);

class ListModel<E> {
  ListModel({
    required this.listKey,
    required this.removedItemBuilder,
    required Iterable<E> initialItems,
  }) : _items = List<E>.from(initialItems);

  final GlobalKey<AnimatedListState> listKey;
  final RemovedItemBuilder removedItemBuilder;
  final List<E> _items;

  AnimatedListState? get _animatedList => listKey.currentState;

  void insert(int index, E item) {
    _items.insert(index, item);
    _animatedList!.insertItem(index);
  }

  Future<E> removeAt(int index) async {
    print('removing items=========================$index');

    final E removedItem = _items.removeAt(index);

    if (removedItem != null) {
      // Future.delayed(Duration(milliseconds: 10000));
      // print('future========================');
      _animatedList!.removeItem(
        index,
        (BuildContext context, Animation<double> animation) {
          //
          return removedItemBuilder(index, context, animation);
        },
        duration: const Duration(microseconds: 0),
      );

      print('_animatedList items=========================$_animatedList');
      print('removedItem items=========================$removedItem');
      print('_items =========================$_items');
      // _next
    }
    return removedItem;
  }

  int get length => _items.length;

  E operator [](int index) => _items[index];

  int indexOf(E item) => _items.indexOf(item);
}

class CardItem extends StatefulWidget {
  const CardItem({
    super.key,
    required this.onTap,
    this.selected = false,
    required this.animation,
    required this.item,
    required this.list,
    required this.onPressedMinus,
    required this.adultCountList,
    required this.childCountList,
    required this.agesOfchild,
  }) : assert(item >= 0);
  final Animation<double>? animation;
  final VoidCallback? onTap;
  final VoidCallback? onPressedMinus;
  final int item;
  final bool? selected;
  final ListModel? list;
  final List? adultCountList;
  final List? childCountList;
  final List<List>? agesOfchild;
  @override
  _CardItemState createState() => _CardItemState(
        onTap: onTap!,
        animation: animation!,
        item: item,
        selected: false,
        listRef: list!,
        onPressedMinus: onPressedMinus!,
        adultCountList: adultCountList!,
        childCountList: childCountList!,
        agesOfchild: agesOfchild!,
      );
}

class _CardItemState extends State<CardItem> {
  _CardItemState({
    required this.onTap,
    this.selected = false,
    required this.animation,
    required this.item,
    required this.listRef,
    required this.onPressedMinus,
    required this.adultCountList,
    required this.childCountList,
    required this.agesOfchild,
  }) : assert(item >= 0);

  final Animation<double> animation;
  final VoidCallback onTap;
  final VoidCallback onPressedMinus;
  final int item;
  final bool selected;

  ListModel listRef;
  List childCountList;
  List<List> agesOfchild;

  List adultCountList;

  // final GlobalKey childAgedropDownKey = GlobalKey();
  @override
  void initState() {
    super.initState();

    print('init=============');
  }

  Widget? childAgeDropDownWidget;

  @override
  Widget build(BuildContext context) {
    print('adult=====build$adultCountList');
    print('child=====build$childCountList');
    print('child=====agesOfchild$agesOfchild');

    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.all(2.0),
          child: SizeTransition(
            axis: Axis.vertical,
            sizeFactor: animation,
            child: GestureDetector(
              behavior: HitTestBehavior.opaque,
              // onTap: onTap,
              child: SizedBox(
                // height: 150.0,
                child: Card(
                  color: Colors.white,
                  child: Column(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            // item > 1
                            //     ?
                            Row(
                              children: [
                                listRef.length > 1
                                    ? IconButton(
                                        icon: const Icon(
                                          Icons.remove_circle,
                                          color: AppColors.logoBlue,
                                        ),
                                        onPressed: onPressedMinus,
                                        // onPressed: () {

                                        //   print(
                                        //       'removing  clikced item now==========' +
                                        //           listRef.indexOf(item).toString());
                                        //   listRef.removeAt(listRef.indexOf(item));
                                        // },
                                        tooltip: 'Decrease no of  Room',
                                      )
                                    : const SizedBox(),
                                Text(
                                  'Room $item',
                                  style: const TextStyle(
                                      fontWeight: FontWeight.w400,
                                      fontSize: 15),
                                ),
                              ],
                            ),
                            listRef.length == item && listRef.length != 10
                                ? InkWell(
                                    onTap: onTap,
                                    child: Row(
                                      children: [
                                        IconButton(
                                          icon: const Icon(
                                            Icons.add_circle,
                                            color: AppColors.logoBlue,
                                          ),
                                          onPressed: onTap,
                                          tooltip: 'Increase no of  Room',
                                        ),
                                        const Text(
                                          'Add room',
                                          style: TextStyle(
                                            color: AppColors.logoBlue,
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                : const Text(''),
                          ],
                        ),
                      ),
                      Divider(
                        height: 0,
                        color: Colors.grey[300],
                        thickness: 1,
                      ),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Row(
                            children: [
                              openHotelAdultDropDown(item),
                              openHotelChildDropDown(item),
                            ],
                          ),
                          childCountList[item - 1] != "0"
                              ? const Padding(
                                  padding: EdgeInsets.only(left: 8.0, top: 8),
                                  child: Text('Ages of Children'),
                                )
                              : const Text(''),
                          childCountList[item - 1] != "0"
                              ? returnChildAgeDropDown(
                                  int.parse(childCountList[item - 1]), item)
                              : const Row(children: []),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        ),
        listRef.length == item
            ? const SizedBox(
                height: 100,
              )
            : const SizedBox(
                height: 0,
              )
      ],
    );
  }

  Widget openHotelChildDropDown(int item) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Children'),
          const SizedBox(
            height: 5,
          ),
          Container(
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.8),
                border: Border.all(color: Colors.grey[200]!)),
            child: DropdownButton<String>(
              value: childCountList[item - 1],
              icon: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(5),
                      bottomRight: Radius.circular(5)),
                ),
                width: 40,
                height: 40,
                child: const Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.grey,
                  // size: 30,
                ),
              ),
              elevation: 16,
              style: const TextStyle(
                color: Colors.black87,
                // fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
              underline: Container(
                height: 0,
                color: Colors.transparent,
              ),
              onChanged: (newValue) {
                setState(() {
                  childCountList[item - 1] = newValue;
                });
              },
              items: <String>[
                '0',
                '1',
                '2',
                '3',
                '4',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: SizedBox(
                    width: 40,
                    height: 40,
                    child: Center(
                      child: Text(
                        value,
                      ),
                    ),
                  ),
                  // overflow: TextOverflow.ellipsis,
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget openHotelAdultDropDown(int item) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('Adults'),
          const SizedBox(
            height: 5,
          ),
          Container(
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.8),
                border: Border.all(color: Colors.grey[200]!)),
            child: DropdownButton<String>(
              value: adultCountList[item - 1],
              icon: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(5),
                      bottomRight: Radius.circular(5)),
                ),
                width: 40,
                height: 40,
                child: const Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.grey,
                  // size: 30,
                ),
              ),
              elevation: 16,
              style: const TextStyle(
                color: Colors.black87,
                // fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
              underline: Container(
                height: 0,
                color: Colors.transparent,
              ),
              onChanged: (newValue) {
                setState(() {
                  adultCountList[item - 1] = newValue;
                  print('adultCount');
                  print(adultCountList.toString());
                });
              },
              items: <String>[
                '1',
                '2',
                '3',
                '4',
                '5',
                '6',
                '7',
                '8',
                '9',
                '10',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: Container(
                    child: SizedBox(
                      width: 40,
                      height: 40,
                      child: Center(
                        child: Text(
                          value,
                        ),
                      ),
                    ),
                  ),
                  // overflow: TextOverflow.ellipsis,
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget returnChildAgeDropDown(int noOfChild, int item) {
    print('returnChildAgeDropDown ==========no of child $noOfChild');
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      padding: EdgeInsets.zero,
      itemCount: noOfChild,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 3,
        mainAxisSpacing: 0,
        crossAxisSpacing: 0,
        childAspectRatio: MediaQuery.of(context).size.width /
            (MediaQuery.of(context).size.height / 3.3),
      ),
      itemBuilder: (BuildContext context, int index) {
        return returnSingleChildAgeDropDown(index, item);
      },
    );
  }

  Widget returnSingleChildAgeDropDown(int index, int item) {
    return Padding(
      padding: const EdgeInsets.only(left: 5.0, right: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // noOfChild <= 1 ? Text('Ages of Children') : Text(''),
          const SizedBox(
            height: 5,
          ),
          Container(
            height: 40,
            decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(5.8),
                border: Border.all(color: Colors.grey[200]!)),
            child: DropdownButton<String>(
              value: agesOfchild[item - 1][index],
              icon: Container(
                decoration: BoxDecoration(
                  color: Colors.grey[200],
                  borderRadius: const BorderRadius.only(
                      topRight: Radius.circular(5),
                      bottomRight: Radius.circular(5)),
                ),
                width: 40,
                height: 40,
                child: const Icon(
                  Icons.keyboard_arrow_down,
                  color: Colors.grey,
                  // size: 30,
                ),
              ),
              elevation: 16,
              style: const TextStyle(
                color: Colors.black87,
                // fontSize: 20,
                fontWeight: FontWeight.w500,
              ),
              underline: Container(
                height: 0,
                color: Colors.transparent,
              ),
              onChanged: (newValue) {
                print('click child age============before age select=');
                print(agesOfchild.toString());
                setState(() {
                  agesOfchild[item - 1][index] = newValue;
                });
                if (kDebugMode) {
                  print(
                      'childage of index $index===item $item============is $newValue');
                }
                if (kDebugMode) {
                  print(agesOfchild.toString());
                }
              },
              items: <String>[
                '0',
                '1',
                '2',
                '3',
                '4',
                '5',
                '6',
                '7',
                '8',
                '9',
                '10',
                '11',
                '12',
                '13',
                '14',
                '15',
                '16',
                '17',
              ].map<DropdownMenuItem<String>>((String value) {
                return DropdownMenuItem<String>(
                  value: value,
                  child: SizedBox(
                    width: 40,
                    height: 40,
                    child: Center(
                      child: Text(
                        value,
                      ),
                    ),
                  ),
                  // overflow: TextOverflow.ellipsis,
                );
              }).toList(),
            ),
          ),
        ],
      ),
    );
  }
}
