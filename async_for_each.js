async function asyncForEach(array, callback) {
	for (let index = 0; index < array.length; index++) {
		await callback(array[index], index, array)
	}
}


// use
await sync_helpers.asyncForEach(log_files, async log_file => {
	try {
		await _sync_a_log(log_file);
	} catch(err){
		return reject();
	}
});