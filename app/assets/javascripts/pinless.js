window.Pinless = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function () {
    console.log("init");
    Pinless.users = new Pinless.Collections.Users();
    Pinless.boards = new Pinless.Collections.Boards();
    Pinless.cards = new Pinless.Collections.Cards();
    Pinless.router = new Pinless.Routers.Router({$el: $("#content")});
    Backbone.history.start();
  }
}

$(document).ready(function(){
  Pinless.initialize();
});