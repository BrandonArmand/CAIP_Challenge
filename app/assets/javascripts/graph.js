function drawGraph(data) {
    var svg = d3.select("#graph"),
        margin = {
            top: 40,
            right: 40,
            bottom: 70,
            left: 40
        },
        width = +svg.attr("width") - margin.left - margin.right,
        height = +svg.attr("height") - margin.top - margin.bottom,
        g = svg.append("g").attr("transform", "translate(" + margin.left + "," + margin.top + ")");

    var x = d3.scaleBand()
        .rangeRound([10, width])
        .paddingInner(0.60)
        .align(1);

    var y = d3.scaleLinear()
        .rangeRound([height, 0]);

    var z = d3.scaleOrdinal()
        .range(["#64AEFF", "#AED5FF"]);

    // fix pre-processing
    var keys = [];
    for (key in data[0]) {
        if (key == 'likeCount' || key == 'viewCount')
            keys.push(key);
    }
    data.forEach(function (d) {
        d.total = 0;
        keys.forEach(function (k) {
            d.total += Number(d[k]);
        })
    });

    //Un-sorted fits the data easier for this graph
    //Also un-sorted because the example is un-sorted

    // data.sort(function(a, b) {
    //   return b.total - a.total;
    // });

    x.domain(data.map(function (d) {
        return d.title;
    }));
    y.domain([0, d3.max(data, function (d) {
        return d.total;
    })]).nice();
    z.domain(keys);

    var div = d3.select("body").append("div")
        .attr("class", "tooltip")
        .style("opacity", 0);


    g.append("g")
        .attr("class", "axis")
        .call(d3.axisRight(y)
            .ticks(null, "s")
            .tickSize(width))
        .call(g => g.selectAll(".tick:not(:first-of-type) line")
            .attr("stroke-opacity", 0.2))
        .call(g => g.selectAll(".tick text")
            .attr("x", -10)
            .attr("dy", 0)
            .attr("text-anchor", "end"))


    g.append("g")
        .selectAll("g")
        .data(d3.stack().keys(keys)(data))
        .enter().append("g")
        .attr("fill", function (d) {
            return z(d.key);
        })
        .selectAll("rect")
        .data(function (d) {
            return d;
        })
        .enter().append("rect")
        .attr("x", function (d) {
            return x(d.data.title);
        })
        .attr("y", function (d) {
            return y(d[1]);
        })
        .attr("height", function (d) {
            return y(d[0]) - y(d[1]);
        })
        .attr("width", x.bandwidth())
        .on("mouseover", function (d) {
            div.transition()
                .duration(200)
                .style("opacity", .9);
            div.html(
                    "<div class='like-count'><span style='font-size: 10px; margin: 0 10px;'>Likes</span> " + toComma(d.data.likeCount) + "</div>" +
                    "<div class='view-count'><span style='font-size: 10px; margin: 0 10px;'>Views</span> " + toComma(d.data.viewCount) + "</div>" +
                    "<div class='like-ratio'><span style='font-size: 12px; margin: 0 10px;'>Ratio</span>" + Math.round(Number(d.data.likeCount) / Number(d.data.viewCount) * 100) + "%</div>")
                .style("left", (d3.event.pageX) + "px")
                .style("top", (d3.event.pageY - 28) + "px");
        })
        .on("mouseout", function (d) {
            div.transition()
                .duration(500)
                .style("opacity", 0);
        });

    g.append("g")
        .attr("class", "axis")
        .attr("transform", "translate(0," + height + ")")
        .call(d3.axisBottom(x))
        .call(g => g.selectAll(".tick line")
            .attr("stroke-opacity", 0))

    var borderLeft = g.append("g").append("rect")
        .attr("x", 0)
        .attr("y", 0)
        .attr("height", height)
        .attr("width", 1)


    var legend = g.append("g")
        .attr("font-family", "Montserrat")
        .attr("font-size", 10)
        .attr("text-anchor", "end")
        .attr("transform", "translate(" + (-(width / 1.6)) + "," + (height + margin.bottom / 2) + ")")
        .selectAll("g")
        .data(keys.slice())
        .enter().append("g")
        .attr("transform", function (d, i) {
            return "translate(" + i * 150 + ",0)";
        })
        .attr("font-size", 14)
        .attr("line-height", 17);

    legend.append("rect")
        .attr("x", width - 19)
        .attr("width", 19)
        .attr("height", 19)
        .attr("fill", z);

    legend.append("text")
        .attr("x", width + 90)
        .attr("y", 9.5)
        .attr("dy", "0.32em")
        .text(function (d) {
            return unCamel(d);
        });

    function toComma(number) {
        return number.toString()
                .replace(/\B(?=(\d{3})+(?!\d))/g, ",");
    }

    function unCamel(str){
        return str.replace(/([A-Z])/g, ' $1')
                .replace(/^./, function(str){ 
                    return str.toUpperCase(); 
                })
    }
}