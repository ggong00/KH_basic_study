// 2개의 매개값을 받아 덧셈하는 화살표 함수
const sum = (x,y) => x + y; 

const num = [1,2,3];
// 2배수 함수
{
    const multi2 = x => x*2;
    const multi3 = x => x*3;
    const multi4 = x => x*4;

    num.forEach(ele => console.log(multi2(ele)));
    num.forEach(ele => console.log(multi3(ele)));
    num.forEach(ele => console.log(multi4(ele)));
}

// n배수 함수
console.log('=============n배수 함수=====================')
{
    const createMultiple = m => x => x * m; 
    
    const f2 = createMultiple(10);
    console.log(f2(10));
    console.log(createMultiple(10)(8));
    console.log(createMultiple(20)(12));
}
