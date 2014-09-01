Pinless.Views.UserShow = Backbone.View.extend({
  template: JST['users/show'],

  tagName: 'section',

  className: 'user-info',

  events: {
    'click .user-nav-link': 'setBackground'
  },

  initialize: function (user) {
    console.log(user);
  },

  render: function () {
    var content = this.template({user: this.model});
    this.$el.html(content);

    return this;
  },

  setBackground: function (event) {
    $('.user-nav-link').removeClass('user-links-selected');
    $(event.currentTarget).addClass('user-links-selected');
  }
});