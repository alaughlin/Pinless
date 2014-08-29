Pinless.Collections.Boards = Backbone.Collection.extend({
  url: "/api/boards",
  model: Pinless.Models.Board,

  getOrFetch: function (id, cb) {
    var board = new Pinless.Models.Board({id: id});

    if (Pinless.boards.get(board)) {
      cb(Pinless.boards.get(board));
    } else {
      board.fetch({
        success: function (data) {
          Pinless.boards.add(data)
          cb(data);
        }
      });
    }

    return board;
  }
});
