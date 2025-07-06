import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:skkoapp/features/auth/handlers/auth_handler.dart';
import 'package:go_router/go_router.dart';
class LineLoginButton extends StatelessWidget {
  final VoidCallback onPressed;
  const LineLoginButton({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return IntrinsicWidth(
      child: ElevatedButton.icon(
         onPressed: () => openLineLogin(),

        icon: FaIcon(FontAwesomeIcons.line, size: 20, color: Colors.white),
        label: Text(
          "Login wiht Line",
          style: TextStyle(color: Colors.white, fontSize: 20),
        ),
        style: ElevatedButton.styleFrom(
          backgroundColor: Color(0xFF00C300), // สี LINE
          padding: EdgeInsets.symmetric(horizontal: 8, vertical: 4),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(6)),
          tapTargetSize: MaterialTapTargetSize.shrinkWrap, // ลด hit area
          visualDensity: VisualDensity.compact, // ลดขนาดเพิ่มเติม
        ),
      ),
    );
  }
}


