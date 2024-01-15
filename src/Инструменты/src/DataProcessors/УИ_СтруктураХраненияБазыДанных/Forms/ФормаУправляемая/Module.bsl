#Область ОписаниеПеременных

#КонецОбласти

#Область ОбработчикиСобытийФормы

&НаСервере
Процедура ПриСозданииНаСервере(Отказ, СтандартнаяОбработка)

	СпособыПолученияРазмераТаблицБазыДаных = СпособыПолученияРазмераТаблицБазыДаных();

	Элементы.СпособОпределенияРазмераТаблицы.СписокВыбора.Очистить();

	ДоступныеСпособы = ДоступныеСпособыПолученияРазмераБазыДанных(СпособыПолученияРазмераТаблицБазыДаных);

	Для Каждого ТекСпособ Из ДоступныеСпособы Цикл

		Элементы.СпособОпределенияРазмераТаблицы.СписокВыбора.Добавить(ТекСпособ.Имя, ТекСпособ.Представление);
	КонецЦикла;

	СпособОпределенияРазмераТаблиц = СпособыПолученияРазмераТаблицБазыДаных.Нет.Имя;
	ПриИзмененииСпособаОпределенияРазмераТаблицНаСервере();

	ЕдиницыИзмеренияРазмераТаблиц = ЕдиницыИзмеренияРазмераТаблиц();
	Элементы.ЕдиницаИзмеренияРазмераТаблиц.СписокВыбора.Очистить();
	Для Каждого КлючЗначение Из ЕдиницыИзмеренияРазмераТаблиц Цикл
		Элементы.ЕдиницаИзмеренияРазмераТаблиц.СписокВыбора.Добавить(КлючЗначение.Значение);
	КонецЦикла;
	ЕдиницаИзмеренияРазмераТаблиц = ЕдиницыИзмеренияРазмераТаблиц.КБ;
	УстановитьЗаголовкиКолонокРазмераТаблиц();

	АдресСтруктурыБазы = ПоместитьВоВременноеХранилище(Неопределено, УникальныйИдентификатор);
	ЗаполнитьСтруктуруХраненияБазы();
	УИ_ОбщегоНазначения.ФормаИнструментаПриСозданииНаСервере(ЭтотОбъект, Отказ, СтандартнаяОбработка);

КонецПроцедуры

&НаКлиенте
Процедура ПриОткрытии(Отказ)
	Если УИ_ОбщегоНазначенияКлиентСервер.ЭтоWindows() Тогда
		Элементы.ПутьКУтилитеSQLPSQL.ПодсказкаВвода = "psql.exe";
		Элементы.ПутьКУтилитеSQLSQLCMD.ПодсказкаВвода = "sqlcmd.exe";
	Иначе
		Элементы.ПутьКУтилитеSQLPSQL.ПодсказкаВвода = "psql";
		Элементы.ПутьКУтилитеSQLSQLCMD.ПодсказкаВвода = "sqlcmd";
	КонецЕсли;
КонецПроцедуры

&НаСервере
Процедура ПриЗагрузкеДанныхИзНастроекНаСервере(Настройки)
	ПриИзмененииСпособаОпределенияРазмераТаблицНаСервере();
КонецПроцедуры
#КонецОбласти

#Область ОбработчикиСобытийЭлементовШапкиФормы

&НаКлиенте
Процедура ИскатьВИменахПолейПриИзменении(Элемент)
	УстановитьФильтрыНаТаблицуРезультата();
КонецПроцедуры

&НаКлиенте
Процедура ТочноеСоответствиеПриИзменении(Элемент)
	УстановитьФильтрыНаТаблицуРезультата();
КонецПроцедуры

&НаКлиенте
Процедура ОтборПриИзменении(Элемент)
	УстановитьФильтрыНаТаблицуРезультата();
КонецПроцедуры
&НаКлиенте
Процедура СпособОпределенияРазмераТаблицыПриИзменении(Элемент)
	ПриИзмененииСпособаОпределенияРазмераТаблицНаСервере();
КонецПроцедуры

&НаКлиенте
Процедура ЕдиницаИзмеренияРазмераТаблицПриИзменении(Элемент)
	УстановитьЗаголовкиКолонокРазмераТаблиц();
	ВывестиРазмерыТаблицВТаблицуРезультата();
КонецПроцедуры
&НаКлиенте
Процедура ПутьКУтилитеSQLSQLCMDНачалоВыбора(Элемент, ДанныеВыбора, СтандартнаяОбработка)
	ПутьКУтилитеSQLНачалоВыбора(Элемент, ДанныеВыбора, СтандартнаяОбработка);
КонецПроцедуры

&НаКлиенте
Процедура ПутьКУтилитеSQLPSQLНачалоВыбора(Элемент, ДанныеВыбора, СтандартнаяОбработка)
	ПутьКУтилитеSQLНачалоВыбора(Элемент, ДанныеВыбора, СтандартнаяОбработка);
КонецПроцедуры
#КонецОбласти

//#Область ОбработчикиСобытийЭлементовТаблицыФормы //<ИмяТаблицыФормы>
//
//// Код процедур и функций
//
//#КонецОбласти

#Область ОбработчикиКомандФормы
&НаКлиенте
Процедура ОбновитьРазмерТаблицБазыДанных(Команда)
	ЗаполнитьТаблицуРазмеровТаблицБазы();
КонецПроцедуры
&НаКлиенте
Процедура УстановитьОтбор(Команда)

	УстановитьФильтрыНаТаблицуРезультата();

КонецПроцедуры

&НаКлиенте
Процедура Подключаемый_ВыполнитьОбщуюКомандуИнструментов(Команда) Экспорт
	УИ_ОбщегоНазначенияКлиент.Подключаемый_ВыполнитьОбщуюКомандуИнструментов(ЭтотОбъект, Команда);
КонецПроцедуры

#КонецОбласти

#Область СлужебныеПроцедурыИФункции

&НаКлиенте
Процедура ПутьКУтилитеSQLНачалоВыбора(Элемент, ДанныеВыбора, СтандартнаяОбработка)
	СтандартнаяОбработка = Ложь;

	ОписаниеФайла = УИ_ОбщегоНазначенияКлиент.ПустаяСтруктураОписанияВыбираемогоФайла();
	ОписаниеФайла.ИмяФайла = ПутьКУтилитеSQL;

	Если УИ_ОбщегоНазначенияКлиентСервер.ЭтоWindows() Тогда
		УИ_ОбщегоНазначенияКлиент.ДобавитьФорматВОписаниеФайлаСохранения(ОписаниеФайла,
																		 "Исполняемый файл утилиты (*.exe)",
																		 "exe",
																		 "*.exe");
	КонецЕсли;

	УИ_ОбщегоНазначенияКлиент.ПолеФормыИмяФайлаНачалоВыбора(ОписаниеФайла,
															Элемент,
															ДанныеВыбора,
															СтандартнаяОбработка,
															РежимДиалогаВыбораФайла.Открытие,
															Новый ОписаниеОповещения("ПутьКУтилитеSQLНачалоВыбораЗавершение",
		ЭтотОбъект));

