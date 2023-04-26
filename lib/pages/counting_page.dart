import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../constants.dart';
import '../models/counttype_enum.dart';
import '../models/exercise_model.dart';
import '../widgets/duration_counter_widget.dart';
import '../widgets/rep_counter_widget.dart';

class CountingPage extends ConsumerStatefulWidget {
  const CountingPage({
    required this.exercise,
    required this.cameras,
    super.key,
  });

  final List<CameraDescription> cameras;
  final Exercise exercise;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _CountingPageState();
}

class _CountingPageState extends ConsumerState<CountingPage> {
  late List<CameraDescription> _cameras;
  late CameraDescription _currentCamera;
  late CameraController _cameraController;
  late Future<void> _initializeControllerFuture;

  @override
  void initState() {
    _cameras = widget.cameras;
    _cameraController = CameraController(_cameras[1], ResolutionPreset.medium);
    _currentCamera = _cameras[1];
    _initializeControllerFuture = _cameraController.initialize();
    super.initState();
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  void _goBack() {
    _cameraController.dispose();
    Navigator.pop(context);
  }

  void _toggleCameraLens() async {
    final lensDirection = _cameraController.description.lensDirection;
    if (lensDirection == CameraLensDirection.front) {
        _currentCamera = _cameras.firstWhere(
            (element) => element.lensDirection == CameraLensDirection.back);
    } else {
        _currentCamera = _cameras.firstWhere(
            (element) => element.lensDirection == CameraLensDirection.front);
    }
    _cameraController =
        CameraController(_currentCamera, ResolutionPreset.medium);
    setState(
      () {
        _initializeControllerFuture = _cameraController.initialize();
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: colors[3],
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
        leading: IconButton(
          icon: Icon(
            Icons.arrow_back_ios,
            color: colors[0],
          ),
          onPressed: _goBack,
        ),
        actions: [
          IconButton(
            onPressed: _toggleCameraLens,
            icon: Icon(
              Icons.switch_camera_rounded,
              color: colors[0],
            ),
          )
        ],
      ),
      body: SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width * 0.8,
              height: MediaQuery.of(context).size.height * 0.6,
              child: ClipRRect(
                borderRadius: BorderRadius.circular(30),
                child: FutureBuilder(
                    future: _initializeControllerFuture,
                    builder: (ctx, snapshot) {
                      if (snapshot.connectionState == ConnectionState.done) {
                        return CameraPreview(_cameraController);
                      } else {
                        return const Center(
                          child: CircularProgressIndicator(),
                        );
                      }
                    }),
              ),
            ),
            widget.exercise.countType == CountType.repetition
                ? const RepCounterWidget(0)
                : const DurationCounterWidget(Duration(seconds: 0)),
          ],
        ),
      ),
    );
  }
}
