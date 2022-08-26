const tmpData = {
    '1':{id:'1', text:'dodo_1', completed:false },
    '2':{id:'2', text:'dodo_2', completed:true },
    '3':{id:'3', text:'dodo_3', completed:false },
    '4':{id:'4', text:'dodo_4', completed:true },
    '4':{id:'4', text:'dodo_4', completed:false }
};

const obj = {...tmpData};

//객체 순회
// for(let key in tmpData) {
//     if(tmpData.hasOwnProperty(key)) {
//         console.log(key, tmpData[key]);
//         if(tmpData[key].completed) {
//             delete obj[key];
//         }
//     }
// }

// console.log(tmpData,obj);

// const map = new Map(Object.entries(tmpData))

// map.forEach((value,key,m) => {
//     if(value.completed) {
//         delete obj[key];
//     }
// });

// console.log(obj);

{
    //객체 리터럴 => 배열 Object.entrise()
    //배열 => 객체 리터럴 Object.fromEntrise()
    const result =
        Object.fromEntries(Object.entries(tmpData)
                                .filter(entry => !entry[1].completed));

    console.log(result);
}

