function makeElements(name, attributes, ...contents){
    const node = document.createElement(name);

    if(attributes) {
        for(let attr in attributes) {
            if(attributes.hasOwnProperty(attr)) {
                node.setAttribute(attr,attributes[attr]);
            }
        }
    }

    // 컨텐츠가 있는 경우
    if(contents) {
        for(let ele of contents) {
            let child = ele;
            //문자열이면 텍스트 노드 생성
            if(typeof child == 'string') {
                child = document.createTextNode(child);
            }
            node.appendChild(child);
        }
    }

    return node;
}

