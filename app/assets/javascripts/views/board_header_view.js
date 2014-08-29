Pinless.Views.BoardHeader = Backbone.View.extend({
  template: JST['boards/header'],

  initialize: function () {
    console.log(this.model)
  },

  events: {
    'click .add-card-link': 'addCardModal'
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
      console.log(data.id);
      var view = new Pinless.Views.CardAdd({model: data});
      Pinless.router.$overlayContent.html(view.render().$el);
      $(".overlay").addClass('overlay-show');
    });
  },
});