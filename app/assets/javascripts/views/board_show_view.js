Pinless.Views.BoardShow = Backbone.View.extend({
  template: JST['boards/show'],

  initialize: function () {
    this.id = this.model.escape('id');
    this.cards = this.model.cards();
    this.listenTo(this.cards, 'sync add remove reset', function() {
      console.log("fired");
      this.render();
    });
  },

  events: {
    'click .card-image': 'cardModal'
  },

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

  cardModal: function (event) {
    console.log(event);
    event.preventDefault();
    var id = event.currentTarget.dataset.id;
    var that = this;
    console.log(id);
    var card = Pinless.cards.getOrFetch(id, function (data) {
      var view = new Pinless.Views.Card({model: data});
      Pinless.router.$overlayContent.html(view.render().$el);
      $(".overlay").addClass('overlay-show');
    });
  },
});