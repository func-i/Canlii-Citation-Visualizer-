# D3 Tree

# Copyright 2013 Peter Cook (@prcweb); Licensed MIT

hardcoded = {"id":"2011scc47","dbId":"csc-scc","title":"Crookes v. Newton","href":"http://canlii.ca/t/fngpv","date":"2011-10-19","cited_by":[{"title":"Carter v. B.C. Federation of Foster Parents Assn.","id":"2005bcca398","dbId":"bcca","href":"http://canlii.ca/t/1l9lv","date":"2005-08-03"},{"title":"Crookes v. Newton","id":"2009bcca392","dbId":"bcca","href":"http://canlii.ca/t/25md2","date":"2009-09-15"},{"title":"Crookes v. Wikimedia Foundation Inc.","id":"2008bcsc1424","dbId":"bcsc","href":"http://canlii.ca/t/21b1z","date":"2008-10-27"},{"title":"Smith v. Matsqui (Dist.)","id":"1986canlii1117","dbId":"bcsc","href":"http://canlii.ca/t/216lx","date":"1986-07-17"},{"title":"Stanley v. Shaw and Tracey","id":"2006bcca467","dbId":"bcca","href":"http://canlii.ca/t/1pvw7","date":"2006-10-13"}],"citing_to":[{"title":"Kent v. Postmedia Network Inc.","id":"2012abqb559","dbId":"abqb","href":"http://canlii.ca/t/fsr1w","date":"2012-09-14"},{"title":"Laforest c. Collins","id":"2012qccs3078","dbId":"qccs","href":"http://canlii.ca/t/frz8g","date":"2012-06-28"},{"title":"Nazerali v. Mitchell","id":"2012bcsc205","dbId":"bcsc","href":"http://canlii.ca/t/fq19t","date":"2012-02-09"},{"title":"R. v. Smith","id":"2012onca892","dbId":"onca","href":"http://canlii.ca/t/fv9jn","date":"2012-12-18"},{"title":"Chayer c. Vaillancourt","id":"2012qccq1354","dbId":"qccq","href":"http://canlii.ca/t/fqdmc","date":"2012-02-13"}]}

class @Kase
  constructor: (args) ->
    @id            = args.id
    @title         = args.title
    @href          = args.href
    @date          = args.id
    @dbId          = args.dbId
    @depth         = args.depth if args.depth
    # if root
    @citedById     = args.citedById if args.citedById
    @citingToKases = args.citing_to if args.citing_to
    # if branch
    @citingToId    = args.citingToId if args.citingToId
    @citedToKases  = args.cited_by if args.cited_by

$ ->
  $('#scc').chosen
    width: '50%',

  trunk =
    width: 50
    height: 150
    x: -> ($('svg').width() / 2) - (@width / 2)
    y: -> ($('svg').height()) - (@height)

  # rawBaseKase = $('#chart').data('base-kase')
  # baseKase = new Kase(rawBaseKase)
  baseKase = new Kase(hardcoded)
  console.log baseKase

  d3Svg = d3.select("svg")

  d3Svg.append("rect")
  .attr("x", trunk.x())
  .attr("y", trunk.y())
  .attr("width", trunk.width)
  .attr("height", trunk.height)

  # for kase in baseKase.citingToKases
  #   d3Svg.append("circle")
  #   .attr("cx", 30)
  #   .attr("cy", 30)
  #   .attr("r", 30)

# seed =
#   i: 0
#   x: $('svg').width() / 2
#   y: $('svg').height()
#   a: 0   # a = angle
#   l: 80  # l = length
#   d: 0   # d = depth

# da = 0.5 # Angle delta
# dl = 1.1 # Length delta (factor)
# ar = 0.7 # Randomness

# maxDepth = 5

# branches = []

# # Tree creation functions
# branch = (b) ->
#   end = endPt(b)
#   branches.push b
#   return if b.d is maxDepth

#   # Left branch
#   daR = ar * Math.random() - ar * 0.5
#   newB =
#     i: branches.length
#     x: end.x
#     y: end.y
#     a: b.a - da + daR
#     l: b.l * dl
#     d: b.d + 1
#     parent: b.i

#   branch newB

#   # Right branch
#   daR = ar * Math.random() - ar * 0.5
#   newB =
#     i: branches.length
#     x: end.x
#     y: end.y
#     a: b.a + da + daR
#     l: b.l * dl
#     d: b.d + 1
#     parent: b.i

#   branch newB

# regenerate = (initialiseBool) ->
#   branches = []
#   branch seed
#   if initialiseBool then create() else update()

# endPt = (b) ->
#   # Return endpoint of branch
#   x = b.x + b.l * Math.sin(b.a)
#   y = b.y - b.l * Math.cos(b.a)
#   { x: x, y: y }

# # D3 functions
# x1 = (d) ->
#   d.x
# y1 = (d) ->
#   d.y
# x2 = (d) ->
#   endPt(d).x
# y2 = (d) ->
#   endPt(d).y

# highlightParents = (d) ->
#   colour = (if d3.event.type is "mouseover" then "green" else "#777")
#   depth = d.d

#   i = 0
#   while i <= depth
#     d3.select("#id-" + parseInt(d.i)).style "stroke", colour
#     d = branches[d.parent]
#     i++

# create = ->
#   d3.select("svg")
#   .selectAll("line")
#   .data(branches)
#   .enter()
#   .append("line")
#   .attr("x1", x1)
#   .attr("y1", y1)
#   .attr("x2", x2)
#   .attr("y2", y2)
#   .style "stroke-width", (d) ->
#     parseInt(maxDepth + 3 - d.d) + "px"
#   .attr("id", (d) ->
#     "id-" + d.i
#   ).on("mouseover", highlightParents).on "mouseout", highlightParents

# update = ->
#   d3.select("svg")
#   .selectAll("line")
#   .data(branches)
#   .transition()
#   .attr "x1", x1
#   .attr "y1", y1
#   .attr "x2", x2
#   .attr "y2", y2

# d3.selectAll(".regenerate").on "click", regenerate

# regenerate true