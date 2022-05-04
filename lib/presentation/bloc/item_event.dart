part of 'item_bloc.dart';

abstract class ItemEvent extends Equatable {
  const ItemEvent();

  @override
  List<Object> get props => [];
}

class CreateItemsEvent extends ItemEvent {
  final Item item;
  const CreateItemsEvent({
    required this.item,
  });
}

class GetAllItemsEvent extends ItemEvent {}

class UpdateItemsEvent extends ItemEvent {}

class DeleteItemsEvent extends ItemEvent {}
