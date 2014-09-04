Pinless.Routers.Router = Backbone.Router.extend({
  initialize: function (options) {
    this.$el = options.$el;
    this.$overlayContent = $('.overlay-content');
    this.$cardModal = $('.card-modal');
    this.$subHeader = $('#sub-header');
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
    "search?q=:terms":        "search"
  },

  search: function (terms) {
    var that = this;
    $.ajax({
      url: '/api/search',
      type: 'GET',
      data: {
        q: terms
      },
      success: function (data) {
        that.$subHeader.html("<h2 class='search-header'>Showing results for: " + terms + "</h2>");
        that.$el.html("");
        var view = new Pinless.Views.CardsSearch({collection: data});
        that.$el.html(view.render().$el);
      }
    });
  },

  index: function () {
    this.$el.html("");
    this.$subHeader.html("");
    var that = this;
    var user = Pinless.users.getOrFetch(window.currentUserId, function (data) {
      var user = data;
      data.boards_liked.fetch({
        reset: true,
        success: function (data) {
          _.each(data.models, function(board) {
            board.childCards.fetch({
              reset: true,
              success: function (data) {
                _.each(data.models, function (card) {
                  Pinless.feed.add(card);
                });
              }
            });
          });
        }
      });
      var view = new Pinless.Views.Index({collection: Pinless.feed});
      that.$el.html(view.render().$el);
    });
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
          that.$el.html(view.render().$el);
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
          that.$el.html(view.render().$el);
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
          that.$el.html(view.render().$el);
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
          that.$el.html(view.render().$el);
          that.userHeader(user);
          $('.user-cards-link').addClass('user-links-selected');
        }
      });
    });
  },

  showUserCardsLiked: function (id) {
    Pinless.router.hideModal();
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
    Pinless.router.hideModal();
    this.$el.html("");
    var that = this;
    var user = Pinless.users.getOrFetch(id, function (data) {
      var user = data;
      user.friends.fetch({
        success: function (data) {
          var view = new Pinless.Views.UserShow({model: user});
          that.$subHeader.html(view.render().$el);
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
          that.$el.html(view.render().$el);
          var view = new Pinless.Views.BoardHeader({model: board});
          that.$subHeader.html(view.render().$el);
        }
      });
    });
  },

  // showCard: function (id) {
  //   var that = this;
  //   var card = Pinless.cards.getOrFetch(id, function (data) {
  //     var view = new Pinless.Views.CardShow({model: data});
  //     that.$el.html(view.render().$el);
  //   });
  // },

  userHeader: function (user) {
    var view = new Pinless.Views.UserShow({model: user});
    this.$subHeader.html(view.render().$el);
  },

  cardModal: function (id) {
    var that = this;
    var card = Pinless.cards.getOrFetch(id, function (data) {
      var view = new Pinless.Views.CardModal({model: data});
      Pinless.router.$cardModal.html(view.render().$el);
      $(".overlay").addClass('overlay-show');
      $('.card-modal').addClass('card-modal-show');
      $('body').addClass('stop-scrolling');
    });
  },
});