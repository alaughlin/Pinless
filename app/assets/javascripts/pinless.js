window.Pinless = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function () {
    Pinless.users = new Pinless.Collections.Users();
    Pinless.boards = new Pinless.Collections.Boards();
    Pinless.cards = new Pinless.Collections.Cards();
    Pinless.users.getOrFetch(Pinless.userId, function (user) {
      Pinless.currentUser = user;
      Pinless.currentUser.cards_liked.fetch();
      Pinless.router = new Pinless.Routers.Router({$el: $("#content")});
      Backbone.history.start();
    });
  },
};

$(document).ready(function () {
  Pinless.userId = window.currentUserId;
  Pinless.initialize();
});