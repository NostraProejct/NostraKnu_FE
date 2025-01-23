import 'package:flutter/material.dart';

class RoundedImage extends StatelessWidget {
  const RoundedImage({
    super.key,
    this.border,
    this.padding,
    this.onPressed,
    this.width,
    this.height,
    this.applyImageRadius = true,
    required this.imageUrl,
    this.fit = BoxFit.cover,
    this.backgroundColor = Colors.white,
    this.isNetworkImage = false,
    this.borderRadius = 20,
  });

  final double? width, height;
  final String imageUrl;
  final bool applyImageRadius;
  final BoxBorder? border;
  final Color backgroundColor;
  final BoxFit? fit;
  final EdgeInsetsGeometry? padding;
  final bool isNetworkImage;
  final VoidCallback? onPressed;
  final double borderRadius;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        width: MediaQuery.of(context).size.height / 5,
        height: MediaQuery.of(context).size.height,
        decoration: BoxDecoration(
          border: border,
          color: backgroundColor,
          borderRadius: BorderRadius.circular(borderRadius),
          // Add shadow here
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.1), // Shadow color
              offset: Offset(0, 1),
              blurRadius: 3,
              spreadRadius: 2,
            ),
          ],
        ),
        child: ClipRRect(
          borderRadius: applyImageRadius ? BorderRadius.circular(borderRadius) : BorderRadius.zero,
          child: Image(
            fit: fit,
            image: isNetworkImage
                ? NetworkImage(imageUrl)
                : AssetImage(imageUrl) as ImageProvider,
          ),
        ),
      ),
    );
  }
}