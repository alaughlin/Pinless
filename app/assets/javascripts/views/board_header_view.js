Pinless.Views.BoardHeader = Backbone.View.extend({
  template: JST['boards/header'],

  tagName: 'section',

  className: 'board-info',

  initialize: function (data) {
    this.listenTo(Pinless.boards, 'sync add remove reset', this.render);
  },

  events: {
    'click .add-card-link':       'addCardModal',
    'click .board-like-button':   'boardLikeAction',
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

  boardLikeAction: function (event) {
    var boardId = event.currentTarget.dataset.id;
    var $button = $(event.currentTarget);

    $.ajax({
      url: '/api/board_likes',
      type: 'POST',
      data: {
        board_id: boardId
      },
      success: function (data) {
        if (data.action === "created") {
          $button.html("Unlike This Board");
        } else {
          $button.html("Like This Board");
        }
      }
    });
  }
});