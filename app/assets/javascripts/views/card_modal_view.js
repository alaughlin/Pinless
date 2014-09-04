Pinless.Views.CardModal = Backbone.View.extend({
  template: JST['cards/modal'],

  tagName: "li",

  className: "modal",

  events: {
    'click .card-like-button': 'cardLikeAction'
  },

  initialize: function () {
    this.listenTo(this.model, 'sync change', this.render);
  },

  render: function () {
    var content = this.template({card: this.model});
    this.$el.html(content);

    return this;
  },

  cardLikeAction: function (event) {
    var cardId = event.currentTarget.dataset.id;
    var that = this;

    $.ajax({
      url: '/api/card_likes',
      type: 'POST',
      data: {
        card_id: cardId
      },
      success: function (data) {
        if (data.action === "created") {
          that.model.set('likes_card', true);
          Pinless.currentUser.cards_liked.add(that.model);
        } else {
          that.model.set('likes_card', false);
          Pinless.currentUser.cards_liked.remove(that.model);
        }
      }
    });
  }
});