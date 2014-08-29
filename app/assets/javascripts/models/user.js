Pinless.Models.User = Backbone.Model.extend({
  urlRoot: "/api/users",

  initialize: function () {
    this.boards = new Pinless.Collections.Boards();
    this.boards.url = '/api/users/' + this.id + '/boards';
    this.boards.on("reset", this.updateCounts);

    this.cards = new Pinless.Collections.Cards();
    this.cards.url = '/api/users/' + this.id + '/cards';
    this.cards.on("reset", this.updateCounts);

    this.boards_liked = new Pinless.Collections.Boards();
    this.boards_liked.url = '/api/users/' + this.id + '/boards/liked';
    this.boards_liked.on("reset", this.updateCounts);

    this.cards_liked = new Pinless.Collections.Cards();
    this.cards_liked.url = '/api/users/' + this.id + '/cards/liked';
    this.cards_liked.on("reset", this.updateCounts);
  },
});