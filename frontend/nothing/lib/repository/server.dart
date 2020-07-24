const address = 'http://35.231.254.25:9091/';

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
