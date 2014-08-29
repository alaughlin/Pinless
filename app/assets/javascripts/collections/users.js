Pinless.Collections.Users = Backbone.Collection.extend({
  url: "/api/users",
  model: Pinless.Models.User,

  getOrFetch: function (id, cb) {
    var user = new Pinless.Models.User({id: id});

    if (Pinless.users.get(user)) {
      cb(Pinless.users.get(user));
    } else {
      user.fetch({
        success: function (data) {
          Pinless.users.add(data);
          cb(data);
        }
      });
    }

    return user;
  }
});