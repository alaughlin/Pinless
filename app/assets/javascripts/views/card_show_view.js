Pinless.Views.CardShow = Backbone.View.extend({
  template: JST['cards/show'],

  initialize: function (card) {},

  render: function () {
    var content = this.template({card: this.model});
    this.$el.html(content);

    return this;
  }
});