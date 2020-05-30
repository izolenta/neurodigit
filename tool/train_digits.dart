import 'dart:io';

import 'package:image/image.dart';
import 'package:perceptron/perceptron.dart';

void main(List args) async {
  final imageData = File('train-images-idx3-ubyte').readAsBytesSync();
  final imageLabels = File('train-labels-idx1-ubyte').readAsBytesSync();
  var imagePositionCounter = 4;
  var labelPositionCounter = 8;
  final total = _readLong(imageData, imagePositionCounter);
  imagePositionCounter += 4;
  final width = _readLong(imageData, imagePositionCounter);
  imagePositionCounter += 4;
  final height = _readLong(imageData, imagePositionCounter);
  imagePositionCounter += 4;
  print('$total, $width x $height');
  final perceptron = Perceptron([width * height ~/ 4, 40, 10], 1);
  final data = <TrainingData>[];
  final watch = Stopwatch();
  for (var i=0; i<total; i++) {
    watch.start();
    final inputBytes = <int>[];
    for (var j=0; j<width * height; j++) {
      inputBytes.add(imageData[imagePositionCounter]);
      inputBytes.add(imageData[imagePositionCounter]);
      inputBytes.add(imageData[imagePositionCounter]);
      imagePositionCounter++;
    }
    final outputs = <double>[];
    for (var j=0; j<10; j++) {
      outputs.add(imageLabels[labelPositionCounter] == j? 1.0 : 0.0);
    }
    labelPositionCounter++;
    final smallWidth = width ~/2;
    final smallHeight = height ~/2;
    final image = Image.fromBytes(width, height, inputBytes, format: Format.rgb);
    final resized = copyResize(image, width: smallWidth, height: smallHeight);
    final inputs = <double>[];
    for (var j=0; j<smallWidth * smallHeight; j++) {
      inputs.add(resized.getPixel(j % smallWidth, j ~/ smallWidth) % 256 > 128? 1 : 0);
    }
    data.add(TrainingData(inputs, outputs));
    _printInput(inputs);
    print('========== ${imageLabels[labelPositionCounter-1]} ==========');
    if (i % 100 == 0) {
      perceptron.train(data);
      final file = File('training.prg').openSync(mode: FileMode.write);
      file.writeStringSync('Trained cases: $i\n');
      file.writeStringSync(perceptron.toJson());
      file.closeSync();
      data.clear();
      watch.stop();
      watch.reset();
      print('handled in ${watch.elapsed.inSeconds} sec');
    }
  }
  perceptron.train(data);
  final file = File('training.prg').openSync(mode: FileMode.write);
  file.writeStringSync('Trained cases: $total\n');
  file.writeStringSync(perceptron.toJson());
  file.writeStringSync('\n');
  file.closeSync();
  print(perceptron.toJson());
}

void _printInput(List<double> inputs) {
  for (var i=0; i<14; i++) {
    var line = '';
    for (var j=0; j<14; j++) {
      line+=inputs[i * 14 + j] == 0? '.' : 'X';
    }
    print('$line');
  }
  print('\n');
}

int _readLong(List<int> data, int counter) {
  return data[counter] * 256 * 256 * 256 + data[counter+1] * 256 * 256 + data[counter+2] * 256 + data[counter+3];
}

