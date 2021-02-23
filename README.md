# CBS Architecture
1. **CBS** ma'nosi - **Clean Beauty Structure Architecture**.
2. Asosiy (Core) package lar [get_it](https://pub.dev/packages/get_it) [bloc](https://pub.dev/packages/bloc) [flutter_bloc](https://pub.dev/packages/flutter_bloc) [hive](https://pub.dev/packages/hive) [hive_flutter](https://pub.dev/packages/hive_flutter) [easy_localization](https://pub.dev/packages/easy_localization)
## Arxitektura tuzilishi
* lib
	* data
		* bloc
			* bloc_name
			* `***`
			* app_bloc.dart
			* `***`
		* config
			* `***`
			* const
				* name_const.dart
			* `***`
		* db
			* `***`
			* models
			* `***`
		* localization
			* locale_keys.g.dart
		* services
			* `***`_service.dart
			* root_service.dart
			* `***`_service.dart
		* utils
			* app_route_util.dart
			* app_logger_util.dart
			* `***`_util.dart
	* ui
		* pages
			* name_page
				* widgets
					* name_widget.dart
				* name_page.dart
		* widgets
			* app_widgets.dart
	* app.dart
	* main.dart
1. Har qanday o'zgarish bo'lsa ya'ni package lar import bo'lsa
	**flutter pub run import_sorter:main**
2. Locales o'zgarsa
	**flutter pub run easy_localization:generate -f keys -o locale_keys.g.dart -O ./lib/data/localization --source-dir ./assets/langs** 
Qolganini yozishga vaqt yetmadi. 😁
