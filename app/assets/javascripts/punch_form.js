/**
 @param {Integer} dayOfWeek Offset from Sunday that should be calculated. Ex: '5' for Friday.
*/
function setDay(date, dayOfWeek) {
	date = new Date(date.getTime ());
	date.setDate(date.getDate() + (dayOfWeek + 7 - date.getDay()) % 7);
	return date;
}

/**
 PunchFormHelper
 encapsulates current date and time
*/

function PunchFormHelper() {
	function padLessThanTen(number) {
		if (number < 10) { number = '0' + number; }
		return number;
	}

	// Calculate current date and time
	var _date = new Date();
	var _day = padLessThanTen(_date.getDate());
	var _month = padLessThanTen(_date.getMonth() + 1);
	var _year = _date.getFullYear();
	var _hour = _date.getHours();
	var _minute = _date.getMinutes();

	// End date (for now) is the closest Friday
	var _endDate = setDay(new Date(_date.getFullYear(), _date.getMonth(), _date.getDate()), 5);
	var _endDay = padLessThanTen(_endDate.getDate());
	var _endMonth = padLessThanTen(_endDate.getMonth() + 1);
	var _endYear = _endDate.getFullYear();

	this.currentDate = _year + '-' + _month + '-' + _day;
	this.currentTime = _hour + ':' + _minute;
	this.finalDate = _endYear + '-' + _endMonth + '-' + _endDay;
}

var ready;
ready = function() {
	var helper = new PunchFormHelper();
	$('#punch_current_date').val(helper.currentDate);
	$('#punch_week_end_date').val(helper.finalDate);
	$('#punch_start_time').val(helper.currentTime);
};

$(document).ready(ready);
$(document).on('page:load', ready)
