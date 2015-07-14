function is_holiday(preset_holidays, date_str) {
    var _is_holiday = preset_holidays.some(function(holiday) {
        if (holiday === date_str) {
            return true;
        }
    });
    return _is_holiday;
}

function is_friday(preset_holidays, the_day_str) {
    var the_day = moment(the_day_str);
    var next_day_str = the_day.clone().add(1, 'days').format("YYYY-MM-DD");
    return (the_day.isoWeekday() === 5 && !is_holiday(preset_holidays, the_day_str)) || is_holiday(preset_holidays, next_day_str);
}
