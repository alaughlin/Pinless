Pinless.Views.Board = Backbone.View.extend({
  template: JST['boards/board'],

  initialize: function () {},

  render: function () {
    var content = this.template({board: this.model});
    this.$el.html(content);

    return this;
  }
});