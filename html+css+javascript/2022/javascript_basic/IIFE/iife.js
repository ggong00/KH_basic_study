//iife(immediately Invoked Functoin Expression)
const f = (x,y) => x + y;

const r = f(10,20);
console.log(r);

const r2 = ((x,y) => x + y)(10,20);
console.log(r2);

