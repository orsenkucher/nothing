const p2 = 'ab';
const p1 = 'loyalty';
const address = 'https://$p1-vbot.${p2}m$p1.app/nothing/';

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
