import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

class AnimatedVisibilityWidget extends HookWidget {
  const AnimatedVisibilityWidget({
    super.key,
    required this.show,
    required this.child,
    this.duration = const Duration(milliseconds: 200),
    this.curve = Curves.easeInOut,
    this.replacment = const SizedBox.shrink(),
  });
  final bool show;
  final Widget child;
  final Duration duration;
  final Curve curve;
  final Widget replacment;

  @override
  Widget build(BuildContext context) {
    final controller = useAnimationController(
      duration: duration,
      initialValue: show ? 1.0 : 0.0,
    );

    final animation = useAnimation(
      CurvedAnimation(
        parent: controller,
        curve: curve,
      ),
    );

    final isVisible = useState(show);

    useEffect(() {
      if (show) {
        isVisible.value = true;
        controller.forward();
      } else {
        controller.reverse().then((_) {
          isVisible.value = false;
        });
      }
      return null;
    }, [show]);

    if (!isVisible.value) {
      return replacment;
    }

    return Opacity(
      opacity: animation,
      child: Transform.scale(
        scale: 0.6 + (animation * 0.4),
        child: child,
      ),
    );
  }
}
