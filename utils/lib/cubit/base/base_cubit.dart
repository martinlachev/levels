import 'package:utils/utils.dart';
import 'package:flutter/material.dart';

part 'base_state.dart';

class BaseCubit<S extends BaseState> extends Cubit<S> {
  BaseCubit(super.initialState) {
    onInit();
  }

  OverlayEntry? _loadingOverlay;

  void onInit() async {}

  void setStatus(AsyncStatus status, {String errorMessage = ''}) {
    emit(state.copyWith(status: status) as S);

    if (status == AsyncStatus.error && errorMessage.isNotEmpty) {
      resolve<AppRouter>().scaffoldKey.currentState?.showSnackBar(
        SnackBar(content: Text(errorMessage), backgroundColor: Colors.red),
      );
    }

    if (status == AsyncStatus.globalLoading) {
      WidgetsBinding.instance.addPostFrameCallback((_) {
        _showLoadingOverlay();
      });
    } else {
      _removeLoadingOverlay();
    }
  }

  void _showLoadingOverlay() {
    if (_loadingOverlay != null) return;

    final overlay = Overlay.of(
      resolve<AppRouter>().navigatorKey.currentState!.context,
      rootOverlay: true,
    );
    _loadingOverlay = OverlayEntry(
      builder:
          (context) => const Stack(
            children: [
              ModalBarrier(color: Colors.black54, dismissible: false),
              Center(child: CircularProgressIndicator(color: Colors.white)),
            ],
          ),
    );

    overlay.insert(_loadingOverlay!);
  }

  void _removeLoadingOverlay() {
    if (_loadingOverlay != null) {
      _loadingOverlay?.remove();
      _loadingOverlay = null;
    }
  }

  void setError(String message) {
    setStatus(AsyncStatus.error, errorMessage: message);
  }
}