КонецПроцедуры

&НаКлиенте
Процедура ПутьКУтилитеSQLНачалоВыбораЗавершение(ВыбранныеФайлы, ДополнительныеПараметры) Экспорт
	Если ВыбранныеФайлы = Неопределено Тогда
		Возврат;
	КонецЕсли;
	Если ВыбранныеФайлы.Количество() = 0 Тогда
		Возврат;
	КонецЕсли;

	ПутьКУтилитеSQL = ВыбранныеФайлы[0];
КонецПроцедуры

&НаСервере
Процедура ВывестиРазмерыТаблицВТаблицуРезультата()

	Делитель = 1;
	Если ЕдиницаИзмеренияРазмераТаблиц = ЕдиницыИзмеренияРазмераТаблиц().МБ Тогда
		Делитель = 1024;
	КонецЕсли;
	Для Каждого СтрокаТаблицы Из Результат Цикл
		СтруктураПоиска = Новый Структура;
		СтруктураПоиска.Вставить("ИмяТаблицы", НРег(СтрокаТаблицы.ИмяТаблицыХранения));

		СтрокаТаблицы.РазмерДанных = 0;
		СтрокаТаблицы.РазмерИндексов =  0;
		СтрокаТаблицы.Зарезервировано = 0;
		СтрокаТаблицы.Свободно = 0;
		СтрокаТаблицы.КоличествоСтрок = 0;

		НайденныеСтроки = РазмерыТаблицБазы.НайтиСтроки(СтруктураПоиска);
		Для Каждого Стр Из НайденныеСтроки Цикл
			СтрокаТаблицы.РазмерДанных = СтрокаТаблицы.РазмерДанных + Стр.РазмерДанных;
			СтрокаТаблицы.РазмерИндексов = СтрокаТаблицы.РазмерИндексов + Стр.РазмерИндексов;
			СтрокаТаблицы.Зарезервировано = СтрокаТаблицы.Зарезервировано + Стр.Зарезервировано;
			СтрокаТаблицы.Свободно = СтрокаТаблицы.Свободно + Стр.Свободно;
			СтрокаТаблицы.КоличествоСтрок = СтрокаТаблицы.КоличествоСтрок + Стр.КоличествоСтрок;
		КонецЦикла;
		Если Делитель <> 1 Тогда
			СтрокаТаблицы.РазмерДанных = СтрокаТаблицы.РазмерДанных / Делитель;
			СтрокаТаблицы.РазмерИндексов = СтрокаТаблицы.РазмерИндексов / Делитель;
			СтрокаТаблицы.Зарезервировано = СтрокаТаблицы.Зарезервировано / Делитель;
			СтрокаТаблицы.Свободно = СтрокаТаблицы.Свободно / Делитель;
		КонецЕсли;
	КонецЦикла;
КонецПроцедуры

&НаКлиенте
Процедура ЗаполнитьТаблицуРазмеровТаблицБазы()
	Если СпособОпределенияРазмераТаблиц = СпособыПолученияРазмераТаблицБазыДаных.Платформа.Имя Тогда
		ЗаполнитьТаблицуРазмеровТаблицБазыДанныхПлатформеннымМетодом();
		ВывестиРазмерыТаблицВТаблицуРезультата();
	ИначеЕсли СпособОпределенияРазмераТаблиц = СпособыПолученияРазмераТаблицБазыДаных.psql.Имя Тогда
		УИ_ОбщегоНазначенияКлиент.ПодключитьРасширениеРаботыСФайламиСВозможнойУстановкой(Новый ОписаниеОповещения("ЗаполнитьТаблицуРазмеровТаблицБазыЧерезКонсольнуюУтилитуПослеПодключенияРасширенияРаботыСФайлами",
			ЭтотОбъект));

	ИначеЕсли СпособОпределенияРазмераТаблиц = СпособыПолученияРазмераТаблицБазыДаных.sqlcmd.Имя Тогда
		УИ_ОбщегоНазначенияКлиент.ПодключитьРасширениеРаботыСФайламиСВозможнойУстановкой(Новый ОписаниеОповещения("ЗаполнитьТаблицуРазмеровТаблицБазыЧерезКонсольнуюУтилитуПослеПодключенияРасширенияРаботыСФайлами",
			ЭтотОбъект));
	ИначеЕсли СпособОпределенияРазмераТаблиц = СпособыПолученияРазмераТаблицБазыДаных.tool1cd.Имя Тогда 
		ЗаполнитьТаблицуРазмеровТаблицБазыДанныхЧерезУтилитуTOOL1CD();
		ВывестиРазмерыТаблицВТаблицуРезультата();
	КонецЕсли;
КонецПроцедуры

&НаСервере
Процедура ЗаполнитьТаблицуРазмеровТаблицБазыДанныхПлатформеннымМетодом()
	РазмерыТаблицБазы.Очистить();
	СтруктураБазы = ПолучитьИзВременногоХранилища(АдресСтруктурыБазы);

	Для Каждого СтрокаСтруктуры Из СтруктураБазы Цикл
		Если НРег(СтрокаСтруктуры.Назначение) <> "основная" Тогда
			Продолжить;
		КонецЕсли;
		Если Не ЗначениеЗаполнено(СтрокаСтруктуры.Метаданные) Тогда
			Продолжить;
		КонецЕсли;

		НоваяСтрока = РазмерыТаблицБазы.Добавить();
		НоваяСтрока.ИмяТаблицы = НРег(СтрокаСтруктуры.ИмяТаблицыХранения);

		МассивИмен = Новый Массив;
		МассивИмен.Добавить(СтрокаСтруктуры.Метаданные);

		Попытка
			//Появилось только в 8.3.15. На старых платформах не будет даже запускаться без такого вызова
			РазмерДанных = УИ_ОбщегоНазначения.ВычислитьВБезопасномРежиме("ПолучитьРазмерДанныхБазыДанных(,Параметры)",
																		  МассивИмен);
		Исключение
			РазмерДанных = 0;
		КонецПопытки;
		НоваяСтрока.РазмерДанных = РазмерДанных / 1024;

	КонецЦикла;
