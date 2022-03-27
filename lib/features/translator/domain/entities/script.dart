import 'package:equatable/equatable.dart';

class Script extends Equatable{
  final String text;

  const Script({required this.text});

  @override
  List<Object?> get props => [text];
}