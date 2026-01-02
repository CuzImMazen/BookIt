// import 'package:flutter/material.dart';

// class DropDownButtonRow extends StatelessWidget {
//   const DropDownButtonRow({
//     super.key,
//     required this.items,
//     required this.text,
//     this.currentValue,
//     required this.onChanged,
//     required this.hintText,
//   });

//   final String text;
//   final List<String> items;
//   final String? currentValue;
//   final void Function(String?)? onChanged;
//   final String? hintText;

//   @override
//   Widget build(BuildContext context) {
//     return Row(
//       children: [
//         Text(
//           text,
//           style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
//         ),
//         const Spacer(),
//         DropdownButton<String>(
//           menuMaxHeight: 500,
//           hint: Center(child: Text(hintText!)),
//           value: items.contains(currentValue) ? currentValue : null,

//           onChanged: onChanged,
//           items: items
//               .map((item) => DropdownMenuItem(value: item, child: Text(item)))
//               .toList(),
//         ),
//       ],
//     );
//   }
// }

import 'package:book_it/core/extensions/localization_extension.dart';
import 'package:flutter/material.dart';

class DropDownButtonRow extends StatelessWidget {
  const DropDownButtonRow({
    super.key,
    required this.items,
    required this.text,
    this.currentValue,
    required this.onChanged,
    this.hintText,
    this.governorate,
    this.isCity = false,
  });

  final String text;
  final List<String> items;
  final String? currentValue;
  final void Function(String?)? onChanged;
  final String? hintText;
  final String? governorate;
  final bool isCity;

