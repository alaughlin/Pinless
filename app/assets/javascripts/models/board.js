Pinless.Models.Board = Backbone.Model.extend({
  urlRoot: "/api/boards",

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