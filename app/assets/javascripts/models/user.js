Pinless.Models.User = Backbone.Model.extend({
  urlRoot: "/api/users",

  initialize: function () {
    var that = this;

    this.boards = new Pinless.Collections.Boards();
    this.boards.url = '/api/users/' + this.id + '/boards';
    this.boards.on("reset", this.updateCounts);

    this.cards = new Pinless.Collections.Cards();
    this.cards.url = '/api/users/' + this.id + '/cards';
    this.cards.on("reset", this.updateCounts);

    this.boards_liked = new Backbone.Subset([], {parentCollection: Pinless.boards});
    this.boards_liked.url = '/api/users/' + this.id + '/boards/liked';
    this.boards_liked.on("reset", this.updateCounts);

    this.cards_liked = new Backbone.Subset([], {parentCollection: Pinless.cards});
    this.cards_liked.url = '/api/users/' + this.id + '/cards/liked';
    this.cards_liked.listenTo(this.cards_liked, 'change', function (card) {
      if (card.likes_card === false) {
        that.cards_liked.remove(card);
      } else {
        that.cards_liked.add(card);
      }
    });
    this.cards_liked.on("reset", this.updateCounts);

    this.friends = new Pinless.Collections.Users();
    this.friends.url = "api/users/" + this.id + "/friends";
    this.friends.on("reset", this.updateCounts);

    this.feed = new Pinless.Collections.Cards();
    this.feed.comparator = function(card) {
      return -card.get('id');
    }
    this.feed.url = "api/feed";
    this.feed.on("reset", this.updateCounts);
  },

  toJSON: function () {
    return { user: _.clone(this.attributes) }
  }
});