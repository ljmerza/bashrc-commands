/**
 * takes an array and breaks it up into an array of arrays
 * @param {object} files
 * @param {number} split_length
 */
function chunk_files(files, split_length=8){

	const chunk_length = parseInt(files.length / split_length);

	// if we have less then chunk_size then just use one chunk else
	// split up all files to upload multiple files at once
	let file_chunks;
	if(chunk_length == 0){
		file_chunks = [files];
	} else {
		file_chunks = chunk(files, chunk_length);
	}

	// for keeping track of when we've processed all chunks
	const number_of_chunks = file_chunks.length;

	return [file_chunks, number_of_chunks, 0]
}


/**
 * splits an array up into chunks
 * @param {integer} length
 * @return {Array<Array<any>>} an array of array chunks
 */
function chunk(arr, n) {
	return Array(Math.ceil(arr.length/n))
		.fill()
		.map((_,i) => arr.slice(i*n,i*n+n));
}


// use
const files = [1,2,3,4,5,6,7,8,9];
chunk_files(files, 3);