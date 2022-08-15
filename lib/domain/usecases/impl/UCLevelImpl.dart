/*
 * *
 *  * Created by Kosyachenko Roman aka Roma on 07.08.2022, 22:50
 *  * Copyright (c) 2022 . All rights reserved.
 *  * Last modified 07.08.2022, 22:40
 *
 */



import 'package:dino_solver/data/datasource/network/responseModel/MTaskResult.dart';
import 'package:dino_solver/data/models/MGame.dart';
import 'package:dino_solver/domain/repository/repository.dart';
import 'package:dino_solver/domain/usecases/intf/UCLevel.dart';
import 'package:collection/collection.dart';

class UCLevelImpl extends UCLevel {
  late Repository _repository;

  UCLevelImpl(Repository repository) {
    _repository = repository;
  }

  @override
  Future<MTaskResult<List<MGame>>> getLevels() {
    return _repository.getLevels(_repository.userRepository.getUser());
  }

  @override
  Future<MTaskResult<int>> saveLevels(MGame mGame) async{
    final id = await _repository.saveLevels(mGame);
    final mGameNew = id.body == 0 ? mGame : mGame.copyWith(id: id.body);
    final res = await _repository.firestoreDataSource.insertMGame(mGameNew);
    bool? sync = res.isSuccessfull;
    //sync = false;
    return _repository.updateSyncLevel(mGameNew.copyWith(sync: sync));
  }

  @override
  void syncFireSotre() async{
    final data = await _repository.firestoreDataSource.getGames();
    final cache = await getLevels();
    List<int?> not_sync_cache = [];
    cache.body?.forEach((element) {
      if(element.sync != null && (element.sync ?? false) == true){
        not_sync_cache.add(element.level);
      }
    });

    var need_sync = data.body?.where((element)  {
     final s = !not_sync_cache.contains(element.level);
     print(s);
     return s;
    }).toList();

    print(need_sync);

    if(need_sync != null)
      _repository.insertMGameFromFireStore(need_sync);

  }
}
