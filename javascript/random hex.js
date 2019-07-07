
    /*******************************************************************************
    *   Function: random_color_hex
    *       returns a random color in hex format
    *
    *   Parameters:
    *       none
    *
    *   Returns: 
    *       a rgb number in hex
    *******************************************************************************/
    random_color_hex: function() {
        return '#'+'0123456789ABCDEF'.split('').map( function(val, idx, arr) {
            return idx > 5 ? null : arr[Math.floor(Math.random()*16)];
        }).join('');
    },