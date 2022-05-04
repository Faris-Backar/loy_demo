part of 'item_bloc.dart';

abstract class ItemEvent extends Equatable {
  const ItemEvent();

  @override
  List<Object> get props => [];
}

class AddItemEvent extends ItemEvent {
  final Map<String, dynamic> item;
  const AddItemEvent({
    required this.item,
  });

  @override
  List<Object> get props => [item];
  @override
  String toString() => 'AddItemEvent(item: $item)';

  AddItemEvent copyWith({
    Map<String, dynamic>? item,
  }) {
    return AddItemEvent(
      item: item ?? this.item,
    );
  }
}

class GetAllItemEvent extends ItemEvent {}
