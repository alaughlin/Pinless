Pinless.Views.Index = Backbone.View.extend({
template: JST['index'],

  initialize: function () {
    this.cards = this.collection;
    this.listenTo(this.cards, 'sync add remove reset', function() {
      this.render();
    });
  },

  el: "<ul>",

  className: "cards-list group",

  render: function () {
    var that = this;
    this.$el.empty();
    this.cards.each(function (card) {
      view = new Pinless.Views.CardShow({model: card});
      that.$el.append(view.render().$el);
    });

    return this;
  },
});