import 'dart:io';

String fileReader(String name) => File('test/json/$name').readAsStringSync();