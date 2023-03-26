
class TrainerReservationModel {
  String? driverName;
  String? uidDriver;
  String? accepted;
  String? dateOfDay;
  String? dayDate;
  String? hours;
  int? numHours;
  int? total;
  String ? uidDoc;
  double ? rate;


  TrainerReservationModel({
    this.driverName,
    this.total,
    this.uidDriver,
    this.accepted,
    this.dateOfDay,
    this.dayDate,
    this.hours,
    this.numHours,
    this.uidDoc,
    this.rate,

  });

  TrainerReservationModel.fromJson(Map<String, dynamic> json) {
    total = json['total'];
    driverName = json['driverName'];
    uidDriver = json['uidDriver'];
    accepted = json['accepted'];
    dateOfDay = json['dateOfDay'];
    dayDate = json['dayDate'];
    hours = json['hours'];
    numHours = json['numHours'];
    uidDoc = json['uidDoc'];
    rate = json['rate'];

  }

  Map<String, dynamic> toMap() {
    return {
      'total': total,
      'driverName': driverName,
      'uidDriver': uidDriver,
      'accepted': accepted,
      'dateOfDay': dateOfDay,
      'dayDate': dayDate,
      'hours': hours,
      'numHours': numHours,
      'uidDoc': uidDoc,
      'rate': rate,

    };
  }
}