  @override
  Widget build(BuildContext context) {
    String localizedValue(String value) {
      if (!isCity) {
        final govMap = {
          "All": context.home.all,
          "Damascus": context.home.damascus,
          "Rural Damascus": context.home.ruralDamascus,
          "Aleppo": context.home.aleppo,
          "Idlib": context.home.idlib,
          "Homs": context.home.homs,
          "Hama": context.home.hama,
          "Latakia": context.home.latakia,
          "Tartus": context.home.tartus,
          "Sweidah": context.home.sweidah,
          "Dara'a": context.home.daraa,
          "Hassakeh": context.home.hassakeh,
          "Deir Alzoor": context.home.deirAlzoor,
          "Alraqqa": context.home.alraqqa,
          "AlQuneitra": context.home.alQuneitra,
        };
        return govMap[value] ?? value;
      } else {
        // Cities
        if (governorate == null) return value;
        final key = "${governorate}_${value.replaceAll(' ', '')}";

        final cityMap = {
          // Damascus
          "Damascus_Al-Qadam": context.home.damascus_alQadam,
          "Damascus_Mazzeh": context.home.damascus_mazzeh,
          "Damascus_Al-Salihiyah": context.home.damascus_alSalihiyah,
          "Damascus_Baramkeh": context.home.damascus_baramkeh,
          "Damascus_Al-Zahra": context.home.damascus_alZahra,
          // Rural Damascus
          "Rural Damascus_Douma": context.home.ruralDamascus_douma,
          "Rural Damascus_Harasta": context.home.ruralDamascus_harasta,
          "Rural Damascus_Saidnaya": context.home.ruralDamascus_saidnaya,
          "Rural Damascus_Zabadani": context.home.ruralDamascus_zabadani,
          "Rural Damascus_Al-Tall": context.home.ruralDamascus_alTall,
          // Aleppo
          "Aleppo_Azaz": context.home.aleppo_azaz,
          "Aleppo_Al-Bab": context.home.aleppo_alBab,
          "Aleppo_Manbij": context.home.aleppo_manbij,
          "Aleppo_Jarabulus": context.home.aleppo_jarabulus,
          "Aleppo_Al-Sukkari": context.home.aleppo_alSukkari,
          // Idlib
          "Idlib_Maarat al-Numan": context.home.idlib_maaratAlNuman,
          "Idlib_Jisr al-Shughur": context.home.idlib_jisrAlShughur,
          "Idlib_Ariha": context.home.idlib_ariha,
          "Idlib_Saraqib": context.home.idlib_saraqib,
          // Homs
          "Homs_Al-Rastan": context.home.homs_alRastan,
          "Homs_Al-Qusayr": context.home.homs_alQusayr,
          "Homs_Talbiseh": context.home.homs_talbiseh,
          "Homs_Tadmur": context.home.homs_tadmur,
          // Hama
          "Hama_Masyaf": context.home.hama_masyaf,
          "Hama_Salamiyah": context.home.hama_salamiyah,
          "Hama_Mahardah": context.home.hama_mahardah,
          "Hama_Suran": context.home.hama_suran,
          // Latakia
          "Latakia_Jableh": context.home.latakia_jableh,
          "Latakia_Qardaha": context.home.latakia_qardaha,
          "Latakia_Al-Haffah": context.home.latakia_alHaffah,
          "Latakia_Rabia": context.home.latakia_rabia,
          // Tartus
          "Tartus_Baniyas": context.home.tartus_baniyas,
          "Tartus_Safita": context.home.tartus_safita,
          "Tartus_Al-ShaykhBadr": context.home.tartus_alShaykhBadr,
          "Tartus_Duraykish": context.home.tartus_duraykish,
          // Sweidah
          "Sweidah_Shahba": context.home.sweidah_shahba,
          "Sweidah_SahwatAlKhudr": context.home.sweidah_sahwatAlKhudr,
          "Sweidah_Shaqqa": context.home.sweidah_shaqqa,
          "Sweidah_Rweished": context.home.sweidah_rweished,
          // Dara'a
          "Dara'a_Da'el": context.home.daraa_dael,
          "Dara'a_Nawa": context.home.daraa_nawa,
          "Dara'a_Izraa": context.home.daraa_izraa,
          "Dara'a_Al-Shajara": context.home.daraa_alShajara,
          // Hassakeh
          "Hassakeh_Qamishli": context.home.hassakeh_qamishli,
          "Hassakeh_Amuda": context.home.hassakeh_amuda,
          "Hassakeh_Al-Malikiyah": context.home.hassakeh_alMalikiyah,
          "Hassakeh_RasAlAyn": context.home.hassakeh_rasAlAyn,
          // Deir Alzoor
          "Deir Alzoor_Al-Mayadin": context.home.deirAlzoor_alMayadin,
          "Deir Alzoor_Al-Busayrah": context.home.deirAlzoor_alBusayrah,
          "Deir Alzoor_Al-Shuhayl": context.home.deirAlzoor_alShuhayl,
          "Deir Alzoor_Al-Kasrah": context.home.deirAlzoor_alKasrah,
          // Alraqqa
          "Alraqqa_Al-Thawrah": context.home.alraqqa_alThawrah,
          "Alraqqa_Al-Mansurah": context.home.alraqqa_alMansurah,
          "Alraqqa_Al-Resafa": context.home.alraqqa_alResafa,
          "Alraqqa_Al-Hurriya": context.home.alraqqa_alHurriya,
          // AlQuneitra
          "AlQuneitra_Fiq": context.home.alQuneitra_fiq,
          "AlQuneitra_Buqata": context.home.alQuneitra_buqata,
          "AlQuneitra_KafrShams": context.home.alQuneitra_kafrShams,
        };

        return cityMap[key] ?? value;
      }
    }

    return Row(
      children: [
        Text(
          text,
          style: const TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const Spacer(),
        DropdownButton<String>(
          value: currentValue != null && items.contains(currentValue)
              ? currentValue
              : null,
          hint: Text(hintText ?? ''),
          onChanged: onChanged,
          items: items.map((item) {
            return DropdownMenuItem(
              value: item,
              child: Text(localizedValue(item)),
            );
          }).toList(),
          selectedItemBuilder: (context) {
            return items.map((item) {
              return Align(
                alignment: Alignment.centerLeft,
                child: Text(
                  localizedValue(item),
                  style: const TextStyle(fontSize: 16),
                ),
              );
            }).toList();
          },
        ),
      ],
    );
  }
}
