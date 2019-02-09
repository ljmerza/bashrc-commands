
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

/**
 * [monthMap description]
 * @type {Object}
 */
export const monthMap = {
	1: 'January',
	2: 'Febuary',
	3: 'March',
	4: 'April',
	5: 'May',
	6: 'June',
	7: 'July',
	8: 'August',
	9: 'Sepember',
	10: 'October',
	11: 'November',
	12: 'December'
}

/**
 * [pluralizedDay description]
 * @param  {[type]} day [description]
 * @return {[type]}     [description]
 */
export function pluralizedDay(day){
	if(day%10 === 1) return 'st';
	else if(day%10 === 2) return 'nd';
	else if(day%10 === 3) return 'rd';
	else return 'th';
 }

/**
 * [formatDisplayDate description]
 * @param  {[type]} hyphenDate [description]
 * @return {[type]}            [description]
 */
 export function formatDisplayDate(hyphenDate){
 	const [year, month, day] = hyphenDate.split('-');

 	const singleMonth  = parseInt(month);
 	const singleDay = parseInt(day);

    const pluralWord = pluralizedDay(day) || '';
    const monthName = monthMap[parseInt(singleMonth)] || '';

    return `${monthName} ${singleDay}${pluralWord}, ${year}`;
 }