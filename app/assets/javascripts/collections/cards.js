Pinless.Collections.Cards = Backbone.Collection.extend({
  url: "/api/cards",
  model: Pinless.Models.Card,

  getOrFetch: function (id, cb) {
    var card = new Pinless.Models.Card({id: id});

    if (Pinless.cards.get(card)) {
      cb(Pinless.cards.get(card));
    } else {
      card.fetch({
        success: function (data) {
          Pinless.cards.add(data)
          cb(data);
        }
      });
    }

    return card;
  }
});
