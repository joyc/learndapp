var Counter = artifacts.require("Counter");

contract('Counter', function(accounts) {
    var counterInstance;
    it("Counter", function() {  // it defines a test case
        return Counter.deployed()
        .then(function(instance) {
            counterInstance = instance;
            return counterInstance.count();
        }).then(function(){
            return counterInstance.counter();
        }).then(function(count){
            assert.equal(count, 1, "counter should be 1");
        });
    });
}); 