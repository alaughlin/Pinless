Pinless.Routers.Router = Backbone.Router.extend({
  initialize: function (options) {
    this.$el = options.$el;
  },

  routes: {
    "":                       "index",
    "users/:id/friends":      "showUserFriends",
    "users/:id/boards/liked": "showUserBoardsLiked",
    "users/:id/boards":       "showUserBoards",
    "users/:id/cards/liked":  "showUserCardsLiked",
    "users/:id/cards":        "showUserCards",
    "users/:id":              "showUser",
    "boards/:id":             "showBoard",
    "cards/:id":              "showCard"

  },

  showUserFriends: function (id) {
    var that = this;
    var user = Pinless.users.getOrFetch(id, function (data) {
      var user = data;
      data.friends.fetch({
        reset: true,
        success: function (data) {
          var view = new Pinless.Views.UsersIndex({collection: data});
          that.$el.html(view.render().$el);
          that.userHeader(user);
        }
      });
    });
  },

  showUserBoards: function (id) {
    var that = this;
    var user = Pinless.users.getOrFetch(id, function (data) {
      var user = data;
      data.boards.fetch({
        reset: true,
        success: function (data) {
          var view = new Pinless.Views.BoardsIndex({collection: data});
          that.$el.html(view.render().$el);
          that.userHeader(user);
        }
      });
    });
  },

  showUserBoardsLiked: function (id) {
    var that = this;
    var user = Pinless.users.getOrFetch(id, function (data) {
      var user = data;
      data.boards_liked.fetch({
        reset: true,
        success: function (data) {
          var view = new Pinless.Views.BoardsIndex({collection: data});
          that.$el.html(view.render().$el);
          that.userHeader(user);
        }
      });
    });
  },

  showUserCards: function (id) {
    var that = this;
    var user = Pinless.users.getOrFetch(id, function (data) {
      var user = data;
      data.cards.fetch({
        reset: true,
        success: function (data) {
          var view = new Pinless.Views.CardsIndex({collection: data});
          that.$el.html(view.render().$el);
          that.userHeader(user);
        }
      });
    });
  },

  showUserCardsLiked: function (id) {
    var that = this;
    var user = Pinless.users.getOrFetch(id, function (data) {
      var user = data;
      data.cards_liked.fetch({
        reset: true,
        success: function (data) {
          var view = new Pinless.Views.CardsIndex({collection: data});
          that.$el.html(view.render().$el);
          that.userHeader(user);
        }
      });
    });
  },

  showUser: function (id) {
    this.$el.html("");
    var that = this;
    var user = Pinless.users.getOrFetch(id, function (data) {
      var view = new Pinless.Views.UserShow({model: data});
      that.$el.html(view.render().$el);
      that.showUserBoards(data.id);
    });
  },

  showBoard: function (id) {
    var that = this;
    var board = Pinless.boards.getOrFetch(id, function (data) {
      var view = new Pinless.Views.BoardShow({model: data});
      that.$el.html(view.render().$el);
      that.$el.prepend("<h2>" + data.escape('title') + "</h2>");
    });
  },

  showCard: function (id) {
    var that = this;
    var card = Pinless.cards.getOrFetch(id, function (data) {
      var view = new Pinless.Views.CardShow({model: data});
      that.$el.html(view.render().$el);
    });
  },

  userHeader: function (user) {
    var view = new Pinless.Views.UserShow({model: user});
    this.$el.prepend(view.render().$el);
  }
});