КонецПроцедуры

&НаСервере
Процедура ОбеспечитьНаличиеИсполняемогоФайлаTool1CDНаСервере(КаталогTool1CD, ИсполняемыйФайлTool1CD)
	ФайлИсполняемый = Новый Файл(ИсполняемыйФайлTool1CD);
	Если ФайлИсполняемый.Существует() Тогда
		Возврат;
	КонецЕсли;
	
	ИмяВременногоФайла = ПолучитьИмяВременногоФайла("zip");
	
	ДвоичныеДанныеМакета = ПолучитьОбщийМакет("УИ_ctool1cd");
	ДвоичныеДанныеМакета.Записать(ИмяВременногоФайла);
	
	ЧтениеZIP = Новый ЧтениеZipФайла(ИмяВременногоФайла);
	ЧтениеZIP.ИзвлечьВсе(КаталогTool1CD, РежимВосстановленияПутейФайловZIP.Восстанавливать);
	ЧтениеZIP.Закрыть();
	
	УдалитьФайлы(ИмяВременногоФайла);
КонецПроцедуры

&НаСервереБезКонтекста
Функция ИмяФайлаБазыДанныхИзСтрокиСоединения()
	СтрокаСоединения = СтрокаСоединенияИнформационнойБазы();
	ЧастиСтрокиСоединения = СтрРазделить(СтрокаСоединения, ";");

	КаталогБазыДанных = "";

	Для Каждого ТекЧасть Из ЧастиСтрокиСоединения Цикл
		Если Не ЗначениеЗаполнено(ТекЧасть) Тогда
			Продолжить;
		КонецЕсли;
		
		КлючЗначение = СтрРазделить(ТекЧасть, "=");
		Если КлючЗначение.Количество() <> 2 Тогда
			Продолжить;
		КонецЕсли;
		
		Если НРег(КлючЗначение[0])="file" Тогда
			КаталогБазыДанных = Сред(КлючЗначение[1],2);
			КаталогБазыДанных = Лев(КаталогБазыДанных, СтрДлина(КаталогБазыДанных)-1);
			Прервать;
		КонецЕсли;
	КонецЦикла;
	Если Не ЗначениеЗаполнено(КаталогБазыДанных) Тогда
		Возврат "";
	КонецЕсли;
	
	Возврат УИ_ОбщегоНазначенияКлиентСервер.ОбъединитьПути(КаталогБазыДанных, "1Cv8.1CD");
КонецФункции

&НаСервере
Процедура ЗаполнитьТаблицуРазмеровТаблицБазыДанныхЧерезУтилитуTOOL1CD()
	РазмерыТаблицБазы.Очистить();
	
	КаталогTool1CD = УИ_ОбщегоНазначения.КаталогФайловTool1CDНаСервере();

	Если УИ_ОбщегоНазначенияКлиентСервер.ЭтоWindows() Тогда
		ИсполняемыйФайлTool1CD = УИ_ОбщегоНазначенияКлиентСервер.ОбъединитьПути(КаталогTool1CD,
																				"windows",
																				"ctool1cd.exe");
	Иначе
		ИсполняемыйФайлTool1CD = УИ_ОбщегоНазначенияКлиентСервер.ОбъединитьПути(КаталогTool1CD, "linux", "ctool1cd");
	КонецЕсли;
	ОбеспечитьНаличиеИсполняемогоФайлаTool1CDНаСервере(КаталогTool1CD, ИсполняемыйФайлTool1CD);
	
	ИмяФайлаРезультата = ПолучитьИмяВременногоФайла("csv");
	ИмяФайлаЛогов = ПолучитьИмяВременногоФайла("txt");
	ИмяФайлаБазыДанных = ИмяФайлаБазыДанныхИзСтрокиСоединения();

	СтрокаЗапуска = СтрШаблон("""%1"" -ne -sts ""%2"" -q ""%3"" -l ""%4""",
							  ИсполняемыйФайлTool1CD,
							  ИмяФайлаРезультата,
							  ИмяФайлаБазыДанных,
							  ИмяФайлаЛогов);

	КодВозврата = Неопределено;
	ЗапуститьПриложение(СтрокаЗапуска, , Истина, КодВозврата);

	Если КодВозврата <> 0 Тогда
		ТекстовыйДокументРезультата = Новый ТекстовыйДокумент();
		ТекстовыйДокументРезультата.Прочитать(ИмяФайлаЛогов, КодировкаТекста.UTF8);
	Иначе
		ТекстовыйДокументРезультата = Новый ТекстовыйДокумент();
		ТекстовыйДокументРезультата.Прочитать(ИмяФайлаРезультата, КодировкаТекста.UTF8);
	КонецЕсли;

	УдалитьФайлы(ИмяФайлаРезультата);
	УдалитьФайлы(ИмяФайлаЛогов);

	Если КодВозврата <> 0 Тогда
		УИ_ОбщегоНазначенияКлиентСервер.СообщитьПользователю(ТекстовыйДокументРезультата.ПолучитьТекст());
		Возврат;
	КонецЕсли;

	Если ТекстовыйДокументРезультата.КоличествоСтрок() <=1 Тогда
		Возврат;
	КонецЕсли;
	
	ИменаКолонок = СтрРазделить(ТекстовыйДокументРезультата.ПолучитьСтроку(1), "|");
	
	Для НомерСтроки = 2 По ТекстовыйДокументРезультата.КоличествоСтрок() Цикл
		ТекущаяСтрока = ТекстовыйДокументРезультата.ПолучитьСтроку(НомерСтроки);
		Если Не ЗначениеЗаполнено(ТекущаяСтрока) Тогда
			Продолжить;
		КонецЕсли;
		
		МассивСтроки = СтрРазделить(ТекущаяСтрока, "|");
		
		ДанныеСтроки = Новый Структура;
		Для ном = 0 По ИменаКолонок.Количество()-1 Цикл
			ДанныеСтроки.Вставить(ИменаКолонок[ном], МассивСтроки[ном]);
		КонецЦикла;

		НоваяСтрока = РазмерыТаблицБазы.Добавить();
		НоваяСтрока.ИмяТаблицы = НРег(ДанныеСтроки.table_name);
		НоваяСтрока.КоличествоСтрок = Макс(УИ_СтроковыеФункцииКлиентСервер.СтрокаВЧисло(ДанныеСтроки.records_count), 0);
		НоваяСтрока.РазмерДанных = УИ_СтроковыеФункцииКлиентСервер.СтрокаВЧисло(ДанныеСтроки.data_size)
								   / 1024
								   + УИ_СтроковыеФункцииКлиентСервер.СтрокаВЧисло(ДанныеСтроки.blob_size)
									 / 1024;
		НоваяСтрока.РазмерИндексов = УИ_СтроковыеФункцииКлиентСервер.СтрокаВЧисло(ДанныеСтроки.index_size) / 1024;
		НоваяСтрока.Зарезервировано = НоваяСтрока.РазмерДанных + НоваяСтрока.РазмерИндексов;
		НоваяСтрока.Свободно = 0;
	КонецЦикла;
	
