Pinless.Collections.Users = Backbone.Collection.extend({
  url: "/api/users",
  model: Pinless.Models.User,

  initialize: function () {
    this.boards = new Pinless.Collections.Boards();
    this.boards.url = '/api/users/' + this.id + '/boards';
    this.boards.on("reset", this.updateCounts);
  },

  getOrFetch: function (id, cb) {
    var user = new Pinless.Models.User({id: id});

    if (Pinless.users.get(user)) {
      cb(Pinless.users.get(user));
    } else {
      user.fetch({
        success: function (data) {
          cb(data);
        }
      });
    }

    return user;
  }
});