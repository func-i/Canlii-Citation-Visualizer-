# D3 Tree 

# Copyright 2013 Peter Cook (@prcweb); Licensed MIT

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
    @citingTo      = args.citing_to if args.citing_to
    # if branch
    @citingToId    = args.citingToId if args.citingToId
    @citedTo       = args.cited_by if args.cited_by

$ ->
  rawBaseKase = $('#chart').data('base-kase')
  baseKase = new Kase(rawBaseKase)
  console.log baseKase

branches = []

seed =
  i: 0
  x: 420
  y: 600
  a: 0   # a = angle
  l: 60  # l = length
  d: 0   # d = depth

da = 0.5 # Angle delta
dl = 1.1 # Length delta (factor)
ar = 0.7 # Randomness
maxDepth = 5

# Tree creation functions
branch = (b) ->
  end = endPt(b)
  branches.push b
  return if b.d is maxDepth
  
  # Left branch
  daR = ar * Math.random() - ar * 0.5
  newB =
    i: branches.length
    x: end.x
    y: end.y
    a: b.a - da + daR
    l: b.l * dl
    d: b.d + 1
    parent: b.i

  branch newB
  
  # Right branch
  daR = ar * Math.random() - ar * 0.5
  newB =
    i: branches.length
    x: end.x
    y: end.y
    a: b.a + da + daR
    l: b.l * dl
    d: b.d + 1
    parent: b.i

  branch newB

regenerate = (initialise) ->
  branches = []
  branch seed
  if initialise then create() else update()

endPt = (b) ->
  # Return endpoint of branch
  x = b.x + b.l * Math.sin(b.a)
  y = b.y - b.l * Math.cos(b.a)
  { x: x, y: y }

# D3 functions
x1 = (d) ->
  d.x
y1 = (d) ->
  d.y
x2 = (d) ->
  endPt(d).x
y2 = (d) ->
  endPt(d).y

highlightParents = (d) ->
  colour = (if d3.event.type is "mouseover" then "green" else "#777")
  depth = d.d
  
  i = 0
  while i <= depth
    d3.select("#id-" + parseInt(d.i)).style "stroke", colour
    d = branches[d.parent]
    i++

create = ->
  d3.select("svg")
  .selectAll("line")
  .data(branches)
  .enter()
  .append("line")
  .attr("x1", x1)
  .attr("y1", y1)
  .attr("x2", x2)
  .attr("y2", y2)
  .style "stroke-width", (d) ->
    parseInt(maxDepth + 1 - d.d) + "px"
  .attr("id", (d) ->
    "id-" + d.i
  ).on("mouseover", highlightParents).on "mouseout", highlightParents

update = ->
  d3.select("svg")
  .selectAll("line")
  .data(branches)
  .transition()
  .attr "x1", x1
  .attr "y1", y1
  .attr "x2", x2
  .attr "y2", y2

d3.selectAll(".regenerate").on "click", regenerate

regenerate true