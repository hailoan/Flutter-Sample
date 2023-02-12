import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DownloadButton extends StatelessWidget {
  const DownloadButton({
    super.key,
    required this.status,
    required this.onCancel,
    required this.onOpen,
    required this.onStarting,
    this.progress = 0.0,
    this.transitionDuration = const Duration(
      milliseconds: 500,
    ),
  });

  final DownloadStatus status;

  final Duration transitionDuration;

  final double progress;

  final VoidCallbackAction onCancel;
  final VoidCallbackAction onOpen;
  final VoidCallbackAction onStarting;

  bool get _isDownloading => status == DownloadStatus.downloading;

  bool get _isFetching => status == DownloadStatus.fetching;

  bool get _isDownloaded => status == DownloadStatus.done;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: _onPressed,
      child: Stack(children: [
        ButtonShapeWidget(
            isDownloading: _isDownloading,
            isDownloaded: _isDownloaded,
            isFetching: _isFetching,
            transitionDuration: transitionDuration),
        Positioned.fill(
            child: AnimatedOpacity(
          opacity: _isDownloading || _isFetching ? 1.0 : 0.0,
          duration: transitionDuration,
          child: Stack(
            alignment: Alignment.center,
            children: [
              ProgressIndicatorWidget(
                downloadProgress: progress,
                isDownloading: _isDownloading,
                isFetching: _isFetching,
              ),
              if (_isDownloading)
                const Icon(
                  Icons.stop,
                  size: 14,
                  color: Colors.black,
                )
            ],
          ),
        ))
      ]),
    );
  }

  void _onPressed() {
    switch (status) {
      case DownloadStatus.done:
        // onDownload();
        break;
      case DownloadStatus.fetching:
        // do nothing.
        break;
      case DownloadStatus.downloading:
        // onCancel();
        break;
      case DownloadStatus.none:
        // onOpen();
        break;
    }
  }
}

@immutable
class ProgressIndicatorWidget extends StatelessWidget {
  const ProgressIndicatorWidget({
    super.key,
    required this.downloadProgress,
    required this.isDownloading,
    required this.isFetching,
  });

  final double downloadProgress;
  final bool isDownloading;
  final bool isFetching;

  @override
  Widget build(BuildContext context) {
    return AspectRatio(
      aspectRatio: 1,
      child: TweenAnimationBuilder<double>(
        tween: Tween(begin: 0, end: downloadProgress),
        duration: const Duration(milliseconds: 200),
        builder: (context, progress, child) {
          return CircularProgressIndicator(
            backgroundColor: isDownloading
                ? CupertinoColors.lightBackgroundGray
                : Colors.white.withOpacity(0),
            valueColor: AlwaysStoppedAnimation(isFetching
                ? CupertinoColors.lightBackgroundGray
                : CupertinoColors.activeBlue),
            strokeWidth: 2,
            value: isFetching ? null : progress,
          );
        },
      ),
    );
  }
}

class ButtonShapeWidget extends StatelessWidget {
  const ButtonShapeWidget({
    super.key,
    required this.isDownloading,
    required this.isDownloaded,
    required this.isFetching,
    required this.transitionDuration,
  });

  final bool isDownloading;
  final bool isDownloaded;
  final bool isFetching;
  final Duration transitionDuration;
  @override
  Widget build(BuildContext context) {
    var shape = const ShapeDecoration(
        shape: StadiumBorder(), color: CupertinoColors.lightBackgroundGray);
    if (isDownloading || isFetching) {
      shape = ShapeDecoration(
          shape: const CircleBorder(), color: Colors.white.withOpacity(0.0));
    }
    return AnimatedContainer(
      duration: transitionDuration,
      curve: Curves.ease,
      width: double.infinity,
      decoration: shape,
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: AnimatedOpacity(
            opacity: isDownloading || isFetching ? 0.0 : 1.0,
            duration: transitionDuration,
            curve: Curves.ease,
            child: Text(
              isDownloaded ? 'Open' : 'Get',
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.labelLarge,
            )),
      ),
    );
  }
}

class Download {
  Download(this.name, this.url);

  String? name;
  String? short;
  String? url;
  DownloadStatus status = DownloadStatus.none;
  int progress = 0;
}

enum DownloadStatus { none, fetching, downloading, done }
