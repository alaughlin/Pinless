Pinless.Views.CardShow = Backbone.View.extend({
  template: JST['cards/show'],

  tagName: "li",

  className: "card content-list-item",

  events: {
    'click .card-image': 'cardModal'
  },

  initialize: function () {
    this.listenTo(this.model, 'all', this.render);
  },

  render: function () {
    var content = this.template({card: this.model});
    this.$el.html(content);

    return this;
  },

  cardModal: function (event) {
    var view = new Pinless.Views.CardModal({model: this.model});
    Pinless.router.$cardModal.html(view.render().$el);
    $('.overlay').addClass('overlay-show');
    $('.card-modal').addClass('card-modal-show');
    $('.card-modal').css("left", function (){
      return ($(".overlay").width() - $(this).width()) / 2;
    });
    // $('body').addClass('stop-scrolling');
  }
});