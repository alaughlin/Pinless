window.Pinless = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function () {
    subsetClass = Backbone.Subset.extend({});

    Pinless.users = new Pinless.Collections.Users();
    Pinless.boards = new Pinless.Collections.Boards();
    Pinless.cards = new Pinless.Collections.Cards();
    Pinless.feed = new Pinless.Collections.Cards();
    Pinless.feed.comparator = function(card) {
      return -card.get('id');
    }
    Pinless.router = new Pinless.Routers.Router({$el: $("#content")});
    Backbone.history.start();
  },

  cardModal: function (card) {
    console.log(card);
  }
};

$(document).ready(function(){
  Pinless.initialize();
  Pinless.currentUser = new Pinless.Models.User({id: window.currentUserId});
  Pinless.currentUser.fetch();
  Pinless.currentUser.friends.fetch();
});