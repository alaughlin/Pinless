Pinless.Views.CardShow = Backbone.View.extend({
  template: JST['cards/show'],

  tagName: "li",

  className: "card content-list-item",

  initialize: function () {},

  render: function () {
    var content = this.template({card: this.model});
    this.$el.html(content);

    return this;
  }
});