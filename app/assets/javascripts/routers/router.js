Pinless.Routers.Router = Backbone.Router.extend({
  initialize: function (options) {
    this.$el = options.$el;
  },

  routes: {
    "":            "index",
    "users/:id":  "showUser",
    "boards/:id": "showBoard",
    "cards/:id":  "showCard"
  },

  showUser: function (id) {
    var that = this;
    var user = Pinless.users.getOrFetch(id, function (data) {
      that.$el.html(data.username);
    });
  },

  showBoard: function (id) {
    var that = this;
    var board = Pinless.boards.getOrFetch(id, function (data) {
      var view = new Pinless.Views.BoardShow({model: data});
      that.$el.html(view.render().$el);
    });
  },

  showCard: function (id) {
    var that = this;
    var card = Pinless.cards.getOrFetch(id, function (data) {
      var view = new Pinless.Views.CardShow({model: data});
      that.$el.html(view.render().$el);
    });
  }
});