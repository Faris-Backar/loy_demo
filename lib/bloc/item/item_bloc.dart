import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:loyverse_demo/db/models/item.dart';
part 'item_event.dart';
part 'item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  List<Map<String, dynamic>> itemList = [];

  ItemBloc() : super(ItemInitial()) {
    on<ItemEvent>((event, emit) async {
      if (event is AddItemEvent) {
        await addItemIntoDB(event, emit);
      }
      if (event is GetAllItemEvent) {
        await getItemsFromDB(event, emit);
      }
    });
  }
  addItemIntoDB(AddItemEvent event, Emitter<ItemState> emit) async {}

  getItemsFromDB(GetAllItemEvent event, Emitter<ItemState> emit) async {}
}
