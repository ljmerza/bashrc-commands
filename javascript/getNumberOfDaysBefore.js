
export function getDateFormat(dateTime){
	let month = dateTime.getMonth() + 1;
	let day = dateTime.getDate();
	const year = dateTime.getFullYear();

	if(month <= 9) month = `0${month}`; 
	if(day <= 9) day = `0${day}`; 

	return `${year}-${month}-${day}`;
}
/**
 * [getNumberOfDaysBefore description]
 * @param  {[type]} days [description]
 * @return {[type]}      [description]
 */
export function getNumberOfDaysBefore(days){
	const epochDate = (new Date()).getTime();
	let dayBeforeEpoch = _subtractDays(epochDate, days);

	return getDateFormat(new Date(dayBeforeEpoch));
}

/**
 * [_subtractDays description]
 * @param  {[type]} epoch        [description]
 * @param  {[type]} numberOfDays [description]
 * @return {[type]}              [description]
 */
function _subtractDays(epoch, numberOfDays){
	for(let i=0; i<numberOfDays; i++){
		epoch = epoch - 60*60*24*1000;
	}

	return epoch;
}