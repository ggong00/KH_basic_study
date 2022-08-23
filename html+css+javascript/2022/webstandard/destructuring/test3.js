const person = {
    name:'홍길동',
    age:30
}

//Person객체를 매개값으로 받아서 출력
{
    function printPerson(obj) {
        const name = obj.name
        const age = obj.age
        console.log(name,age)
    }
    printPerson(person);
}


{
    const printPerson = ({name,age}) => console.log(name,age)
    printPerson(person);
}