Pinless.Views.UsersIndex = Backbone.View.extend({
  template: JST['users/index'],

  initialize: function () {
    this.users = this.collection;
  },

  el: "<ul>",

  className: "users-list group",

  render: function () {
    var that = this;

    this.users.models.forEach(function (user) {
      var view = new Pinless.Views.User({model: user});
      that.$el.append(view.render().$el);
    });

    return this;
  }
});