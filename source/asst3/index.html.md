---
title: Humanoids Assignment 3
---

<header>
# Control <span>Humanoids Assignment 3</span>
</header>
### Jeff Chen (jchen4), Cary Yang (caryy), Jeffrey Kim (jmkim1)

#### Part 1

From class, we were given the equation `rest_leg_length = leg_length_default + (a * (height_desired - h(b)) + b) + c * (height_desired - last_max_height)`, where `a`, `b`, and `c` are constants, and `h(x)` is the maximum height obtained from a leg length of `leg_length_default + x`.

Arbitrarily, we chose `b` to be `0.015`, and obtained `h(b) = 0.7`. To find `a`, we interpolated the maximum height value across a number of leg lengths, and chose a slope of `0.03`.

<aside class="figure" id="graph_part_1">
	<h4 class="figure-title">Part 1 - `height_desired`</h4>
</aside>

Finally, `c` controls the strength of the feedback control. We simply assigned it arbitrary values until we found one that worked well, which was `0.1`. So our final equation is `rest_leg_length = leg_length_default + (0.03 * (height_desired - 0.7) + 0.015) + 0.1 * (height_desired - last_max_height)`.

#### Part 2

To find gains `hip_air_k` and `hip_air_b` that would fit the requirements, we simply tested arbitrary values. We settled on `hip_air_k = 50` and `hip_air_b = 4`, which cause the leg to swing to the desired target without oscillation in about 0.28 seconds.

<aside class="figure" id="graph_part_2">
	<h4 class="figure-title">Part 2</h4>
</aside>

#### Part 3

We used and implemented one of Raibert's formulas (the one on page 692) from the [paper](http://repository.upenn.edu/cgi/viewcontent.cgi?article=1414&context=ese_papers) you posted on Q&A. We ultimately came up with this equation: `leg_angle_desired = asin(((xd * last_bounce_time / 2) + 0.024 * (xd - 2 * speed_desired)) / leg_length)` after playing around with gain and multiplying xd by some constants. We also assigned arbitrary values for `hip_grnd_k` and `hip_grnd_b` (`30` and `5` respectively). This worked for `height_desired` values from `0.6` to `0.76` with the correct speed and roughly correct height.

<div id="download-btn-container">
  <a href="asst3_parts1_2.zip" class="btn blue" role="button">
    <i class="icon ion-code-download"></i>
    Download Our Code
  </a>
</div>
