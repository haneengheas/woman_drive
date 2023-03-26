import 'package:flutter/material.dart';

import '../../../../shared/styles/colors.dart';
import '../../../../shared/styles/styles.dart';

class InstructionInfoCard extends StatelessWidget {
  const InstructionInfoCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      decoration: BoxDecoration(
          color: AppColors.white,
          border: Border.all(color: AppColors.pink, width: 2),
          borderRadius: BorderRadius.circular(15)),
      child: Column(
        children: [
          Text(
            'يقدم تطبيق قيادة المراءه مجموعة من الشروط و الاحكام التي ترتبط بشكل اساسي بسياسات  الحجز وشروط أستخدام الخدمات',
            style: AppTextStyles.name,
            textDirection: TextDirection.rtl,
          ),
          Text(
            'يجب الموافقه كاملة على كافة السياسات والاحكام ',
            style: AppTextStyles.name,
            textDirection: TextDirection.rtl,
          ),
          Text(
            '١-  يجب على مستخدم التطبيق  إعطاء معلومات صحيحة وقابلة للاستخدام , وليس بها أي تزوير أو يعتبر المستخدم هو المسئول الوحيد عن كافة المعلومات الخاصة بالحجز أو استخدام التطبيق.',
            style: AppTextStyles.name,
            textDirection: TextDirection.rtl,
          ),
          Text(
            '٢- يقوم المستخدم بإعطاء كافة الصلاحيات لاستخدام المستندات أو المعلومات المرافقة أثناء الحجز و التسجيل بالتطبيق , و المُستخدمه في إتمام عملية الحجز.',
            style: AppTextStyles.name,
            textDirection: TextDirection.rtl,
          ),
          Text(
            '٣- في حال قيام المستخدم بإعطاء معلومات مزورة او مغلوطة ، يحق للتطبيق تقديم شكوى رسمية بالمعلومات المزورة واتخاذ الاجراءات القانونية لذلك.',
            style: AppTextStyles.name,
            textDirection: TextDirection.rtl,
          ),
          Text(
            '٤- في حال قيام المستخدم بعمل أي حجز لدى تطبيق قيادة المراءه  ، سيقوم التطبيق بحفظ المعلومات الكافية لإتمام عملية الحجز، والايحتاج العميل لإدخل هذه المعلومات في كل مرة يقوم خلالها بالحجز',
            style: AppTextStyles.name,
            textDirection: TextDirection.rtl,
          ),
          Text(
            '٥- في حال قيام المستخدم بمحاولة تعطيل او الاضرار بتطبيق ، يحق للتطبيق الغاء الحساب الخاص بالمستخدم بشكل كلي ، وتقديم بلاغ رسمي للجهات المختصة ',
            style: AppTextStyles.name,
            textDirection: TextDirection.rtl,
          ),
          Text(
            '٦- في حال كان المستخدم شخص مطلوب او يمثل خطر ، سوف يتم منعه من استخدام التطبيق بشكل كامل وتقديم بلاغ مباشر للجهات المختصه',
            style: AppTextStyles.name,
            textDirection: TextDirection.rtl,
          ),
          Text(
            '٧- في حال غياب  المتدرب عن موعد التدريب  , لا يحق لهُ المطالبة بالمبلغ . ولكن يمكنه تقديم طلب  موعد جديد . ',
            style: AppTextStyles.name,
            textDirection: TextDirection.rtl,
          ),
          Text(
            '٨- في حال عدم تأكيد الحجز يتم الغاء الحجز ويتعين على المستخدم طلب جديد.',
            style: AppTextStyles.name,
            textDirection: TextDirection.rtl,
          ),
          Text(
            '٩-تأكيد حجز التدريب  يتم عن طريق المستخدم نفسه ، من خلال  سداد الرسوم داخل التطبيق ',
            style: AppTextStyles.name,
            textDirection: TextDirection.rtl,
          ),
          Text(
            '١٠ - عند إلغاء حجز التدريب  ،  يجب على المستخدم إلغاء الحجز قبل ٢٤ساعه من موعد الحجز ، واسترداد المبلغ عن طريق التواصل مع اعضاء فريق التطبيق ',
            style: AppTextStyles.name,
            textDirection: TextDirection.rtl,
          ),
          Text(
            '١١- في حال تم الغاء الحجز بعد ٢٤ساعه من الموعد لن يتم استرداد المبلغ.',
            style: AppTextStyles.name,
            textDirection: TextDirection.rtl,
          ),
          Text(
            '١٢- لا يقبل التطبيق تحمل نتيجة أي أخطاء في عملية الدفع التي يقوم بها العميل، كما لا يتحمل التطبيق نتيجة أي عمليات قرصنة أو احتيال تقع على البطاقات الائتمانية أو الحسابات البنكية الخاصة بالعميل.',
            style: AppTextStyles.name,
            textDirection: TextDirection.rtl,
          ),
          Text(
            '١٣ -يجب أن تكون التقييمات صادقة وغير كاذبة وبعبارات ملائمة وأن يبتعد العميل عن الإساءة للمتدربين  أو استخدام العبارات غير اللائقة.',
            style: AppTextStyles.name,
            textDirection: TextDirection.rtl,
          ),
          Text(
            '١٤- لا يجوز لك استخدام حساب شخص آخر في أي وقت من الأوقات فكل شخص يجب أن يكون له حسابه الخاص على التطبيق.',
            style: AppTextStyles.name,
            textDirection: TextDirection.rtl,
          ),
          Text(
            '١٥- تحدث عملية الدفع بين المدرب والادمن عن طريق التحويل البنكي ، باحتساب معدل الدخل خلال الشهر الذي قدمه',
            style: AppTextStyles.name,
            textDirection: TextDirection.rtl,
          ),
        ],
      ),
    );
  }
}
