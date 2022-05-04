import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:loyverse_demo/db/db.dart';

part 'item_event.dart';
part 'item_state.dart';

class ItemBloc extends Bloc<ItemEvent, ItemState> {
  ItemBloc() : super(ItemInitial()) {
    on<GetAllItemsEvent>((event, emit) async {
      await getAllItems(event, emit);
    });
    on<CreateItemsEvent>((event, emit) async {
      await createItems(event, emit);
    });
    on<DeleteItemsEvent>((event, emit) async {
      await deleteItems(event, emit);
    });
    on<UpdateItemsEvent>((event, emit) async {
      await updateItems(event, emit);
    });
  }
  AppDatabase db = AppDatabase();
  getAllItems(GetAllItemsEvent event, Emitter<ItemState> emit) async {
    emit(GetAllItemsInitial());
    final response = await db.getAllItem();
    emit(GetAllItemsLoaded(itemList: response));
  }

  createItems(CreateItemsEvent event, Emitter<ItemState> emit) async {
    emit(CreateItemsInitial());
    final response = await db.insertNewItem(event.item);
    emit(CreateItemsLoaded());
  }

  deleteItems(DeleteItemsEvent event, Emitter<ItemState> emit) {}

  updateItems(UpdateItemsEvent event, Emitter<ItemState> emit) {}
}
