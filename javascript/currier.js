function currier(fn) {
	const args = [...args].slice(1);
	return function(){
		return fn.apply(this, [...args, ...arguments])
	}
}