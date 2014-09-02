Pinless.Views.BoardHeader = Backbone.View.extend({
  template: JST['boards/header'],

  tagName: 'section',

  className: 'board-info',

  initialize: function (data) {
    this.listenTo(Pinless.boards, 'sync add remove reset', this.render);
  },

  events: {
    'click .add-card-link': 'addCardModal',
  },

  render: function () {
    var content = this.template({board: this.model});
    this.$el.html(content);

    return this;
  },

  addCardModal: function (event) {
    event.preventDefault();
    var id = event.currentTarget.dataset.id;
    var that = this;
    var board = Pinless.boards.getOrFetch(id, function (data) {
      var view = new Pinless.Views.CardAdd({model: data});
      Pinless.router.$overlayContent.html(view.render().$el);
      $(".overlay").addClass('overlay-show');
    });
  },
});