
// skeleton for a basic singleton
let basicSingleton = (function() {
  
  // Private members
  var privateAttribute1 = false;
  var privateAttribute2 = [1, 2, 3];
  
  function privateMethod1() {  }
  function privateMethod2() { }

  // Public members
  return { 
    publicAttribute1: true,
    publicAttribute2: 10,
    
    publicMethod1: function() {  },
    publicMethod2: function() {  }
  };

})();

// skeleton for a lazy loading singleton
lazySingleton = (function() {

  // All normal singleton code here - can make ajax calls, etc
  function constructor() { 
    // Private members.
    var privateAttribute1 = false;
    var privateAttribute2 = [1, 2, 3];
  
    function privateMethod1() {  }
    function privateMethod2(args) {  }

    return {
      publicAttribute1: true,
      publicAttribute2: 10,
    
      publicMethod1: function() {  },
      publicMethod2: function(args) {  }
    }
  }

  // Private attribute that holds the single instance.
  var uniqueInstance;
  
  // this gets returned to client - getInstance is called to create or
  // if already exists, return existing instance of 'constructor' function's return
  //  'singleton'
  return {
    getInstance: function() {

      // Instantiate only if the instance doesn't exist.
      if(!uniqueInstance) { 
        uniqueInstance = constructor();
      }
      return uniqueInstance;
    }
  }
  
})();

// later create instance when needed
let singleInst = lazySingleton.getInstance();