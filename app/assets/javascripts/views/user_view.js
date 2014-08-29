Pinless.Views.User = Backbone.View.extend({
  template: JST['users/user'],

  initialize: function () {},

  render: function () {
    var content = this.template({user: this.model});
    this.$el.html(content);

    return this;
  }
});