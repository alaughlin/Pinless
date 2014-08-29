Pinless.Views.Card = Backbone.View.extend({
  template: JST['cards/card'],

  initialize: function () {},

  render: function () {
    var content = this.template({card: this.model});
    this.$el.html(content);

    return this;
  }
});