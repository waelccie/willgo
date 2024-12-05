import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

class FoodDescriptionCard extends StatefulWidget {
  final String description;
  final Map<String, String> nutritionalInfo;

  const FoodDescriptionCard({
    super.key,
    required this.description,
    required this.nutritionalInfo,
  });

  @override
  State<FoodDescriptionCard> createState() => _FoodDescriptionCardState();
}

class _FoodDescriptionCardState extends State<FoodDescriptionCard> {
  bool _isExpanded = false;

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Description Text with See More
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                widget.description,
                style: GoogleFonts.dmSans(
                  fontWeight: FontWeight.w300,
                  fontSize: 15.sp,
                  height: 1.5,
                  color: const Color(0xFF878787),
                ),
                maxLines: _isExpanded ? null : 3,
                overflow: _isExpanded ? null : TextOverflow.ellipsis,
              ),
              // See More Button
              if (!_isExpanded)
                Align(
                  alignment: Alignment.centerRight,
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        _isExpanded = true;
                      });
                    },
                    child: Padding(
                      padding: const EdgeInsets.only(top: 4.0),
                      child: Text(
                        'See more',
                        style: GoogleFonts.dmSans(
                          decoration: TextDecoration.underline,
                          fontWeight: FontWeight.w500,
                          fontSize: 15.25.sp,
                          color: const Color(0xFF878787),
                        ),
                      ),
                    ),
                  ),
                ),
            ],
          ),

          // Nutritional Information
          if (_isExpanded) ...[
            const SizedBox(height: 16),
            Text(
              'Nutritional Information',
              style: TextStyle(
                fontWeight: FontWeight.w300,
                fontSize: 15.25.sp,
                color: const Color(0xFF878787),
              ),
            ),
            const SizedBox(height: 8),
            Wrap(
              spacing: 32,
              runSpacing: 8,
              children: widget.nutritionalInfo.entries.map((entry) {
                return SizedBox(
                  width: 120,
                  child: Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Text(
                        '${entry.key} : ',
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 15.25.sp,
                          color: const Color(0xFF878787),
                        ),
                      ),
                      Text(
                        entry.value,
                        style: TextStyle(
                          fontWeight: FontWeight.w300,
                          fontSize: 15.25.sp,
                          color: const Color(0xFF878787),
                        ),
                      ),
                    ],
                  ),
                );
              }).toList(),
            ),
          ],
        ],
      ),
    );
  }
}
