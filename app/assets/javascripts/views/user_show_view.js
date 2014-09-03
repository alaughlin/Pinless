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
        $('.friend-btn').html("Pending Request");
        $('.friend-btn').removeClass('friend-button');
        $('.friend-btn').addClass('pending-friend-button');
      }
    });
  },

  deleteFriend: function (event) {
    var friendId = event.currentTarget.dataset.id;

    $.ajax({
      url: '/api/friendships/' + friendId,
      type: 'DELETE',
      data: {
        friend_id: friendId
      },
      success: function (data) {
        $('.friend-btn').html("Add As Friend");
        $('.friend-btn').removeClass('unfriend-button');
        $('.friend-btn').addClass('friend-button');
      }

    });
  }
});