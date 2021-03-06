Pinless.Views.FriendRequests = Backbone.View.extend({
  template: JST['users/request'],

  initialize: function () {
    this.requests = this.collection;
  },

  tagName: "ul",

  className: "cols group",

  events: {
    'click .accept-request-button': 'acceptRequest',
    'click .deny-request-button': 'denyRequest'
  },

  render: function () {
    var that = this;
    this.$el.empty();

    var $col1 = $("<ul class='col1'>");
    var $col2 = $("<ul class='col2'>");
    var $col3 = $("<ul class='col3'>");
    var $col4 = $("<ul class='col4'>");
    var $col5 = $("<ul class='col5'>");
    var counter = 1;

    this.requests.forEach(function (request) {
      if (counter > 5) {
        counter = 1;
      }

      switch(counter) {
        case 1:
          var col = $col1
          break;
        case 2:
          var col = $col2
          break;s
        case 3:
          var col = $col3
          break;
        case 4:
          var col = $col4
          break;
        case 5:
          var col = $col5
          break;
      }

      content = that.template({request: request});
      col.append(content);

      counter++;
    });

    this.$el.append($col1);
    this.$el.append($col2);
    this.$el.append($col3);
    this.$el.append($col4);
    this.$el.append($col5);

    return this;
  },

  acceptRequest: function (event) {
    var that = this;
    var friendId = event.currentTarget.dataset.id;
    var $card = $('.card-' + parseInt(friendId));

    $.ajax({
      url: '/api/friendships',
      type: 'POST',
      data: {
        friendship: {
          friend_id: friendId
        }
      },
      success: function (friend) {
        Pinless.currentUser.friends.add(friend);
        $card.remove();
        that.changeNotificationCount();
      }
    });
  },

  denyRequest: function (event) {
    var that = this;
    var friendId = event.currentTarget.dataset.id;
    var $card = $('.card-' + parseInt(friendId));

    $.ajax({
      url: '/api/friendships/requests',
      type: 'DELETE',
      data: {
        friendship: {
          friend_id: friendId
        }
      },
      success: function (friend) {
        $card.remove();
        that.changeNotificationCount();
      }
    });
  },

  changeNotificationCount: function () {
    var $badge = $('.badge');
    var $friendRequestLi = $('.friend-request-li');
    var notificationCount = parseInt($badge.html());

    notificationCount--;
    $badge.html(notificationCount);

    if (notificationCount < 1) {
      $badge.hide();
      $friendRequestLi.hide();
    }
  }
});