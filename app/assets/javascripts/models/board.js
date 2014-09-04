Pinless.Models.Board = Backbone.Model.extend({
  urlRoot: "/api/boards",

  initialize: function () {
    console.log(this.id);
    this.childCards = new Pinless.Collections.Cards();
    this.childCards.url = '/api/boards/' + this.id + '/cards';
    this.childCards.on("reset", this.updateCounts);
    this.childCards.comparator = function(card) {
      return -card.get('id');
    }
  },

  toJSON: function () {
    return { board: _.clone(this.attributes) }
  },

  cards: function () {
    if (!this._cards) {
      this._cards = new Pinless.Collections.Cards();
    }

    return this._cards
  },

  parse: function(response) {
    if (response["cards"]) {
      var newCards = response["cards"];
      this.cards().set(newCards, { parse: true });
      //delete response["cards"]
    }

    return response;
  }
});