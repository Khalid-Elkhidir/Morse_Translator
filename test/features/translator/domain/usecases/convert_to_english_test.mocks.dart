// Mocks generated by Mockito 5.1.0 from annotations
// in translator/test/features/translator/domain/usecases/convert_to_english_test.dart.
// Do not manually edit this file.

import 'dart:async' as _i4;

import 'package:dartz/dartz.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;
import 'package:translator/core/error/failures.dart' as _i5;
import 'package:translator/features/translator/domain/entities/script.dart'
    as _i6;
import 'package:translator/features/translator/domain/repositories/script_repository.dart'
    as _i3;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types

class _FakeEither_0<L, R> extends _i1.Fake implements _i2.Either<L, R> {}

/// A class which mocks [ScriptRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockScriptRepository extends _i1.Mock implements _i3.ScriptRepository {
  MockScriptRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.Script>> convertToEnglish(
          _i6.Script? script) =>
      (super.noSuchMethod(Invocation.method(#convertToEnglish, [script]),
              returnValue: Future<_i2.Either<_i5.Failure, _i6.Script>>.value(
                  _FakeEither_0<_i5.Failure, _i6.Script>()))
          as _i4.Future<_i2.Either<_i5.Failure, _i6.Script>>);
  @override
  _i4.Future<_i2.Either<_i5.Failure, _i6.Script>> convertToMorse(
          _i6.Script? script) =>
      (super.noSuchMethod(Invocation.method(#convertToMorse, [script]),
              returnValue: Future<_i2.Either<_i5.Failure, _i6.Script>>.value(
                  _FakeEither_0<_i5.Failure, _i6.Script>()))
          as _i4.Future<_i2.Either<_i5.Failure, _i6.Script>>);
}
