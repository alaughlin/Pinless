Pinless.Views.Index = Backbone.View.extend({
  initialize: function () {
    this.subViews = [];
    this.cards = this.collection;
    this.listenTo(this.cards, 'sync add remove reset', this.render);
  },

  tagName: "ul",

  className: "cols group",

  render: function () {
    var that = this;
    this.$el.empty();
    this.subViews.forEach(function (view) {
      view.remove();
    });

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

      var view = new Pinless.Views.CardShow({model: card});
      col.append(view.render().$el);

      that.subViews.push(view);

      counter++;
    });

    this.$el.append($col1);
    this.$el.append($col2);
    this.$el.append($col3);
    this.$el.append($col4);
    this.$el.append($col5);

    return this;
  },

  remove: function () {
    this.subViews.forEach(function (view) {
      view.remove();
    });

    return Backbone.View.prototype.remove.call(this);
  }
});