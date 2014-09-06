Util = {};

Util.addBoardModal = function () {
  var view = new Pinless.Views.BoardAdd();
  Pinless.router.$overlayContent.html(view.render().$el);
  $(".overlay").addClass('overlay-show');
  $(".overlay-content").addClass('overlay-content-show');
  $('.overlay-content').height(400);
};

Util.hideModal = function () {
  $('.card-modal').removeClass('card-modal-show');
  $('.overlay-content').removeClass('overlay-content-show');
  $(".overlay").removeClass('overlay-show');
};