(function() {
  var ar, branch, branches, create, da, dl, endPt, highlightParents, maxDepth, regenerate, seed, update, x1, x2, y1, y2;

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
    var baseKase, rawBaseKase;
    rawBaseKase = $('#chart').data('base-kase');
    baseKase = new Kase(rawBaseKase);
    return console.log(baseKase);
  });

  branches = [];

  seed = {
    i: 0,
    x: 420,
    y: 600,
    a: 0,
    l: 60,
    d: 0
  };

  da = 0.5;

  dl = 1.1;

  ar = 0.7;

  maxDepth = 5;

  branch = function(b) {
    var daR, end, newB;
    end = endPt(b);
    branches.push(b);
    if (b.d === maxDepth) {
      return;
    }
    daR = ar * Math.random() - ar * 0.5;
    newB = {
      i: branches.length,
      x: end.x,
      y: end.y,
      a: b.a - da + daR,
      l: b.l * dl,
      d: b.d + 1,
      parent: b.i
    };
    branch(newB);
    daR = ar * Math.random() - ar * 0.5;
    newB = {
      i: branches.length,
      x: end.x,
      y: end.y,
      a: b.a + da + daR,
      l: b.l * dl,
      d: b.d + 1,
      parent: b.i
    };
    return branch(newB);
  };

  regenerate = function(initialise) {
    branches = [];
    branch(seed);
    if (initialise) {
      return create();
    } else {
      return update();
    }
  };

  endPt = function(b) {
    var x, y;
    x = b.x + b.l * Math.sin(b.a);
    y = b.y - b.l * Math.cos(b.a);
    return {
      x: x,
      y: y
    };
  };

  x1 = function(d) {
    return d.x;
  };

  y1 = function(d) {
    return d.y;
  };

  x2 = function(d) {
    return endPt(d).x;
  };

  y2 = function(d) {
    return endPt(d).y;
  };

  highlightParents = function(d) {
    var colour, depth, i, _results;
    colour = (d3.event.type === "mouseover" ? "green" : "#777");
    depth = d.d;
    i = 0;
    _results = [];
    while (i <= depth) {
      d3.select("#id-" + parseInt(d.i)).style("stroke", colour);
      d = branches[d.parent];
      _results.push(i++);
    }
    return _results;
  };

  create = function() {
    return d3.select("svg").selectAll("line").data(branches).enter().append("line").attr("x1", x1).attr("y1", y1).attr("x2", x2).attr("y2", y2).style("stroke-width", function(d) {
      return parseInt(maxDepth + 1 - d.d) + "px";
    }).attr("id", function(d) {
      return "id-" + d.i;
    }).on("mouseover", highlightParents).on("mouseout", highlightParents);
  };

  update = function() {
    return d3.select("svg").selectAll("line").data(branches).transition().attr("x1", x1).attr("y1", y1).attr("x2", x2).attr("y2", y2);
  };

  d3.selectAll(".regenerate").on("click", regenerate);

  regenerate(true);

}).call(this);
