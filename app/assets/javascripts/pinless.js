window.Pinless = {
  Models: {},
  Collections: {},
  Views: {},
  Routers: {},
  initialize: function () {
    // need these set immediately
    Pinless.userId = window.currentUserId;
    Pinless.heart = window.heart;
    Pinless.close = window.close;

    Pinless.users = new Pinless.Collections.Users();
    Pinless.boards = new Pinless.Collections.Boards();
    Pinless.cards = new Pinless.Collections.Cards();
    Pinless.users.getOrFetch(Pinless.userId, function (user) {
      Pinless.currentUser = user;
      Pinless.currentUser.cards_liked.fetch();
      Pinless.currentUser.boards_liked.fetch();
      Pinless.router = new Pinless.Routers.Router({$el: $("#content")});
      Backbone.history.start();
    });
  },
};

$(document).ready(function () {
  Pinless.initialize();

  // don't know where else to put these for now
  $('.overlay').on('click', '.close-modal-link', function (event) {
    event.preventDefault();
    Util.hideModal();
  });

  $('.search-form').on('submit', function (event) { 
    event.preventDefault();
    var model = $('.search-model').val();
    var terms = $('.search-box').val();
    Pinless.router.navigate("#/search?m=" + model + "&q=" + terms, {trigger: true});
  });

  $('html').keyup(function(event){
    if (event.keyCode == 27) Pinless.router.hideModal();
  });

  // hah
  Mousetrap.bind('command+shift+k', function (event) {
    $('body').toggleClass("comic");
  });

  $('.header-add-board').on('click', function (event) {
    event.preventDefault();
    Util.addBoardModal();
  });
});