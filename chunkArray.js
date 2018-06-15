Object.defineProperty(Array.prototype, 'chunk', {
  value: function(n) {
    return Array.range(Math.ceil(this.length/n)).map((x,i) => this.slice(i*n,i*n+n));
  }
});