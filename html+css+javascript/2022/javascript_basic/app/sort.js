const arr  = ['a','p','p','l','e']
const arr2  = [76,15,27,54]

//Array.sort() 사용
//sort()는 배열요소를 문자열로 
//         변환하여 각 문자의 
//         유니코드 값에 따라 정렬
//         따라서 요소가 숫자인 경우 콜백함수를 통해 정렬기준 반영

//1) arr 오름차순 정렬
arr.sort();
console.log(arr);

//2) arr 내림차순 정렬
arr.reverse()
console.log(arr);

//3) arr2 오름차순 정렬
arr2.sort((e1,e2) => e1-e2);
console.log(arr2);

//4) arr2 내림차순 정렬
arr2.sort((e1,e2) => e2-e1);
console.log(arr2);

