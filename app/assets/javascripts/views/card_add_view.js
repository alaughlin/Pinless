Pinless.Views.CardAdd = Backbone.View.extend({
  template: JST['cards/add'],

  events: {
    'submit .add-card-form': 'addCard',
    'change #image-file-input': 'fileSelect'
  },

  initialize: function () {
    console.log(this.model.id);
    this.newModel = new Pinless.Models.Card();
  },

  render: function () {
    var content = this.template({board: this.model});
    this.$el.html(content);

    return this;
  },

  addCard: function (event) {
    event.preventDefault();

    var that = this;
    var formData = $(event.currentTarget).serializeJSON();

    this.newModel.save(formData.card, {
      wait: true,

      success: function (data) {
        that.model.cards().add(data);
        Pinless.router.hideModal();
      }
    });
  },

  fileSelect: function (event) {
    var that = this;
    var imageFile = event.currentTarget.files[0];
    var reader = new FileReader();

    reader.onloadend = function () {
      that.newModel.set("image", this.result);
    }

    if(imageFile){
      reader.readAsDataURL(imageFile);
    } else {
      this._updatePreview("");
    }
  }
});