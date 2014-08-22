Grepolia.Routers.Home = Backbone.Marionette.AppRouter.extend({
  routes: {
    '': 'home'
  },

  home: function (){
    console.log('You are in Home');
  }
});
