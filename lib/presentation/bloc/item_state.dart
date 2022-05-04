part of 'item_bloc.dart';

abstract class ItemState extends Equatable {
  const ItemState();

  @override
  List<Object> get props => [];
}

class ItemInitial extends ItemState {}

class GetAllItemsInitial extends ItemState {}

class GetAllItemsLoaded extends ItemState {
  final List<Item> itemList;
  const GetAllItemsLoaded({required this.itemList});
}

class GetAllItemsFailure extends ItemState {}

class UpdateItemsInitial extends ItemState {}

class UpdateItemsLoaded extends ItemState {}

class UpdateItemsFailure extends ItemState {}

class DeleteItemsInitial extends ItemState {}

class DeleteItemsLoaded extends ItemState {}

class DeleteItemsFailure extends ItemState {}

class CreateItemsInitial extends ItemState {}

class CreateItemsLoaded extends ItemState {}

class CreateItemsFailure extends ItemState {}
