import 'package:flutter/material.dart';

class CustomDropdown extends StatefulWidget {
  const CustomDropdown({
    super.key,
    required this.icon,
    required this.height,
    required this.width,
    required this.label,
    required this.items,
    this.dropdownWidth = 250,
  });

  final String icon;
  final double height;
  final double width;
  final String label;
  final List<String> items;
  final double dropdownWidth;

  @override
  _CustomDropdownState createState() => _CustomDropdownState();
}

class _CustomDropdownState extends State<CustomDropdown> {
  String? _selectedValue;
  OverlayEntry? _overlayEntry;
  bool _isItemSelected = false;

  @override
  void initState() {
    super.initState();
    if (widget.items.isNotEmpty) {
      _selectedValue = widget.items.first;
    }
  }

  void _showOverlay() {
    final overlay = Overlay.of(context);
    final renderBox = context.findRenderObject() as RenderBox;
    final size = renderBox.size;
    final offset = renderBox.localToGlobal(Offset.zero);

    _overlayEntry = OverlayEntry(
      builder: (context) => Stack(
        children: [
          Positioned.fill(
            child: GestureDetector(
              behavior: HitTestBehavior.translucent,
              onTap: _hideOverlay,
            ),
          ),
          Positioned(
            left: offset.dx + size.width - widget.dropdownWidth,
            top: offset.dy + size.height,
            width: widget.dropdownWidth,
            child: Material(
              borderRadius: BorderRadius.circular(15),
              elevation: 16,
              child: Container(
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(15),
                ),
                child: ListView(
                  shrinkWrap: true,
                  padding: EdgeInsets.all(8.0),
                  children: widget.items.map((String value) {
                    return Container(
                      margin: EdgeInsets.all(4.0),
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(15),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(0.5),
                            spreadRadius: 1,
                            blurRadius: 2,
                            offset: Offset(0, 1),
                          ),
                        ],
                      ),
                      child: ListTile(
                        dense: true,
                        contentPadding:
                            EdgeInsets.symmetric(horizontal: 16.0),
                        title: Text(
                          value,
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                        onTap: () {
                          setState(() {
                            _selectedValue = value;
                            _isItemSelected = true;
                          });
                          _hideOverlay();
                        },
                      ),
                    );
                  }).toList(),
                ),
              ),
            ),
          ),
        ],
      ),
    );
    overlay.insert(_overlayEntry!);
  }

  void _hideOverlay() {
    _overlayEntry?.remove();
    _overlayEntry = null;
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        if (_overlayEntry != null) {
          _hideOverlay();
        } else {
          _showOverlay();
        }
      },
      child: InputDecorator(
        decoration: InputDecoration(
          // hintText: "Choisir le ${widget.label}",
          // hintStyle: TextStyle(
          //   color: Colors.grey,
          // ),
          floatingLabelBehavior: FloatingLabelBehavior.never,
          prefixIcon: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Image.asset(
              'assets/icons/' + widget.icon,
              width: widget.width,
              height: widget.height,
            ),
          ),
          border: InputBorder.none,
          filled: true,
          fillColor: Colors.transparent,
          contentPadding:
              EdgeInsets.symmetric(vertical: (60 - widget.height) / 2),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              _selectedValue ?? "Choisir le ${widget.label}",
              style: TextStyle(
                color: _isItemSelected ? Colors.black : Colors.grey,
                fontWeight: FontWeight.w500,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Image.asset(
                'assets/icons/down.png',
                width: 35,
                height: 35,
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _hideOverlay();
    super.dispose();
  }
}
