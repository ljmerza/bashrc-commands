

export async function asycFilter(arr, callback) {
	return (await Promise.all(arr.map(async item => {
		 return (await callback(item)) ? item : undefined
	}))).filter(i=>i!==undefined)
}