/**
 * Allows for an array to be filtered out async
 * @param {*} arr 
 * @param {*} callback 
 */
async function filter(arr, callback) {
    return (await Promise.all(arr.map(async item => {
         return (await callback(item)) ? item : undefined
    }))).filter(i=>i!==undefined)
}

// use by passing array and callback for each filtering (cb has async stuff)
// in example array is movies filter by async alreadyHaveMovies call
let newMovies = await filter(movies, async movie => await sequalize.alreadyHaveMovie(movie));