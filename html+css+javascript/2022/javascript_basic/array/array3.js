const data = {
    result:'success',    // success: 수신성공, fail:수신실패
    data:[
      {name:'이름1',gender:'남',age:10,blood:'A'},
      {name:'이름2',gender:'여',age:20,blood:'B'},
      {name:'이름3',gender:'남',age:30,blood:'O'},
      {name:'이름4',gender:'여',age:40,blood:'AB'},
      {name:'이름5',gender:'남',age:50,blood:'A'}
    ]
  };

  //0. 회원의 수
  {
    if(data.result == 'success'){
      console.log(`회원의 수 = ${data.data.length}`);  
    }
  }
  
  console.log('=======================')

  //1. 회원이름을 콘솔에 출력하기
  {
    if(data.result == 'success'){
      data.data.forEach(ele=>console.log(ele.name));
    }
  }

  //2. 회원 나이의 총합 출력하기
  {
    let sum = 0;
    data.data.forEach(ele=> sum+=ele.age);
    console.log(`회원 나이의 총합 : ${sum}`);
  
    const result = data.data.reduce((acc,ele)=>acc+ele.age,0);                                                                  
    console.log(`회원 나이의 총합 : ${result}`);
  }

  //3. 남자회원의 나이 총합 출력하기
  {
  const sum3 =
  data.data.filter(ele => ele.gender == '남')
  .reduce((pre,ele) => pre + ele.age,0);

  console.log(`남자 회원의 나이 총합3 : ${sum3}`)
  }

  // 4. 남자회원 여자회원을 배열로 분리하기
  {
    const arr2 =
    data.data.reduce((pre,ele) => {
        if(ele.gender == '남') {
            pre.남.push(ele);
        } else {
            pre.여.push(ele);
        }
        return pre;
    },{남 : [] , 여: []});

    console.log(arr2.남,arr2.여);
  }
  
  //5. A형 회원의 나이 총합 구하기
  {
    let sum = data.data.filter(ele => ele.blood == 'A')
                       .reduce((pre,ele) => pre + ele.age ,0);

    console.log(`A형 회원의 나이 총합 = ${sum}`)
  }

  //6. name이 이름3인 회원의 혈액형은?
  {
    data.data.forEach(ele => {
        if(ele.name == '이름3') {
            console.log(`name이 이름3인 회원의 혈액형 = ${ele.blood}`)
        }
    })

    const result = data.data.filter(ele => ele.name == '이름3');
    console.log(result[0].blood)
  }

// 7. 혈액형별 인원수 카운트
// 결과 : {A : 2, B : 1, O : 1, AB : 1}
{
    const result = data.data.reduce((pre,ele,idx,arr) => {
        // if(pre[ele.blood]) {
        //     pre[ele.blood] += 1;
        // } else {
        //     pre[ele.blood] = 1;
        // }

        // pre[ele.blood] = pre[ele.blood] ? pre[ele.blood] + 1 : 1;  

        pre[ele.blood] = (pre[ele.blood] || 0) + 1;
        return pre;
    },{})

    console.log(result);
}

// 8. 남성 회원의 평균 연령
{
    const avgOfAge = 
    data.data.filter(ele => ele.gender == '남')
             .reduce((pre,ele,idx,arr) => {
                // if(ele.gender == '남') 
                //     pre += ele.age;
                // if(idx == arr.length-1) {
                //     const leng = arr.filter(ele => ele.gender == '남').length;
                //     pre = pre/leng;
                // }
                return idx == arr.length-1 ? (pre + ele.age)/arr.length : pre + ele.age;  
            },0)

        console.log(`남성 회원의 평균 연령 : ${avgOfAge}`);
}

// 9. 나이가 가장많은 회원의 혈액형은? 
{
    const bloodTypeOfTheOldest =
          data.data.reduce((pre,ele,idx,arr) => {
            if(ele.age > pre) 
                pre = ele.age;
            if(idx == arr.length-1)
                pre = arr.filter(ele => ele.age == pre)[0].blood;  
            return pre;
          },0)

    const bloodTypeOfTheOldest2 = 
          data.data.reduce((pre,ele) => {
            return pre.age > ele.age ? pre : ele;
          })       

    console.log(`나이가 가장많은 회원의 혈액형은 = ${bloodTypeOfTheOldest}`)       
    console.log(`나이가 가장많은 회원의 혈액형은2 = ${bloodTypeOfTheOldest2.blood}`)       

}

// 10
{
    const processedData = 
        data.data.reduce((pre,ele) => {
            pre.push({namd : ele.name , age : ele.age});
            return pre;
        },[]);

    const processedData2 = 
        data.data.map(ele => {
            return {name:ele.name , age : ele.age}
        })

    console.log(processedData2);
}

// 11 수신된 데이터에 남자회원이 있는지 여부
{
    const isExist = 
        data.data.some(ele => ele.gender == '남');

    console.log(isExist);    
}

// 12 수신된 데이터가 모두 남자회원인지 여부
{
    const isExist = 
        data.data.every(ele => ele.gender == '남');

    console.log(isExist);    
}

// 13 여성회원을 나이 내림차순으로 정렬하기
{
    const sortedMember =
        data.data.filter(ele => ele.gender == '여')
                .sort((e1,e2) => e2.age - e1.age);

    console.log(sortedMember);
} 

// 14 여성이면서 혈액형이 ab인 첫 번쨰 회원의 이름은?
{
    const finded =
        data.data.find(ele => ele.gender == '여' && ele.blood == 'AB')

    console.log(finded.name);
}