КонецПроцедуры



&НаКлиенте
Процедура ЗаполнитьТаблицуРазмеровТаблицБазыЧерезКонсольнуюУтилитуПослеПодключенияРасширенияРаботыСФайлами(Подключено, ДополнительныеПараметры) Экспорт
	Если Не Подключено Тогда
		Возврат;
	КонецЕсли;
	ФайловыеПеременные = УИ_ОбщегоНазначенияКлиент.СтруктураФайловыхПеременныхСеанса();
	ИмяКаталогаДляЗапроса = УИ_ОбщегоНазначенияКлиентСервер.ОбъединитьПути(ФайловыеПеременные.КаталогВременныхФайлов,
																		   УИ_ОбщегоНазначенияКлиентСервер.СлучайноеИмяФайла());
	
	ДополнительныеПараметрыОповещения = Новый Структура;
	ДополнительныеПараметрыОповещения.Вставить("ИмяКаталогаДляЗапроса", ИмяКаталогаДляЗапроса);
	Если УИ_ОбщегоНазначенияКлиентСервер.ЭтоWindows() Тогда
		ДополнительныеПараметрыОповещения.Вставить("КодировкаВспомогательныхФайлов", "windows-1251");
	Иначе
		ДополнительныеПараметрыОповещения.Вставить("КодировкаВспомогательныхФайлов", "utf-8");
	КонецЕсли;

	УИ_ОбщегоНазначенияКлиент.НачатьОбеспечениеКаталога(ИмяКаталогаДляЗапроса,
														Новый ОписаниеОповещения("ЗаполнитьТаблицуРазмеровТаблицБазыЧерезКонсольнуюУтилитуПослеОбеспеченияКаталога",
		ЭтотОбъект, ДополнительныеПараметрыОповещения));
КонецПроцедуры

&НаКлиенте
Процедура ЗаполнитьТаблицуРазмеровТаблицБазыЧерезКонсольнуюУтилитуПослеОбеспеченияКаталога(Успешно, ДополнительныеПараметры) Экспорт
	Если Не Успешно Тогда
		Возврат;
	КонецЕсли;
	
	Если СпособОпределенияРазмераТаблиц = СпособыПолученияРазмераТаблицБазыДаных.psql.Имя Тогда
		ТекстЗапроса =
		"SELECT
		|tablename AS table_name,
		|pg_class.reltuples as records_count,
		|pg_total_relation_size(schemaname||'.'||tablename) / 1024 AS total_usage_kb,
		|pg_table_size(schemaname||'.'||tablename) / 1024 AS table_usage_kb,
		|pg_indexes_size(schemaname||'.'||tablename) / 1024 as index_usage_kb,
		|0 as table_free_kb
		|FROM pg_catalog.pg_tables, pg_catalog.pg_class
		|where pg_tables.tablename = pg_class.relname  
		|and schemaname = 'public';
		|";
		
		ЕстьВозможнотьПолучитьФайлЛоговЗапроса = Истина;
	Иначе
		ТекстЗапроса =
		"CREATE TABLE #t(table_name varchar(255), records_count varchar(255), total_usage_kb varchar(255), table_usage_kb varchar(255), index_usage_kb varchar(255), table_free_kb varchar(255));
		|INSERT INTO #t
		|exec sp_msforeachtable N'exec sp_spaceused ''?''';
		|SELECT * FROM #t;
		|DROP TABLE #t
		|";

		ЕстьВозможнотьПолучитьФайлЛоговЗапроса = Ложь;
	КонецЕсли;

	ДополнительныеПараметры.Вставить("ИмяФайлаЗапроса",
									 УИ_ОбщегоНазначенияКлиентСервер.ОбъединитьПути(ДополнительныеПараметры.ИмяКаталогаДляЗапроса,
																					УИ_ОбщегоНазначенияКлиентСервер.СлучайноеИмяФайла("sql",
																																	  "req")));
	ДополнительныеПараметры.Вставить("ИмяФайлаРезультата",
									 УИ_ОбщегоНазначенияКлиентСервер.ОбъединитьПути(ДополнительныеПараметры.ИмяКаталогаДляЗапроса,
																					УИ_ОбщегоНазначенияКлиентСервер.СлучайноеИмяФайла("csv",
																																	  "res")));
	Если ЕстьВозможнотьПолучитьФайлЛоговЗапроса Тогда
		ДополнительныеПараметры.Вставить("ИмяФайлаЛога",
										 УИ_ОбщегоНазначенияКлиентСервер.ОбъединитьПути(ДополнительныеПараметры.ИмяКаталогаДляЗапроса,
																						УИ_ОбщегоНазначенияКлиентСервер.СлучайноеИмяФайла("txt",
																																		  "log")));
	КонецЕсли;
	
	Текст = Новый ТекстовыйДокумент;
	Текст.УстановитьТекст(ТекстЗапроса);
	Текст.НачатьЗапись(Новый ОписаниеОповещения("ЗаполнитьТаблицуРазмеровТаблицБазыЧерезКонсольнуюУтилитуПослеЗаписиФайлаЗапроса",
		ЭтотОбъект, ДополнительныеПараметры),
					   ДополнительныеПараметры.ИмяФайлаЗапроса,
					   ДополнительныеПараметры.КодировкаВспомогательныхФайлов);

КонецПроцедуры

&НаКлиенте
Функция СтрокаЗапускаPsql(ДопПараметры)
	Если Не ЗначениеЗаполнено(ПутьКУтилитеSQL) Тогда
		ИмяЗапускаемогоФайла = "psql";
	Иначе
		ИмяЗапускаемогоФайла = ПутьКУтилитеSQL;
	КонецЕсли;

	Возврат СтрШаблон("""%1"" --host=%2 --dbname=%3 --username=%4 --csv --file=""%5"" --output=""%6"" --log-file=""%7""",
									ИмяЗапускаемогоФайла,
									СерверSQL,
									БазаДанныхSQL,
									ПользовательSQL,
									ДопПараметры.ИмяФайлаЗапроса,
									ДопПараметры.ИмяФайлаРезультата,
									ДопПараметры.ИмяФайлаЛога);
