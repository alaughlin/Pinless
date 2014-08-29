Pinless.Views.CardsIndex = Backbone.View.extend({
  template: JST['cards/index'],

  initialize: function () {
    this.cards = this.collection;
  },

  el: "<ul>",

  className: "cards-list group",

  render: function () {
    var that = this;

    this.cards.models.forEach(function (card) {
      view = new Pinless.Views.Card({model: card});
      that.$el.append(view.render().$el);
    });

    return this;
  }
});