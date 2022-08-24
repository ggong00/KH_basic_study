const str = '내이름은 홍길동입니다';
console.log(str);

const name = '홍길동'
const str2 = '내이름은 ' + name + '입니다';
console.log(str2);

//template literal
const str3 = `내이름은${name} 입니다`;

//taged template
const blood = 'A';
const age = 19;

const taged = (strings,...exp) => {
    console.log(strings)

    const str = exp.map((ele,i) => `${ele}=${i}`).join('');

    return str
}
const str5 = taged`dd${name}ee${age}aa${blood}nn`;
console.log(str5)
// const str4 = taged`${name}`;


