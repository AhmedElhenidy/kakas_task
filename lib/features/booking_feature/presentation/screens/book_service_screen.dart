
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:table_calendar/table_calendar.dart';
import '../../../../app/error/failures.dart';
import '../../../../app/services/cache_service.dart';
import '../../../../app/utils/app_colors.dart';
import '../../../../app/utils/app_strings.dart';
import '../../../../app/utils/get_it_injection.dart';
import '../../../../app/utils/hanlders/error_state_handler.dart';
import '../../../../app/utils/helper.dart';
import '../../../../app/widgets/button_widget.dart';
import '../../../../app/widgets/default_app_bar_widget.dart';
import '../../../../app/widgets/loading.dart';
import '../../../../app/widgets/text_widget.dart';
import '../../../auth_feature/presentation/screens/register_screen.dart';
import '../presentation_logic_holder/booking_cubit.dart';
import '../widget/barber_element.dart';
import '../widget/time_widget.dart';

class BookServiceScreen extends StatefulWidget {
  const BookServiceScreen({super.key});

  @override
  State<BookServiceScreen> createState() => _BookServiceScreenState();
}

class _BookServiceScreenState extends State<BookServiceScreen> {
  DateTime? _selectedDate;
  int? _selectedBarberIndex;
  int? _selectedTimeIndex;

  void _onBarberSelected(int index) {
    setState(() {
      _selectedBarberIndex = index;
    });
  }

  void _onTimeSelected(int index) {
    setState(() {
      _selectedTimeIndex = index;
    });
  }

  void _onDaySelected(DateTime day, DateTime focusedDay) {
    print(day);
    setState(() {
      _selectedDate = day;
    });
  }

  @override
  void initState() {
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: DefaultAppBarWidget(
        title: AppStrings.bookService.tr(),
      ),
      body: SingleChildScrollView(
        padding: EdgeInsetsDirectional.symmetric(horizontal: 25.w, vertical: 16),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextWidget(
              title: AppStrings.selectDay.tr(),
              titleFontWeight: FontWeight.w700,
              titleSize: 20.sp,
            ),
            15.verticalSpace,
            TableCalendar(
              locale: context.locale.languageCode,
              rowHeight: 52.h,
              headerStyle: HeaderStyle(
                formatButtonVisible: false,
                titleTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp,
                  fontWeight: FontWeight.w400,
                ),
                leftChevronIcon: const Icon(
                  Icons.arrow_back_ios,
                  color: Colors.white,
                ),
                rightChevronIcon: const Icon(
                  Icons.arrow_forward_ios,
                  color: Colors.white,
                ),
              ),
              calendarStyle: CalendarStyle(
                todayDecoration: const BoxDecoration(
                  color: AppColors.grey414141,
                  shape: BoxShape.circle,
                ),
                selectedDecoration: BoxDecoration(
                  color:
                      _selectedDate == null ? Colors.transparent : Colors.white,
                  shape: BoxShape.circle,
                ),
                selectedTextStyle: TextStyle(
                  color: Colors.black,
                  fontSize: 20.sp,
                ),
                defaultTextStyle: TextStyle(
                  color: Colors.white,
                  fontSize: 20.sp,
                ),
              ),
              rangeSelectionMode: RangeSelectionMode.disabled,
              availableGestures: AvailableGestures.all,
              selectedDayPredicate: (day) => isSameDay(day, _selectedDate),
              focusedDay: _selectedDate ??
                  DateTime.now().toUtc().add(Duration(days: 3)),
              firstDay: DateTime.now().toUtc(),
              lastDay: DateTime.utc(2030, 1, 1),
              onDaySelected: _onDaySelected,
            ),
            20.verticalSpace,
            if (_selectedDate != null) ...[
              TextWidget(
                title: AppStrings.selectBarber.tr(),
                titleFontWeight: FontWeight.w700,
                titleSize: 20.sp,
              ),
              15.verticalSpace,
              SizedBox(
                height: 205.h,
                child: ListView.separated(
                  itemCount: BookingCubit.get().barbers.length,
                  itemBuilder: (context, index) {
                    return InkWell(
                      splashColor: Colors.transparent,
                      focusColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      onTap: () {
                        _onBarberSelected(index);
                      },
                      child: BarberElement(
                        barber: BookingCubit.get().barbers[index],
                          isSelected: _selectedBarberIndex == index),
                    );
                  },
                  scrollDirection: Axis.horizontal,
                  separatorBuilder: (context, index) => 12.horizontalSpace,
                ),
              ),
              if (_selectedBarberIndex != null) ...[
                20.verticalSpace,
                BlocBuilder<BookingCubit, BookingState>(
                  builder: (context, state) {
                    return state is GetBarberTimesLoading
                        ?
                    Loading()
                        :

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextWidget(
                          title: AppStrings.selectTime.tr(),
                          titleFontWeight: FontWeight.w700,
                          titleSize: 20.sp,
                        ),
                        15.verticalSpace,
                        SizedBox(
                          height: 50.h,
                          child: BookingCubit.get().barberTimes.isEmpty
                              ?
                          Center(
                            child: TextWidget(
                              title: "لا توجد مواعيد متاحه",
                              titleFontWeight: FontWeight.w700,
                              titleSize: 20.sp,
                              titleAlign: TextAlign.center,
                            ),
                          )
                              :
                          ListView.separated(
                            itemCount: BookingCubit.get().barberTimes.length,
                            itemBuilder: (context, index) {
                              return InkWell(
                                splashColor: Colors.transparent,
                                focusColor: Colors.transparent,
                                highlightColor: Colors.transparent,
                                onTap: () {
                                  _onTimeSelected(index);
                                },
                                child: TimeWidget(
                                  time: BookingCubit.get().barberTimes[index],
                                  isSelected: _selectedTimeIndex == index,
                                ),
                              );
                            },
                            scrollDirection: Axis.horizontal,
                            separatorBuilder: (context, index) => 15.horizontalSpace,
                          ),
                        ),
                      ],
                    );
                  },
                ),
              ]
            ]
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: AppColors.black,
        height: 85.h,
        child: Row(
          children: [
            19.horizontalSpace,
            TextWidget(
              title: AppStrings.total.tr(),
            ),
            TextWidget(
              title: "${BookingCubit.get().totalValue}",
              titleFontWeight: FontWeight.w700,
            ),
            TextWidget(
              title: AppStrings.egp.tr(),
            ),
            const Spacer(),
            ButtonWidget(
              color: AppColors.white,
              height: 50.h,
              horizontalPadding: 24,
              child: Row(
                children: [
                  TextWidget(
                    title: AppStrings.continueString.tr(),
                    titleColor: AppColors.black,
                  ),
                  const Icon(Icons.arrow_forward),
                ],
              ),
              onPressed: () {
                if (_selectedTimeIndex != null) {
                  if(getIt<CacheService>().getUserToken()==null){
                    navigateTo( RegisterScreen(isFromBookService: true,));
                  }else{
                  }
                }else{
                  errorStateHandler(DataParsingFailure("برجاء اختيار موعد مناسب"));
                }
              },
            ),
            16.horizontalSpace,
          ],
        ),
      ),
    );
  }
}
