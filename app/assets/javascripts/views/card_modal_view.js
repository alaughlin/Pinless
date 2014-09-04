Pinless.Views.CardModal = Backbone.View.extend({
  template: JST['cards/modal'],

  tagName: "li",

  className: "modal",

  events: {
    'click .card-like-button': 'cardLikeAction'
  },

  initialize: function () {},

  render: function () {
    var content = this.template({card: this.model});
    this.$el.html(content);

    return this;
  },

  cardLikeAction: function (event) {
    var cardId = event.currentTarget.dataset.id;
    var card = Pinless.cards.get(cardId);
    var $button = $(event.currentTarget);

    $.ajax({
      url: '/api/card_likes',
      type: 'POST',
      data: {
        card_id: cardId
      },
      success: function (data) {
        if (data.action === "created") {
          card.attributes.likes_card = true;
          $button.html("Unlike This Card");
        } else {
          card.attributes.likes_card = true;
          $button.html("Like This Card");
        }
      }
    });
  }
});