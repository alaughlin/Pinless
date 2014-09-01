Pinless.Views.BoardShow = Backbone.View.extend({
  template: JST['boards/show'],

  initialize: function () {
    this.id = this.model.escape('id');
    this.cards = this.model.cards();
    this.listenTo(this.model.cards(), 'sync add remove reset', this.render);
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