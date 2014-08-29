Pinless.Views.BoardHeader = Backbone.View.extend({
  template: JST['boards/header'],

  initialize: function () {},

  render: function () {
    var content = this.template({board: this.model});
    this.$el.html(content);

    return this;
  }
});