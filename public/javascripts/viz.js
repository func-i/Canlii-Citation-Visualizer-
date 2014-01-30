(function() {
  var ar, branch, branches, citedByKase, citedByKaseArgs, citingToKase, citingToKaseArgs, create, da, dl, endPt, highlightParents, i, kase, kaseArgs, maxDepth, regenerate, seed, update, x1, x2, y1, y2, _i;

  this.Kase = (function() {
    function Kase(args) {
      this.id = args.id;
      this.title = args.title;
      this.href = args.href;
      this.date = args.id;
      this.dbId = args.dbId;
      if (args.citedById) {
        this.citedById = args.citedById;
      }
      if (args.citingToKases) {
        this.citingToKases = args.citingToKases;
      }
      if (args.citingToId) {
        this.citingToId = args.citingToId;
      }
      if (args.citedByKases) {
        this.citedByKases = args.citedByKases;
      }
    }

    return Kase;

  })();

  kaseArgs = {
    id: "2938457",
    title: "base kase",
    href: "http://google.com",
    date: "24-1-2013",
    dbId: "fhfh2012fjfj",
    citingToKases: [],
    citedByKases: []
  };

  for (i = _i = 0; _i <= 4; i = ++_i) {
    citedByKaseArgs = {
      id: "citedByKase id #" + i,
      title: "citedByKase id #" + i,
      href: "http://google.com",
      date: "21-11-1987",
      dbId: "citedByKase dbId #" + i
    };
    citedByKase = new Kase(citedByKaseArgs);
    kaseArgs.citedByKases.push(citedByKase);
    citingToKaseArgs = {
      id: "citingToKase id #" + (i + 5),
      title: "citingToKase id #" + (i + 5),
      href: "http://google.com",
      date: "21-11-1987",
      dbId: "citingToKase dbId #" + (i + 5)
    };
    citingToKase = new Kase(citingToKaseArgs);
    kaseArgs.citingToKases.push(citingToKase);
  }

  kase = new Kase(kaseArgs);

  console.log(kase);

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
    var colour, depth, _results;
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
    return d3.select("svg").selectAll("line").data(branches).transition().attr("x1", x1.attr("y1", y1.attr("x2", x2.attr("y2", y2))));
  };

  d3.selectAll(".regenerate").on("click", regenerate);

  regenerate(true);

}).call(this);