КонецФункции

&НаКлиенте
Функция СтрокаЗапускаSqlcmd(ДопПараметры)
	Если Не ЗначениеЗаполнено(ПутьКУтилитеSQL) Тогда
		ИмяЗапускаемогоФайла = "sqlcmd";
	Иначе
		ИмяЗапускаемогоФайла = ПутьКУтилитеSQL;
	КонецЕсли;

	Возврат СтрШаблон("""%1"" -S %2 -U %3 -P%4  -d %5 -C -i""%6"" -o ""%7"" -u -I -s ""|"" -W -b",
					  ИмяЗапускаемогоФайла,
					  СерверSQL,
					  ПользовательSQL,
					  ПарольSQL,
					  БазаДанныхSQL,
					  ДопПараметры.ИмяФайлаЗапроса,
					  ДопПараметры.ИмяФайлаРезультата);

КонецФункции

&НаКлиенте
Процедура ЗаполнитьТаблицуРазмеровТаблицБазыЧерезКонсольнуюУтилитуПослеЗаписиФайлаЗапроса(Результат, ДополнительныеПараметры) Экспорт
	Если Результат <> Истина Тогда
		УИ_ОбщегоНазначенияКлиентСервер.СообщитьПользователю("Не удалось записать файл с текстом запроса");
		Возврат;
	КонецЕсли;

	ЗапускатьЧерезСкрипт = Ложь;
	Если СпособОпределенияРазмераТаблиц = СпособыПолученияРазмераТаблицБазыДаных.psql.Имя Тогда
		Если УИ_ОбщегоНазначенияКлиентСервер.ЭтоWindows() Тогда
			ЗапускатьЧерезСкрипт = Истина;
			ТекстСкриптаЗапуска = СтрШаблон("chcp 65001
											|set PGPASSWORD=%1
											|%2", ПарольSQL, СтрокаЗапускаPsql(ДополнительныеПараметры));
		Иначе
			ТекстСкриптаЗапуска = СтрШаблон("echo ""%1"" | %2", ПарольSQL, СтрокаЗапускаPsql(ДополнительныеПараметры));
		КонецЕсли;
	ИначеЕсли СпособОпределенияРазмераТаблиц = СпособыПолученияРазмераТаблицБазыДаных.sqlcmd.Имя Тогда
		ТекстСкриптаЗапуска = СтрокаЗапускаSqlcmd(ДополнительныеПараметры);
	КонецЕсли;

	Если ЗапускатьЧерезСкрипт Тогда
		ДополнительныеПараметры.Вставить("ЗапускаемыйСкрипт",
										 УИ_ОбщегоНазначенияКлиентСервер.ОбъединитьПути(ДополнительныеПараметры.ИмяКаталогаДляЗапроса,
																						УИ_ОбщегоНазначенияКлиентСервер.СлучайноеИмяФайла("bat",
																																		  "run")));
		
		ТекстСкриптаДляЗаписи = Новый ТекстовыйДокумент;
		ТекстСкриптаДляЗаписи.УстановитьТекст(ТекстСкриптаЗапуска);
		ТекстСкриптаДляЗаписи.НачатьЗапись(Новый ОписаниеОповещения("ЗаполнитьТаблицуРазмеровТаблицБазыЧерезКонсольнуюУтилитуПослеСохраненияСкриптаЗапуска",
			ЭтотОбъект, ДополнительныеПараметры),
										   ДополнительныеПараметры.ЗапускаемыйСкрипт,
										   ДополнительныеПараметры.КодировкаВспомогательныхФайлов);
	Иначе
	
		ДополнительныеПараметры.Вставить("ЗапускаемыйСкрипт", ТекстСкриптаЗапуска);
		ЗаполнитьТаблицуРазмеровТаблицБазыЧерезКонсольнуюУтилитуПослеСохраненияСкриптаЗапуска(Истина,
																							  ДополнительныеПараметры);
	КонецЕсли;
	

КонецПроцедуры

&НаКлиенте
Процедура ЗаполнитьТаблицуРазмеровТаблицБазыЧерезКонсольнуюУтилитуПослеСохраненияСкриптаЗапуска(Результат, ДополнительныеПараметры) Экспорт
	Если Результат <> Истина Тогда
		ВозвраТ;
	КонецЕсли;
	НачатьЗапускПриложения(Новый ОписаниеОповещения("ЗаполнитьТаблицуРазмеровТаблицБазыЧерезКонсольнуюУтилитуПослеВыполненияКоманды",
		ЭтотОбъект, ДополнительныеПараметры), ДополнительныеПараметры.ЗапускаемыйСкрипт, , Истина);
	
КонецПроцедуры

&НаКлиенте
Процедура ЗаполнитьТаблицуРазмеровТаблицБазыЧерезКонсольнуюУтилитуПослеВыполненияКоманды(КодВозврата, ДополнительныеПараметры) Экспорт
	ТекстРезультата = Новый ТекстовыйДокумент();
	
	ДополнительныеПараметры.Вставить("КодВозврата", КодВозврата);
	ДополнительныеПараметры.Вставить("ТекстовыйДокументРезультата", ТекстРезультата);
	
	ИмяФайлаЧтения =  ДополнительныеПараметры.ИмяФайлаРезультата;
	Если КодВозврата <> 0 И ДополнительныеПараметры.Свойство("ИмяФайлаЛога") Тогда
		ИмяФайлаЧтения = ДополнительныеПараметры.ИмяФайлаЛога;
	КонецЕсли;

	ТекстРезультата.НачатьЧтение(Новый ОписаниеОповещения("ЗаполнитьТаблицуРазмеровТаблицБазыЧерезКонсольнуюУтилитуПослеЧтенияРезультатаВыполнения",
		ЭтотОбъект, ДополнительныеПараметры), ИмяФайлаЧтения);

КонецПроцедуры

&НаКлиенте
Процедура ЗаполнитьТаблицуРазмеровТаблицБазыЧерезКонсольнуюУтилитуПослеЧтенияРезультатаВыполнения(ДополнительныеПараметры) Экспорт

	Если ДополнительныеПараметры.КодВозврата <> 0 Тогда
		УИ_ОбщегоНазначенияКлиентСервер.СообщитьПользователю(ДополнительныеПараметры.ТекстовыйДокументРезультата.ПолучитьТекст());
		РазмерыТаблицБазы.Очистить();
	ИначеЕсли СпособОпределенияРазмераТаблиц = СпособыПолученияРазмераТаблицБазыДаных.psql.Имя Тогда
		ЗаполнитьТаблицуРазмеровТаблицБазыДанныхИзСтокиРезультатаPSQL(ДополнительныеПараметры.ТекстовыйДокументРезультата);
	ИначеЕсли СпособОпределенияРазмераТаблиц = СпособыПолученияРазмераТаблицБазыДаных.sqlcmd.Имя Тогда
		ЗаполнитьТаблицуРазмеровТаблицБазыДанныхИзСтокиРезультатаSQLCMD(ДополнительныеПараметры.ТекстовыйДокументРезультата);
	КонецЕсли;
		
	ВывестиРазмерыТаблицВТаблицуРезультата();
	
	НачатьУдалениеФайлов(Новый ОписаниеОповещения(), ДополнительныеПараметры.ИмяКаталогаДляЗапроса);

КонецПроцедуры

// Заполнить таблицу размеров таблиц базы данных из стоки результата PSQL.
// 
// Параметры:
//  ТекстовыйДокументРезультата -ТекстовыйДокумент-Текстовый документ результата
&НаКлиенте
Процедура ЗаполнитьТаблицуРазмеровТаблицБазыДанныхИзСтокиРезультатаPSQL(ТекстовыйДокументРезультата)
	РазмерыТаблицБазы.Очистить();
	
	Если ТекстовыйДокументРезультата.КоличествоСтрок() <=1 Тогда
		Возврат;
	КонецЕсли;
	
	ИменаКолонок = СтрРазделить(ТекстовыйДокументРезультата.ПолучитьСтроку(1), ",");
	
	Для НомерСтроки = 2 По ТекстовыйДокументРезультата.КоличествоСтрок() Цикл
		ТекущаяСтрока = ТекстовыйДокументРезультата.ПолучитьСтроку(НомерСтроки);
		Если Не ЗначениеЗаполнено(ТекущаяСтрока) Тогда
			Продолжить;
		КонецЕсли;
		
		МассивСтроки = СтрРазделить(ТекущаяСтрока, ",");
		
		ДанныеСтроки = Новый Структура;
		Для ном = 0 По ИменаКолонок.Количество()-1 Цикл
			ДанныеСтроки.Вставить(ИменаКолонок[ном], МассивСтроки[ном]);
		КонецЦикла;

		НоваяСтрока = РазмерыТаблицБазы.Добавить();
		НоваяСтрока.ИмяТаблицы = НРег(ДанныеСтроки.table_name);
		НоваяСтрока.КоличествоСтрок = Макс(УИ_СтроковыеФункцииКлиентСервер.СтрокаВЧисло(ДанныеСтроки.records_count), 0);
		НоваяСтрока.РазмерДанных = УИ_СтроковыеФункцииКлиентСервер.СтрокаВЧисло(ДанныеСтроки.table_usage_kb);
		НоваяСтрока.РазмерИндексов = УИ_СтроковыеФункцииКлиентСервер.СтрокаВЧисло(ДанныеСтроки.index_usage_kb);
		НоваяСтрока.Зарезервировано = УИ_СтроковыеФункцииКлиентСервер.СтрокаВЧисло(ДанныеСтроки.total_usage_kb);
		НоваяСтрока.Свободно = УИ_СтроковыеФункцииКлиентСервер.СтрокаВЧисло(ДанныеСтроки.table_free_kb);
	КонецЦикла;
КонецПроцедуры

// Заполнить таблицу размеров таблиц базы данных из стоки результата PSQL.
// 
// Параметры:
//  ТекстовыйДокументРезультата -ТекстовыйДокумент-Текстовый документ результата
&НаКлиенте
Процедура ЗаполнитьТаблицуРазмеровТаблицБазыДанныхИзСтокиРезультатаSQLCMD(ТекстовыйДокументРезультата)
	РазмерыТаблицБазы.Очистить();
	
	Если ТекстовыйДокументРезультата.КоличествоСтрок() <=1 Тогда
		Возврат;
	КонецЕсли;
	
	НомерСтрокиНачалаТаблицы = 0;
	Для НомерСтроки = 1 По ТекстовыйДокументРезультата.КоличествоСтрок() Цикл
		ТекущаяСтрока = ТекстовыйДокументРезультата.ПолучитьСтроку(НомерСтроки);
			
		ИменаКолонок = СтрРазделить(ТекущаяСтрока, "|");
		Если ИменаКолонок.Количество() > 1 Тогда
			НомерСтрокиНачалаТаблицы = НомерСтроки;
			Прервать;
		КонецЕсли;
	КонецЦикла;
	
	Если Не ЗначениеЗаполнено(НомерСтрокиНачалаТаблицы) Тогда
		ВозвраТ;
	КонецЕсли;
	
	Для НомерСтроки = НомерСтрокиНачалаТаблицы+2 По ТекстовыйДокументРезультата.КоличествоСтрок() Цикл
		ТекущаяСтрока = ТекстовыйДокументРезультата.ПолучитьСтроку(НомерСтроки);
		Если Не ЗначениеЗаполнено(ТекущаяСтрока) Тогда
			Прервать;
		КонецЕсли;
		
		МассивСтроки = СтрРазделить(ТекущаяСтрока, "|");
		
		ДанныеСтроки = Новый Структура;
		Для ном = 0 По ИменаКолонок.Количество()-1 Цикл
			ЗначениеКолонки = СтрЗаменить(МассивСтроки[ном],"KB","");
			ЗначениеКолонки = СтрЗаменить(ЗначениеКолонки, " ", "");
			
			ДанныеСтроки.Вставить(ИменаКолонок[ном], ЗначениеКолонки);
		КонецЦикла;

		НоваяСтрока = РазмерыТаблицБазы.Добавить();
		НоваяСтрока.ИмяТаблицы = НРег(ДанныеСтроки.table_name);
		НоваяСтрока.КоличествоСтрок = Макс(УИ_СтроковыеФункцииКлиентСервер.СтрокаВЧисло(ДанныеСтроки.records_count), 0);
		НоваяСтрока.РазмерДанных = УИ_СтроковыеФункцииКлиентСервер.СтрокаВЧисло(ДанныеСтроки.table_usage_kb);
		НоваяСтрока.РазмерИндексов = УИ_СтроковыеФункцииКлиентСервер.СтрокаВЧисло(ДанныеСтроки.index_usage_kb);
		НоваяСтрока.Зарезервировано = УИ_СтроковыеФункцииКлиентСервер.СтрокаВЧисло(ДанныеСтроки.total_usage_kb);
		НоваяСтрока.Свободно = УИ_СтроковыеФункцииКлиентСервер.СтрокаВЧисло(ДанныеСтроки.table_free_kb);
	КонецЦикла;
КонецПроцедуры

&НаСервере
Процедура ЗаполнитьСтруктуруХраненияБазы()

	СтруктураБазы = ПолучитьИзВременногоХранилища(АдресСтруктурыБазы);

	Если СтруктураБазы = Неопределено Тогда

		СтруктураБазы = ПолучитьСтруктуруХраненияБазыДанных(,Истина);
		ПоместитьВоВременноеХранилище(СтруктураБазы, АдресСтруктурыБазы);

	КонецЕсли;

	ЗаполнитьТаблицуРезультата(СтруктураБазы);
КонецПроцедуры

&НаСервере
Процедура ЗаполнитьТаблицуРезультата(СтруктураБазы, НайденныеСтроки = Неопределено)
	Результат.Очистить();

	Если НайденныеСтроки = Неопределено Тогда
		СтрокиДляРезультата=СтруктураБазы;
	Иначе
		СтрокиДляРезультата=НайденныеСтроки;
	КонецЕсли;

	ВыводитьРазмеры = СпособОпределенияРазмераТаблиц <> СпособыПолученияРазмераТаблицБазыДаных.Нет.Имя;

	Для Каждого Строка Из СтрокиДляРезультата Цикл
		НоваяСтрока = Результат.Добавить();
		НоваяСтрока.ИмяТаблицы = Строка.ИмяТаблицы;
		Если Не ЗначениеЗаполнено(НоваяСтрока.ИмяТаблицы) Тогда
			НоваяСтрока.ИмяТаблицы = Строка.Метаданные;
		КонецЕсли;
		НоваяСтрока.Метаданные = Строка.Метаданные;
		НоваяСтрока.Назначение = Строка.Назначение;
		НоваяСтрока.ИмяТаблицыХранения = Строка.ИмяТаблицыХранения;
		НоваяСтрока.Найдено = Истина;

		Для Каждого Поле Из Строка.Поля Цикл
			НоваяСтрокаПолей = НоваяСтрока.Поля.Добавить();
			НоваяСтрокаПолей.ИмяПоляХранения = Поле.ИмяПоляХранения;
			НоваяСтрокаПолей.ИмяПоля = Поле.ИмяПоля;
			НоваяСтрокаПолей.Метаданные = Поле.Метаданные;
		КонецЦикла;

		Для Каждого Индекс Из Строка.Индексы Цикл
			НоваяСтрокаИндексов = НоваяСтрока.Индексы.Добавить();
			НоваяСтрокаИндексов.ИмяИндексаХранения = Индекс.ИмяИндексаХранения;

			// Поля индекса
			Для Каждого Поле Из Индекс.Поля Цикл
				НоваяСтрокаПолейИндекса = НоваяСтрокаИндексов.ПоляИндекса.Добавить();
				НоваяСтрокаПолейИндекса.ИмяПоляХранения = Поле.ИмяПоляХранения;
				НоваяСтрокаПолейИндекса.ИмяПоля = Поле.ИмяПоля;
				НоваяСтрокаПолейИндекса.Метаданные = Поле.Метаданные;
			КонецЦикла;

		КонецЦикла;
	КонецЦикла;

	Если ВыводитьРазмеры Тогда
		ВывестиРазмерыТаблицВТаблицуРезультата();
	КонецЕсли;
	Результат.Сортировать("Метаданные ВОЗР,ИмяТаблицы ВОЗР");
КонецПроцедуры

&НаСервере
Процедура УстановитьФильтрыНаТаблицуРезультата()
	ИмяДляПоиска = ВРЕГ(СокрЛП(Отбор));
	
	Если Не ЗначениеЗаполнено(ИмяДляПоиска) Тогда
		Элементы.Результат.ОтборСтрок = Неопределено;
		Возврат;
	КонецЕсли;
	
	Если Не ТочноеСоответствие И Лев(ИмяДляПоиска, 1) = "_" Тогда
		ИмяДляПоиска = Сред(ИмяДляПоиска, 2);
	КонецЕсли;
	
	Для Каждого СтрокаРезультата Из Результат Цикл
		СтрокаРезультата.Найдено = Ложь;
		
		Если ИскатьВИменахПолей Тогда
			Для Каждого СтрокаПоле Из СтрокаРезультата.Поля Цикл
				Если ТочноеСоответствие Тогда
					Если ВРЕГ(СтрокаПоле.ИмяПоляХранения) = ИмяДляПоиска Или ВРЕГ(СтрокаПоле.ИмяПоля) = ИмяДляПоиска Тогда
						СтрокаРезультата.Найдено = Истина;
					КонецЕсли;
				Иначе

					Если СтрНайти(ВРЕГ(СтрокаПоле.ИмяПоляХранения), ИмяДляПоиска) > 0
						 Или СтрНайти(ВРЕГ(СтрокаПоле.ИмяПоля), ИмяДляПоиска) Тогда
						СтрокаРезультата.Найдено = Истина;
					КонецЕсли;
				КонецЕсли;
			КонецЦикла;
		КонецЕсли;

		Если ТочноеСоответствие Тогда
			Если ВРЕГ(СтрокаРезультата.ИмяТаблицыХранения) = ИмяДляПоиска
				 Или ВРЕГ(СтрокаРезультата.ИмяТаблицы) = ИмяДляПоиска
				 Или ВРЕГ(СтрокаРезультата.Метаданные) = ИмяДляПоиска
				 Или ВРЕГ(СтрокаРезультата.Назначение) = ИмяДляПоиска Тогда
				СтрокаРезультата.Найдено = Истина;
			КонецЕсли;
		Иначе
			Если СтрНайти(ВРЕГ(СтрокаРезультата.ИмяТаблицыХранения), ИмяДляПоиска) > 0
				 Или СтрНайти(ВРЕГ(СтрокаРезультата.ИмяТаблицы), ИмяДляПоиска)
				 Или СтрНайти(ВРЕГ(СтрокаРезультата.Метаданные), ИмяДляПоиска)
				 Или СтрНайти(ВРЕГ(СтрокаРезультата.Назначение), ИмяДляПоиска) Тогда
				СтрокаРезультата.Найдено = Истина;
			КонецЕсли;
		КонецЕсли;
	КонецЦикла;

	СтрукутураПоиска = Новый Структура;
	СтрукутураПоиска.Вставить("Найдено", Истина);
	Элементы.Результат.ОтборСтрок = Новый ФиксированнаяСтруктура(СтрукутураПоиска);

КонецПроцедуры

// Способы получения размера таблиц базы даных.
// 
// Возвращаемое значение:
//  Структура - Способы получения размера таблиц базы даных:
// * Нет - Структура - :
// ** Имя - Строка - 
// ** Представление - Строка - 
// * Платформа - Структура - :
// ** Имя - Строка - 
// ** Представление - Строка - 
// * psql - Структура - :
// ** Имя - Строка - 
// ** Представление - Строка - 
// * sqlcmd - Структура - :
// ** Имя - Строка - 
// ** Представление - Строка - 
// * tool1cd - Структура - :
// ** Имя - Строка - 
// ** Представление - Строка - 
&НаСервереБезКонтекста
Функция СпособыПолученияРазмераТаблицБазыДаных()
	Способы = Новый Структура;
	Способы.Вставить("Нет", НовыйСпособПолученияРазмераТаблицБазы("Нет", "Не получать размеры таблиц"));
	Способы.Вставить("Платформа", НовыйСпособПолученияРазмераТаблицБазы("Платформа",
																		"Платформенный метод ""ПолучитьРазмерДанныхБазыДанных"""));
	
	Способы.Вставить("tool1cd", НовыйСпособПолученияРазмераТаблицБазы("tool1cd", "Утилита ""tool1cd"". Для файловых баз"));

	Способы.Вставить("psql", НовыйСпособПолученияРазмераТаблицБазы("psql", "Утилита ""psql"". PostgreSQL"));
	Способы.Вставить("sqlcmd", НовыйСпособПолученияРазмераТаблицБазы("sqlcmd", "Утилита ""sqlcmd"". MSSQL"));

	Возврат Способы;
