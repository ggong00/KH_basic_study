let news = [];
let topicNews = [];

let menus = document.querySelectorAll(".menus button");
menus.forEach(item => {
  item.addEventListener("click" , (event) => getNewsByTopic(event) )
});




const getLatestNews = async() => {
  let url = new URL(
    'https://api.newscatcherapi.com/v2/latest_headlines?countries=KR&topic=business&page_size=10'
  );
  let header = new Headers({'x-api-key' : 'j4qG29j5IutCC83upRzGTneeMUusoJxxtUtKVhP2hnk', 'Content-Type' : 'text/json; charset=UTF-8'});
  let response = await fetch(url,{headers : header})
  let data = await response.json();
  news = data.articles;
  console.log(news);
  render();

}

const getNewsBySearch = async() => {
  let searchValue = document.getElementById("search-input").value;

  let url = new URL(
    `https://api.newscatcherapi.com/v2/search?q=${searchValue}&countries=KR&page_size=10`
  );
  let header = new Headers({'x-api-key' : 'j4qG29j5IutCC83upRzGTneeMUusoJxxtUtKVhP2hnk', 'Content-Type' : 'text/json; charset=UTF-8'});
  let response = await fetch(url,{headers : header})
  let data = await response.json();
  news = data.articles;
  render();

}

const getNewsByTopic = async(event) => {
  let topic = event.target.textContent.toLowerCase();   
  let url = new URL(`https://api.newscatcherapi.com/v2/latest_headlines?countries=KR&topic=${topic}&page_size=10`);

  let header = new Headers({'x-api-key' : 'j4qG29j5IutCC83upRzGTneeMUusoJxxtUtKVhP2hnk', 'Content-Type' : 'text/json; charset=UTF-8'});
  let response = await fetch(url,{headers : header})
  let data = await response.json();
  news = data.articles;
  render();
}

const render = () => {
  let newsHTML = '';
  newsHTML = news.map(items => {
              let returnHTML = '';

              returnHTML = `<div class="row news">
              <div class="col-lg-4">
                <img class="news-img" src="${items.media}" alt="${items.title}">
              </div>
              <div class="col-lg-8">
                <a href ="${items.link}"><button class = "btn btn-light"><h2>${items.title}</h2></button></a>
                <p>${items.summary}</p>
                <div>
                  ${items.rights} * ${items.published_date}
                </div>
              </div>
            </div>`

    return returnHTML;
  }).join(' ');

  document.getElementById("news-board").innerHTML = newsHTML;
}

getLatestNews();

let button = document.getElementById("search-button");
button.addEventListener("click",getNewsBySearch);
