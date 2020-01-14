import 'dart:ui';

extension SizeTransposing on Size {
  Size transpose() => Size(this.height, this.width);
  Size orient() => this.aspectRatio > 1 ? this.transpose() : this;
}