КонецФункции

// Доступные способы получения размера базы данных.
// 
// Параметры:
//  СпособыПолученияРазмераТаблицБазыДаных- см. СпособыПолученияРазмераТаблицБазыДаных
// 
// Возвращаемое значение:
// Массив из см. НовыйСпособПолученияРазмераТаблицБазы 
&НаСервереБезКонтекста
Функция ДоступныеСпособыПолученияРазмераБазыДанных(СпособыПолученияРазмераТаблицБазыДаных)
	Способы = Новый Массив; //Массив из см. НовыйСпособПолученияРазмераТаблицБазы
	Способы.Добавить(СпособыПолученияРазмераТаблицБазыДаных.Нет);
	Если УИ_ОбщегоНазначенияКлиентСервер.ВерсияПлатформыНеМладше("8.3.15") Тогда
		Способы.Добавить(СпособыПолученияРазмераТаблицБазыДаных.Платформа);
	КонецЕсли;
	Если УИ_ОбщегоНазначения.ИнформационнаяБазаФайловая()
		 И Не (УИ_ОбщегоНазначенияКлиентСервер.ЭтоLinux() И Не УИ_ОбщегоНазначенияКлиентСервер.ЭтоРазрядностьХ64())
		 И Не УИ_ОбщегоНазначенияКлиентСервер.ЭтоMacOs() Тогда
		Способы.Добавить(СпособыПолученияРазмераТаблицБазыДаных.tool1cd);
	КонецЕсли;

