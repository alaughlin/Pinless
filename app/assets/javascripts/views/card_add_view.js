Pinless.Views.CardAdd = Backbone.View.extend({
  template: JST['cards/add'],

  tagName: 'section',

  className: 'add-card-modal modal-stuff',

  events: {
    'click .form-selector':     'showForm',
    'click .get-url':           'getURL',
    'submit .add-card-form':    'addCard',
    'change #image-file-input': 'fileSelect'
  },

  initialize: function () {
    this.newModel = new Pinless.Models.Card();
  },

  render: function () {
    var content = this.template({board: this.model});
    this.$el.html(content);

    return this;
  },

  showForm: function () {
    console.log(event.target);
    $form = $('.' + event.target.dataset.id);
    $('.overlay-form').hide();
    $form.show();
  },

  getURL: function () {
    var url = $('.url').val();

    $.ajax({
      url: '/api/url_extractor',
      type: 'GET',
      data: {
        url: url
      },
      success: function (data) {
        $('.title').val(data["title"]);
        $('.description').html(data["description"]);
        $('.preview-image').attr('src', data['image']);
      }
    });
  },

  addCard: function (event) {
    event.preventDefault();

    var that = this;
    var formData = $(event.currentTarget).serializeJSON();

    this.newModel.save(formData.card, {
      wait: true,

      success: function (data) {
        console.log(data);
        that.model.childCards.add(that.newModel);
        Util.hideModal();
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