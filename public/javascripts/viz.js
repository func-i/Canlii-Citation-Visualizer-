(function() {
  this.Kase = (function() {
    function Kase(args) {
      this.id = args.id;
      this.title = args.title;
      this.href = args.href;
      this.date = args.id;
      this.dbId = args.dbId;
      if (args.depth) {
        this.depth = args.depth;
      }
      if (args.citedById) {
        this.citedById = args.citedById;
      }
      if (args.citing_to) {
        this.citingTo = args.citing_to;
      }
      if (args.citingToId) {
        this.citingToId = args.citingToId;
      }
      if (args.cited_by) {
        this.citedTo = args.cited_by;
      }
    }

    return Kase;

  })();

  $(function() {
    var baseKase, rawBaseKase, trunk;
    trunk = {
      width: 50,
      height: 150,
      x: function() {
        return ($('svg').width() / 2) - (this.width / 2);
      },
      y: function() {
        return ($('svg').height()) - this.height;
      }
    };
    rawBaseKase = $('#chart').data('base-kase');
    baseKase = new Kase(rawBaseKase);
    console.log(baseKase);
    return d3.select("svg").append("rect").attr("x", trunk.x()).attr("y", trunk.y()).attr("width", trunk.width).attr("height", trunk.height);
  });

}).call(this);
