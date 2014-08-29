Pinless.Views.CardAdd = Backbone.View.extend({
  template: JST['cards/add'],

  events: {
    'submit .add-card-form': 'addCard'
  },

  initialize: function () {},

  render: function () {
    var content = this.template({board: this.model});
    this.$el.html(content);

    return this;
  },

  addCard: function (event) {
    event.preventDefault();
    console.log("caught!");

    var that = this;

    var formData = $(event.currentTarget).serializeJSON();

    console.log(formData);
  }
});