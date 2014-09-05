Pinless.Views.BoardAdd = Backbone.View.extend({
  template: JST['boards/add'],

  tagName: 'section',

  className: 'add-board-modal modal-stuff',

  events: {
    'submit .add-board-form': 'addBoard',
    'change #image-file-input': 'fileSelect'
  },

  initialize: function () {
    this.newModel = new Pinless.Models.Board();
  },

  render: function () {
    var content = this.template();
    this.$el.html(content);

    return this;
  },

  addBoard: function (event) {
    console.log('hi');
    event.preventDefault();

    var that = this;
    var formData = $(event.currentTarget).serializeJSON();

    this.newModel.save(formData.board, {
      wait: true,

      success: function (data) {
        Pinless.boards.add(data);
        Pinless.router.hideModal();
        that.newModel.childCards.url = '/api/boards/' + data.escape('id') + '/cards';
        Pinless.router.navigate("#/boards/" + data.escape('id'), {trigger: true});
      }
    });
  },

  fileSelect: function (event) {
    var that = this;
    var imageFile = event.currentTarget.files[0];
    var reader = new FileReader();

    reader.onloadend = function () {
      that.newModel.set("avatar", this.result);
    }

    if(imageFile){
      reader.readAsDataURL(imageFile);
    } else {
      this._updatePreview("");
    }
  }
});