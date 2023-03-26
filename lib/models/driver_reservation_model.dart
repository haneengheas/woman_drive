
class DriverReservationModel {
  String? trainerName;
  String? uidTrainer;
  String? accepted;
  String? dateOfDay;
  String? dayDate;
  String? hours;
  int? numHours;
  int? total;
  String ? uidDoc;


  DriverReservationModel({
    this.trainerName,
    this.total,
    this.uidTrainer,
    this.accepted,
    this.dateOfDay,
    this.dayDate,
    this.hours,
    this.numHours,
    this.uidDoc,

  });

  DriverReservationModel.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    trainerName = json['trainerName'];
    uidTrainer = json['uidTrainer'];
    accepted = json['accepted'];
    dateOfDay = json['dateOfDay'];
    dayDate = json['dayDate'];
    hours = json['hours'];
    numHours = json['numHours'];
    uidDoc = json['uidDoc'];

  }

  Map<String, dynamic> toMap() {
    return {
      'total': total,
      'trainerName': trainerName,
      'uidTrainer': uidTrainer,
      'accepted': accepted,
      'dateOfDay': dateOfDay,
      'dayDate': dayDate,
      'hours': hours,
      'numHours': numHours,
      'uidDoc': uidDoc,

    };
  }
}
