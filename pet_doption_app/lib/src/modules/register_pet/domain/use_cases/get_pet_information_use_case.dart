import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pet_doption_app/src/modules/register_pet/domain/entities/pet_info_entity.dart';

class GetPetInformationUseCase {
  Query petInfo = FirebaseFirestore.instance
      .collection('pet-informations')
      .orderBy('name')
      .limit(10);

  GetPetInformationUseCase();

  Future<List<PetInfoEntity>> getPets({int page = 1, int limit = 4}) async {
    int skip = (page - 1) * limit;
    List<DocumentSnapshot> documentSnapshots =
        await petInfo.limit(limit).get().then((snapshot) => snapshot.docs);
    List<DocumentSnapshot> paginatedDocuments =
        documentSnapshots.skip(skip).take(limit).toList();

    return paginatedDocuments.map((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      return PetInfoEntity.fromMap(data);
    }).toList();
  }
}
