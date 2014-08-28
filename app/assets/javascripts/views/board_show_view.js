Pinless.Views.BoardShow = Backbone.View.extend({
  template: JST['boards/show'],

  initialize: function () {
    this.id = this.model.escape('id');
  },

  render: function () {
    var content = this.template({board: this.model});
    this.$el.html(content);

    return this;
  }
})