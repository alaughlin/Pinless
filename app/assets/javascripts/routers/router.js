Pinless.Routers.Router = Backbone.Router.extend({
  initialize: function (options) {
    this.$el = options.$el;
    this.$overlayContent = $('.overlay-content');
    this.$cardModal = $('.card-modal');
    this.$subHeader = $('#sub-header');
  },

  routes: {
    "":                          "index",
    "requests":                  "requests",
    "users/:id/friends":         "showUserFriends",
    "users/:id/boards/liked":    "showUserBoardsLiked",
    "users/:id/boards":          "showUserBoards",
    "users/:id/cards/liked":     "showUserCardsLiked",
    "users/:id/cards":           "showUserCards",
    "users/:id":                 "showUser",
    "boards/:id":                "showBoard",
    "search?m=:model&q=:terms":  "search"
  },

  search: function (model, terms) {
    var model = model;
    var terms = terms;
    var that = this;

    $.ajax({
      url: '/api/search',
      type: 'GET',
      data: {
        m: model,
        q: terms
      },
      success: function (data) {
        console.log(that.model);
        if (model === "card") {
          console.log(data);
          var results = new Pinless.Collections.Cards(data);
          that.$subHeader.html("<h2 class='search-header'>Showing cards that match: <strong>" + terms + "</strong></h2>");
          that.$el.html("");
          var view = new Pinless.Views.CardsIndex({collection: results});
        } else if (model === "board") {
          var results = new Pinless.Collections.Boards(data);
          that.$subHeader.html("<h2 class='search-header'>Showing boards that match: <strong>" + terms + "</strong></h2>");
          that.$el.html("");
          var view = new Pinless.Views.BoardsIndex({collection: results});
        } else {
          var results = new Pinless.Collections.Users(data);
          that.$subHeader.html("<h2 class='search-header'>Showing users that match: <strong>" + terms + "</strong></h2>");
          that.$el.html("");
          var view = new Pinless.Views.UsersIndex({collection: results});
        }

        that._swapView(view);
      }
    });
  },

  index: function () {
    var that = this;
    Pinless.currentUser.feed.fetch({
      reset: true,
      success: function (data) {
        that.$subHeader.html("<h2 class='search-header'>Latest Pins</h2)>");
        var view = new Pinless.Views.Index({collection: data});
        that._swapView(view);
      }
    });
  },

  requests: function () {
    Pinless.router.hideModal();
    var that = this;
    var user = Pinless.currentUser;
    var view = new Pinless.Views.FriendRequests({collection: user.attributes.requests});
    that._swapView(view);
    that.userHeader(user);
    $('.user-requests-link').addClass('user-links-selected');
  },

  hideModal: function () {
    $('.card-modal').removeClass('card-modal-show');
    $('.overlay-content').removeClass('overlay-content-show');
    $(".overlay").removeClass('overlay-show');
    $('body').removeClass('stop-scrolling');
  },

  showUserFriends: function (id) {
    Pinless.router.hideModal();
    var that = this;
    var user = Pinless.users.getOrFetch(id, function (data) {
      var user = data;
      data.friends.fetch({
        reset: true,
        success: function (data) {
          var view = new Pinless.Views.UsersIndex({collection: data});
          that._swapView(view);
          that.userHeader(user);
          $('.user-friends-link').addClass('user-links-selected');
        }
      });
    });
  },

  showUserBoards: function (id) {
    Pinless.router.hideModal();
    var that = this;
    var user = Pinless.users.getOrFetch(id, function (data) {
      that.userHeader(data);
      $('.user-boards-link').addClass('user-links-selected');
      data.boards.fetch({
        reset: true,
        success: function (data) {
          var view = new Pinless.Views.BoardsIndex({collection: data});
          that._swapView(view);
        }
      });
    });
  },

  showUserBoardsLiked: function (id) {
    Pinless.router.hideModal();
    var that = this;
    var user = Pinless.users.getOrFetch(id, function (data) {
      var user = data;
      data.boards_liked.fetch({
        reset: true,
        success: function (data) {
          var view = new Pinless.Views.BoardsIndex({collection: data});
          that._swapView(view);
          that.userHeader(user);
          $('.user-liked-boards-link').addClass('user-links-selected');
        }
      });
    });
  },

  showUserCards: function (id) {
    Pinless.router.hideModal();
    var that = this;
    var user = Pinless.users.getOrFetch(id, function (data) {
      var user = data;
      data.cards.fetch({
        reset: true,
        success: function (data) {
          var view = new Pinless.Views.CardsIndex({collection: data});
          that._swapView(view);
          that.userHeader(user);
          $('.user-cards-link').addClass('user-links-selected');
        }
      });
    });
  },

  showUserCardsLiked: function (id) {
    Pinless.router.hideModal();
    var that = this;
    if (id == Pinless.currentUser.id) {
      Pinless.currentUser.cards_liked.fetch({
        merge: true,
        success: function (data) {
          var view = new Pinless.Views.CardsIndex({collection: data});
          that._swapView(view);
          that.userHeader(Pinless.currentUser);
          $('.user-liked-cards-link').addClass('user-links-selected');
        }
      });
    } else {
      var user = Pinless.users.getOrFetch(id, function (data) {
        var user = data;
        user.cards_liked.fetch({
          reset: true,
          success: function (data) {
            var view = new Pinless.Views.CardsIndex({collection: data});
            that._swapView(view);
            that.userHeader(user);
            $('.user-liked-cards-link').addClass('user-links-selected');
          }
        });
      });      
    }
  },

  showUser: function (id) {
    Pinless.router.hideModal();
    this.$el.html("");
    var that = this;
    var user = Pinless.users.getOrFetch(id, function (data) {
      var user = data;
      user.friends.fetch({
        success: function (data) {
          var view = new Pinless.Views.UserShow({model: user});
          that._swapHeaderView(view);
        }
      });
    });
  },

  showBoard: function (id) {
    Pinless.router.hideModal();
    var that = this;
    var board = Pinless.boards.getOrFetch(id, function (data) {
      var board = data;
      board.childCards.fetch({
        success: function (data) {
          var view = new Pinless.Views.BoardShow({model: board});
          that._swapView(view);
          var view = new Pinless.Views.BoardHeader({model: board, collection: board.childCards});
          that._swapHeaderView(view);
        }
      });
    });
  },

  userHeader: function (user) {
    var view = new Pinless.Views.UserShow({model: user});
    this._swapHeaderView(view);
  },

  _swapView: function (view) {
    this._currentView && this._currentView.remove();
    this._currentView = view;
    this.$el.html(view.render().$el);
  },

  _swapHeaderView: function (view) {
    this._currentHeaderView && this._currentHeaderView.remove();
    this._currentHeaderView = view;
    this.$subHeader.html(view.render().$el);
  },

  addBoardModal: function () {
    var view = new Pinless.Views.BoardAdd();
    Pinless.router.$overlayContent.html(view.render().$el);
    $(".overlay").addClass('overlay-show');
    $(".overlay-content").addClass('overlay-content-show');
    $('.overlay-content').height(400);
    $('body').addClass('stop-scrolling');
  },
});