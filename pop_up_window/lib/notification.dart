import 'package:flutter/rendering.dart';
import 'package:flutter/widgets.dart';

class SizeChangedLayoutNotification extends Notification {
  final Size size;

  SizeChangedLayoutNotification(this.size);
}

class SizeChangedLayoutNotifier extends SingleChildRenderObjectWidget {
  const SizeChangedLayoutNotifier({
    Key key,
    Widget child,
  }) : super(key: key, child: child);

  @override
  _RenderSizeChangedWithCallback createRenderObject(BuildContext context) {
    return _RenderSizeChangedWithCallback(
        onLayoutChangedCallback: (Size size) {
          SizeChangedLayoutNotification(size).dispatch(context);
        }
    );
  }
}

class _RenderSizeChangedWithCallback extends RenderProxyBox {
  _RenderSizeChangedWithCallback({
    RenderBox child,
    @required this.onLayoutChangedCallback,
  }) : assert(onLayoutChangedCallback != null),
        super(child);

  final ValueChanged<Size> onLayoutChangedCallback;

  Size _oldSize;

  @override
  void performLayout() {
    super.performLayout();
    if (size != _oldSize)
      onLayoutChangedCallback(size);
    _oldSize = size;
  }
}