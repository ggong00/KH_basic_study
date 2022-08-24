const person = {
    name: '홍길동',
    age: 30,
    blood: 'A',
    address: {nation:'한국',location:'울산'}
}

Object.keys(person).forEach((key,idx,arr) => {
    console.log(key,person[key])
})

Object.values(person).forEach((value,idx,arr) => {
    console.log(value)
})

Object.entries(person).forEach((entry,idx,arr) => {
    console.log(entry)
})