//	Если Не УИ_ОбщегоНазначения.ИнформационнаяБазаФайловая() Тогда
	Способы.Добавить(СпособыПолученияРазмераТаблицБазыДаных.psql);
	Способы.Добавить(СпособыПолученияРазмераТаблицБазыДаных.sqlcmd);
//	КонецЕсли;


	Возврат Способы;
КонецФункции

&НаСервереБезКонтекста
Функция НовыйСпособПолученияРазмераТаблицБазы(Имя, Представление)
	Способ = Новый Структура;
	Способ.Вставить("Имя", Имя);
	Способ.Вставить("Представление", Представление);

	Возврат Способ;
КонецФункции

&НаСервереБезКонтекста
Функция ЕдиницыИзмеренияРазмераТаблиц()
	Единицы = Новый Структура;
	Единицы.Вставить("КБ", "КБ");
	Единицы.Вставить("МБ", "МБ");

	Возврат Единицы;
КонецФункции

&НаСервере
Процедура ПриИзмененииСпособаОпределенияРазмераТаблицНаСервере()
	РазмерыТаблицБазы.Очистить();

	ЭтоПлатформенныйМетод = СпособОпределенияРазмераТаблиц = СпособыПолученияРазмераТаблицБазыДаных.Платформа.Имя;
	ПолучатьРазмерыТаблиц = СпособОпределенияРазмераТаблиц <> СпособыПолученияРазмераТаблицБазыДаных.Нет.Имя;

	Элементы.РезультатГруппаРазмерыТаблиц.Видимость = ПолучатьРазмерыТаблиц;
	Элементы.РезультатКоличествоСтрок.Видимость = ПолучатьРазмерыТаблиц И Не ЭтоПлатформенныйМетод;
	Элементы.РезультатРазмерИндексов.Видимость = ПолучатьРазмерыТаблиц И Не ЭтоПлатформенныйМетод;
	Элементы.РезультатЗарезервировано.Видимость = ПолучатьРазмерыТаблиц И Не ЭтоПлатформенныйМетод;
	Элементы.РезультатСвободно.Видимость = ПолучатьРазмерыТаблиц И Не ЭтоПлатформенныйМетод;

	Элементы.ГруппаСтраницыНастройкиПолученияРазмеровТаблиц.ТекущаяСтраница = Элементы["ГруппаСтраницаНастройкиПолученияРазмеров"
																					   + СпособОпределенияРазмераТаблиц];

	Элементы.ГруппаРазмерыТаблиц.ЗаголовокСвернутогоОтображения = "Размеры таблиц базы данных: "
																  + СпособыПолученияРазмераТаблицБазыДаных[СпособОпределенияРазмераТаблиц].Представление;
КонецПроцедуры
&НаСервере
Процедура УстановитьЗаголовкиКолонокРазмераТаблиц()
	Элементы.РезультатРазмерДанных.Заголовок = "Данные (" + ЕдиницаИзмеренияРазмераТаблиц + ")";
	Элементы.РезультатРазмерИндексов.Заголовок = "Индексы (" + ЕдиницаИзмеренияРазмераТаблиц + ")";
	Элементы.РезультатЗарезервировано.Заголовок = "Зарезервировано всего (" + ЕдиницаИзмеренияРазмераТаблиц + ")";
	Элементы.РезультатСвободно.Заголовок = "Свободно (" + ЕдиницаИзмеренияРазмераТаблиц + ")";
КонецПроцедуры
#КонецОбласти