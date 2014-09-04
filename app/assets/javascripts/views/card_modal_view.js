Pinless.Views.CardModal = Backbone.View.extend({
  template: JST['cards/modal'],

  tagName: "li",

  className: "modal",

  initialize: function () {},

  render: function () {
    var content = this.template({card: this.model});
    this.$el.html(content);

    return this;
  }
});