Pinless.Views.Error = Backbone.View.extend({
  template: JST['error'],

  initialize: function (options) {
    this.message = options['message'];
  },

  render: function () {
    var content = this.template({message: this.message});
    this.$el.html(content);

    return this;
  }
});