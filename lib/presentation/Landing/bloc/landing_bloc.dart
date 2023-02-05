// ignore: depend_on_referenced_packages
import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:travelapp/data/services/local/storage_service.dart';

part 'landing_event.dart';
part 'landing_state.dart';

class LandingBloc extends Bloc<LandingEvent, LandingState> {
  LandingBloc() : super(const LandingLoadingState());

  void init() {
    controller = TextEditingController();
  }

  @override
  Future<void> close() {
    controller.dispose();
    return super.close();
  }

  late TextEditingController controller;
  final FocusNode textFieldNode = FocusNode();
  final localStorageService = LocalStorageService.instance;
}
