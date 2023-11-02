import 'package:catchmypain/model/exercisedata.dart';
import 'package:catchmypain/provider/exercise_record_provider.dart';
import 'package:catchmypain/view/widgets/exercise_listTile.dart';
import 'package:catchmypain/view/widgets/exercise_listTile_sub.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class ExerciseRecordWidget extends ConsumerStatefulWidget {
  const ExerciseRecordWidget({
    Key? key,
  }) : super(key: key);

  @override
  ConsumerState<ExerciseRecordWidget> createState() =>
      _ExerciseRecordWidgetState();
}

class _ExerciseRecordWidgetState extends ConsumerState<ExerciseRecordWidget> {
  @override
  Widget build(BuildContext context) {
    AsyncValue<List<ExerciseData>> exerciseDataAsyncValue =
        ref.watch(exerciseDataProvider);
    AsyncValue<List<ExerciseData>> stdExerciseDataAsyncValue =
        ref.watch(stdExerciseDataProvider);
    List<bool> isTappedList = ref.watch(isTappedListProvider);

    return exerciseDataAsyncValue.when(
      data: (exerciseDataList) {
        return stdExerciseDataAsyncValue.when(
          data: (stdExerciseDataList) {
            return Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(
                  height: 10,
                ),
                const Text(
                  '푸시업',
                  style: TextStyle(
                    fontSize: 28,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.left,
                ),
                SizedBox(
                  height: MediaQuery.of(context).size.height * 0.725,
                  child: ListView.builder(
                    itemCount: stdExerciseDataList.length,
                    itemBuilder: (context, index) {
                      return Column(
                        children: [
                          Material(
                            elevation: 5,
                            shadowColor: Colors.grey.shade300,
                            child: GestureDetector(
                              onTap: () {
                                setState(() {
                                  isTappedList[index] = !isTappedList[index];
                                });
                              },
                              child: ExerciseListTile(
                                exerciseListTileData:
                                    stdExerciseDataList[index],
                              ),
                            ),
                          ),
                          isTappedList[index]
                              ? ExerciseListTileSub(
                                  exerciseDataList: exerciseDataList,
                                  exerciseListTileSubData:
                                      stdExerciseDataList[index])
                              : const SizedBox()
                        ],
                      );
                    },
                  ),
                )
              ],
            );
          },
          loading: () => const Center(child: CircularProgressIndicator()),
          error: (err, stack) => Text('Error: $err'),
        );
      },
      loading: () => const Center(child: CircularProgressIndicator()),
      error: (err, stack) => Text('Error: $err'),
    );
  }
}
