Pinless.Views.BoardShow = Backbone.View.extend({
  template: JST['boards/show'],

  initialize: function () {
    this.id = this.model.escape('id');
    this.cards = this.model.get('cards');
  },

  el: "<ul>",

  className: "cards-list group",

  render: function () {
    var that = this;

    this.cards.forEach(function (card) {
      view = new Pinless.Views.CardShow({model: card});
      that.$el.append(view.render().$el);
    });

    return this;
  }
})