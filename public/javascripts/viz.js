(function() {
  var hardcoded;

  hardcoded = {
    "id": "2011scc47",
    "dbId": "csc-scc",
    "title": "Crookes v. Newton",
    "href": "http://canlii.ca/t/fngpv",
    "date": "2011-10-19",
    "cited_by": [
      {
        "title": "Carter v. B.C. Federation of Foster Parents Assn.",
        "id": "2005bcca398",
        "dbId": "bcca",
        "href": "http://canlii.ca/t/1l9lv",
        "date": "2005-08-03"
      }, {
        "title": "Crookes v. Newton",
        "id": "2009bcca392",
        "dbId": "bcca",
        "href": "http://canlii.ca/t/25md2",
        "date": "2009-09-15"
      }, {
        "title": "Crookes v. Wikimedia Foundation Inc.",
        "id": "2008bcsc1424",
        "dbId": "bcsc",
        "href": "http://canlii.ca/t/21b1z",
        "date": "2008-10-27"
      }, {
        "title": "Smith v. Matsqui (Dist.)",
        "id": "1986canlii1117",
        "dbId": "bcsc",
        "href": "http://canlii.ca/t/216lx",
        "date": "1986-07-17"
      }, {
        "title": "Stanley v. Shaw and Tracey",
        "id": "2006bcca467",
        "dbId": "bcca",
        "href": "http://canlii.ca/t/1pvw7",
        "date": "2006-10-13"
      }
    ],
    "citing_to": [
      {
        "title": "Kent v. Postmedia Network Inc.",
        "id": "2012abqb559",
        "dbId": "abqb",
        "href": "http://canlii.ca/t/fsr1w",
        "date": "2012-09-14"
      }, {
        "title": "Laforest c. Collins",
        "id": "2012qccs3078",
        "dbId": "qccs",
        "href": "http://canlii.ca/t/frz8g",
        "date": "2012-06-28"
      }, {
        "title": "Nazerali v. Mitchell",
        "id": "2012bcsc205",
        "dbId": "bcsc",
        "href": "http://canlii.ca/t/fq19t",
        "date": "2012-02-09"
      }, {
        "title": "R. v. Smith",
        "id": "2012onca892",
        "dbId": "onca",
        "href": "http://canlii.ca/t/fv9jn",
        "date": "2012-12-18"
      }, {
        "title": "Chayer c. Vaillancourt",
        "id": "2012qccq1354",
        "dbId": "qccq",
        "href": "http://canlii.ca/t/fqdmc",
        "date": "2012-02-13"
      }
    ]
  };

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
        this.citingToKases = args.citing_to;
      }
      if (args.citingToId) {
        this.citingToId = args.citingToId;
      }
      if (args.cited_by) {
        this.citedToKases = args.cited_by;
      }
    }

    return Kase;

  })();

  $(function() {
    var baseKase, d3Svg, trunk;
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
    baseKase = new Kase(hardcoded);
    console.log(baseKase);
    d3Svg = d3.select("svg");
    return d3Svg.append("rect").attr("x", trunk.x()).attr("y", trunk.y()).attr("width", trunk.width).attr("height", trunk.height);
  });

}).call(this);
