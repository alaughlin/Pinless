Pinless.Views.UserShow = Backbone.View.extend({
  template: JST['users/show'],

  tagName: 'section',

  className: 'user-info',

  events: {
    'click .friend-button': 'addFriend',
    'click .unfriend-button': 'deleteFriend'
  },

  initialize: function () {
    console.log(this.model);
    this.listenTo(this.model, 'sync change reset', this.render)
  },

  render: function () {
    var content = this.template({user: this.model});
    this.$el.html(content);

    return this;
  },

  addFriend: function (event) {
    var that = this;
    var userId = Pinless.currentUser.escape('id');
    var friendId = event.currentTarget.dataset.id;

    $.ajax({
      url: '/api/friendships',
      type: 'POST',
      data: {
        friendship: {
          friend_id: friendId
        }
      },
      success: function (data) {
        that.model.set('friendship_status', 'pending');
      }
    });
  },

  deleteFriend: function (event) {
    var friendId = event.currentTarget.dataset.id;

    $.ajax({
      url: '/api/friendships/',
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