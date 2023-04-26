import 'package:camera/camera.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final newCameraControllerProvider =
    FutureProvider.family<CameraController, CameraDescription>((
  ref,
  camera,
) async {
  // getting lens direction
  CameraController cameraController =
      CameraController(camera, ResolutionPreset.medium);
  final lensDirection = cameraController.description.lensDirection;

  // getting available camera for selecting the new one
  final cameras = await availableCameras();

  // getting new camera
  CameraDescription newCamera;

  if (lensDirection == CameraLensDirection.front) {
    newCamera = cameras.firstWhere(
        (element) => element.lensDirection == CameraLensDirection.back);
  } else {
    newCamera = cameras.firstWhere(
        (element) => element.lensDirection == CameraLensDirection.back);
  }
  cameraController = CameraController(newCamera, ResolutionPreset.medium);
  await cameraController.initialize();
  return cameraController;
});
