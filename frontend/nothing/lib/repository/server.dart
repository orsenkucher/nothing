const address = 'https://no.cocopuff.dev/';

String addressWith(Route route) => address + routes[route];

const routes = {
  Route.questions: 'getQues',
  Route.registerAd: 'adRegister',
  Route.reportAd: 'adReport',
  Route.reportLike: 'likeReport'
};

enum Route {
  questions,
  registerAd,
  reportAd,
  reportLike,
}
