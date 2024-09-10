import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:pet_doption_app/src/modules/register_pet/domain/entities/pet_info_entity.dart';

class GetPetInformationUseCase {
  CollectionReference petInfo =
      FirebaseFirestore.instance.collection('pet-informations');

  GetPetInformationUseCase();

  Future<List<PetInfoEntity>> getPetInformation() async {
    QuerySnapshot getPetInfo = await petInfo.get();

    return getPetInfo.docs.map((doc) {
      Map<String, dynamic> data = doc.data() as Map<String, dynamic>;
      return PetInfoEntity(
        name: data['name'],
        race: data['race'],
        age: data['age'],
        description: data['description'],
        imageUrl: data['imageUrl'],
        sex: data['sex'],
        weight: data['weight'],
        localization: data['localization'],
      );
    }).toList();
  }
}
