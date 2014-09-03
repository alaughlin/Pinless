Pinless.Views.Index = Backbone.View.extend({
  initialize: function () {
    this.cards = this.collection;
    this.listenTo(this.cards, 'sync add remove reset', function() {
      this.render();
    });
  },

  tagName: "ul",

  className: "cols group",

  render: function () {
    this.$el.empty();

    var $col1 = $("<ul class='col1'>");
    var $col2 = $("<ul class='col2'>");
    var $col3 = $("<ul class='col3'>");
    var $col4 = $("<ul class='col4'>");
    var $col5 = $("<ul class='col5'>");
    var counter = 1;

    this.cards.each(function (card) {
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

      view = new Pinless.Views.CardShow({model: card});
      col.append(view.render().$el);

      counter++;
    });

    this.$el.append($col1);
    this.$el.append($col2);
    this.$el.append($col3);
    this.$el.append($col4);
    this.$el.append($col5);

    return this;
  },
});