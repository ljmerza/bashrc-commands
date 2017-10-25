

function debounce(fn, time) {
	let timeoutId;
	return function() {
		const args = [fn, time].concat(Array.prototype.slice.call((arguments));
		clearTimeout(timeoutId);
		timeoutId = window.setTimeout.apply(window, args);
	}
}


// after 1000ms has passed without the last debounce call then call sendRequest function
// returns a debounce function
let debouncedRequest = debounce(sendRequest, 1000);

// listen for key changes
searchBox.addEventListener('keyup', function(event) {
	debouncedRequest(event.target.value);
});


function sendRequest(value){
	console.log(value);
}