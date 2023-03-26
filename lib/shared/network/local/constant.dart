 import 'package:intl/intl.dart';

String  ? uId = 'start' ;

 todayDate (){
   String? dateOfToday;
   var now = DateTime.now();
   var formatter =
   DateFormat('yyyy-MM-dd');
   dateOfToday =
       formatter.format(now);
   print(dateOfToday);
   return dateOfToday;
 }