Pinless.Routers.Router = Backbone.Router.extend({
  initialize: function (options) {
    this.$el = options.$el;
    this.$overlayContent = $('.overlay-content');
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

  hideModal: function () {
    $(".overlay").removeClass('overlay-show');
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
          $('.user-friends-link').addClass('user-links-selected');
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
          $('.user-boards-link').addClass('user-links-selected');
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
          $('.user-liked-boards-link').addClass('user-links-selected');
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
          $('.user-cards-link').addClass('user-links-selected');
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
          $('.user-liked-cards-link').addClass('user-links-selected');
        }
      });
    });
  },

  showUser: function (id) {
    console.log("hi");
    this.$el.html("");
    var that = this;
    var user = Pinless.users.getOrFetch(id, function (data) {
      var view = new Pinless.Views.UserShow({model: data});
      $("#sub-header").html(view.render().$el);
      that.showUserBoards(data.id);
    });
  },

  showBoard: function (id) {
    var that = this;
    var board = Pinless.boards.getOrFetch(id, function (data) {
      var view = new Pinless.Views.BoardShow({model: data});
      that.$el.html(view.render().$el);
      var view = new Pinless.Views.BoardHeader({model: data});
      that.$el.prepend(view.render().$el);
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
    $('#sub-header').html(view.render().$el);
  }
});