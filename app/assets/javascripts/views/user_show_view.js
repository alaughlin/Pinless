Pinless.Views.UserShow = Backbone.View.extend({
  template: JST['users/show'],

  tagName: 'section',

  className: 'user-info',

  events: {
    'click .friend-button': 'addFriend',
    'click .unfriend-button': 'deleteFriend'
  },

  initialize: function (user) {
    this.requestedFriendYet = false;
    this.checkForRequest(this.model.escape('id'));
  },

  render: function () {
    var content = this.template({user: this.model, requestedFriendYet: this.requestedFriendYet});
    this.$el.html(content);

    return this;
  },

  checkForRequest: function (id) {
    var that = this;

    $.ajax({
      url: '/api/checkforrequest/' + id,
      type: 'GET',
      success: function (data) {
        that.requestedFriendYet = data;
        that.render();
      }
    })
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
        $('.friend-button').addClass('pending-friend-button');
      }

    });
  },

  deleteFriend: function (event) {
    var userId = Pinless.currentUser.escape('id');
    var friendId = event.currentTarget.dataset.id;

    $.ajax({
      url: '/api/friendships',
      type: 'DELETE',
      data: {
        friendship: {
          user_id: userId,
          friend_id: friendId
        }
      },
      success: function (data) {
        $('.friend-button').html("Pending Request");
        $('.friend-button').addClass('pending-friend-button');
      }

    });
  }
});