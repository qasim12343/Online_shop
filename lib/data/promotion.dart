class Promotion{
  String imagePath;
  String? title;
  String? subtitle;
  String? tag;
  String? caption;

  Promotion({
    this.title,
    this.caption,
    required this.imagePath,
    this.subtitle,
    this.tag,
  });
}