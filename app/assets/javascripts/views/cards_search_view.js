Pinless.Views.CardsSearch = Backbone.View.extend({
  template: JST['cards/search'],

  initialize: function () {
    this.cards = this.collection;
  },

  tagName: 'ul',

  className: "cols group",

  events: {
    'click .card-image': 'cardModal'
  },

  cardModal: function (event) {
    var card = Pinless.cards.get(event.currentTarget.dataset.id);
    var view = new Pinless.Views.CardModal({model: card});
    Pinless.router.$cardModal.html(view.render().$el);
    $('.overlay').addClass('overlay-show');
    $('.card-modal').addClass('card-modal-show');
    $('.card-modal').css("left", function (){
      return ($(".overlay").width() - $(this).width()) / 2;
    });
    // $('body').addClass('stop-scrolling');
  },

  render: function () {
    var that = this;
    this.$el.empty();

    var $col1 = $("<ul class='col1'>");
    var $col2 = $("<ul class='col2'>");
    var $col3 = $("<ul class='col3'>");
    var $col4 = $("<ul class='col4'>");
    var $col5 = $("<ul class='col5'>");
    var counter = 1;

    this.cards.forEach(function (card) {
      if (counter > 5) {
        counter = 1;
      }

      switch(counter) {
        case 1:
          var col = $col1
          break;
        case 2:
          var col = $col2
          break;
        case 3:
          var col = $col3
          break;
        case 4:
          var col = $col4
          break;
        case 5:
          var col = $col5
          break;
      }

      content = that.template({card: card});
      col.append(content);

      counter++;
    });

    this.$el.append($col1);
    this.$el.append($col2);
    this.$el.append($col3);
    this.$el.append($col4);
    this.$el.append($col5);

    return this;
  }
});