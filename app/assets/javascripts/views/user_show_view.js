Pinless.Views.UserShow = Backbone.View.extend({
  template: JST['users/show'],

  tagName: 'section',

  className: 'user-info',

  events: {
    'click .friend-button': 'addFriend',
    'click .unfriend-button': 'deleteFriend'
  },

  initialize: function (user) {},

  render: function () {
    var content = this.template({user: this.model});
    this.$el.html(content);

    return this;
  },

  addFriend: function (event) {
    var userId = Pinless.currentUser.escape('id');
    var friendId = event.currentTarget.dataset.id;

    $.ajax({
      url: '/api/friendships',
      type: 'POST',
      data: {
        friendship: {
          user_id: userId,
          friend_id: friendId
        }
      },
      success: function (data) {
        $('.friend-button').html("Pending Request");
        $('.friend-button').addClass('pending-request');
      }

    });

  },

  deleteFriend: function (event) {
    console.log(event);
  }
});