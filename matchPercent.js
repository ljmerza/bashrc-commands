/**
 * gets the object with the highest match percentage on a property using
 * a base comparitor string. If less than 50% match returns false else
 * returns highest percentage matched object
 * @param {Array<Object>} dataToMatch - the array of data to find the highest percentage object
 * @param {string} dataProp the name of the property of each object to compare the base string with 
 * @param {string} baseComparitor the string to compare each object to
 */
export function extractMatch(dataToMatch, dataProp, baseComparitor){
	
	const movieResults = dataToMatch.map(movie => {
		movie.similarity = similarity(movie[dataProp], baseComparitor);
		return movie;
	});

	const matched = movieResults.reduce((l, e) => e.similarity > l.similarity ? e : l);	

	// if not at least 50% match then discard
	if(matched.similarity < 0.5){
		return false;
	}

	return matched;
}

/**
 * return the percentage match of two strings using Levenshtein distance
 * https://en.wikipedia.org/wiki/Levenshtein_distance
 * @param {string} s1
 * @param {string} s2
 * @returns {Number} 0-1 percent match of two strings
 */
function similarity(s1, s2) {
	let longer = s1;
	let shorter = s2;
	if (s1.length < s2.length) {
		longer = s2;
		shorter = s1;
	}
	let longerLength = longer.length;
	if (longerLength == 0) {
		return 1.0;
	}
	return (longerLength - editDistance(longer, shorter)) / parseFloat(longerLength);
}

/**
 *
 */
function editDistance(s1, s2) {
	s1 = s1.toLowerCase();
	s2 = s2.toLowerCase();

	let costs = new Array();
	for (let i = 0; i <= s1.length; i++) {
		let lastValue = i;
		for (let j = 0; j <= s2.length; j++) {
			if (i == 0) costs[j] = j;
			else {
				if (j > 0) {
					let newValue = costs[j - 1];
					if (s1.charAt(i - 1) != s2.charAt(j - 1)){
						newValue = Math.min(Math.min(newValue, lastValue), costs[j]) + 1;
					}
					costs[j - 1] = lastValue;
					lastValue = newValue;
				}
			}
		}
		if (i > 0) costs[s2.length] = lastValue;
	}
	return costs[s2.length];
}