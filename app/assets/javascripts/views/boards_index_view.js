Pinless.Views.BoardsIndex = Backbone.View.extend({
  template: JST['boards/index'],

  initialize: function () {
    this.boards = this.collection;
  },

  el: "<ul>",

  className: "boards-list group",

  render: function () {
    var that = this;

    this.boards.models.forEach(function (board) {
      view = new Pinless.Views.Board({model: board});
      that.$el.append(view.render().$el);
    });

    return this;
  }
});