const address = 'https://no.cocopuff.dev/';

Uri addressWith(Route route) => Uri.https('no.cocopuff.dev', routes[route]!);

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
