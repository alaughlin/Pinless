Pinless.Views.EditProfile = Backbone.View.extend({
  template: JST['edit'],

  events: {
    'submit .edit-profile-form': 'editProfile',
    'change #edit-image-file-input': 'fileSelect'
  },

  render: function () {
    var content = this.template({user: this.model});
    this.$el.html(content);

    return this;
  },

  editProfile: function (event) {
    event.preventDefault();
    console.log(this.model);

    var that = this;
    var formData = $(event.currentTarget).serializeJSON();

    this.model.save(formData.user, {
      wait: true,

      patch: true,

      success: function (user) {
        that.model.set({avatar_thumb: user.escape('avatar_thumb')});
        that.model.set({avatar_large: user.escape('avatar_large')});
        $('.header-avatar').attr('src', user.escape('avatar_thumb'));
        console.log(that.model);
      },
    });
  },

  fileSelect: function (event) {
    var that = this;
    var imageFile = event.currentTarget.files[0];
    var reader = new FileReader();

    reader.onloadend = function () {
      that.model.set("avatar", this.result);
      that._updatePreview(this.result);
    }

    if(imageFile){
      reader.readAsDataURL(imageFile);
    } else {
      this._updatePreview("");
    }
  },

  _updatePreview: function(imageData){
    this.$el.find("#post-image-preview").attr("src", imageData);
    this.$el.find(".preview-label").html("New Avatar");
  }
});