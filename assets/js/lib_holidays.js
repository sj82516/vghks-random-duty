function is_holiday(preset_holidays, date_str) {
    var _is_holiday;
    if (is_worker_env()) {  // cannot use jquery in web workers
        _is_holiday = preset_holidays.some(function(holiday) {
            if (holiday === date_str) {
                return true;
            }
        });
    } else {
        _is_holiday = ($.inArray(date_str, preset_holidays) > -1);
    }
    return _is_holiday;
}

function is_weekend(the_day_str) {
    var the_day = moment(the_day_str);
    return (the_day.isoWeekday() === 6 || the_day.isoWeekday() === 7);
}
