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

<div id="download-btn-container">
  <a href="asst3_parts1_2.zip" class="btn blue" role="button">
    <i class="icon ion-code-download"></i>
    Download Our Code
    <div class="description">(Parts 1 and 2)</div>
  </a>
</div>

#### Part 3

We used and implemented one of Raibert's formulas (the one on page 692) from the [paper](http://repository.upenn.edu/cgi/viewcontent.cgi?article=1414&context=ese_papers) you posted on Q&A. We ultimately came up with the equation: `leg_angle_desired = asin(((xd * last_bounce_time / 2) + 0.024 * (xd - 2 * speed_desired)) / leg_length)` after playing around with gain and multiplying `speed_desired` by a constant. This worked for `height_desired` values from `0.6` to `0.74` and results in the desired speed and roughly the desired height.

<aside class="figure" id="graph_part_3">
    <h4 class="figure-title">Part 3 - `speed_desired`</h4>
</aside>

Contrary to the suggestions in the assignment handout, we had to change the equation obtained from Part 1 to remove the portion that supplied feedback control since the power is now directed at an angle and we would therefore not reach the correct height. We also attempted to account for this by adjusting the target distance in the equation to `height_desired / cos(leg_angle_desired)`, but this didn't seem to change the height reached too much.

To find values for `hip_grnd_k` and `hip_grnd_b` that worked, we just tested arbitrary values until the variation in `hip_angle` seemed small enough. We ended up with `hip_grnd_k = 7.5` and `hip_grnd_b = 4`.

<aside class="figure" id="graph_part_3_1">
    <h4 class="figure-title">Part 3 - `hip_angle`</h4>
</aside>

##### Unanswered Questions

1. Why does Raibert's formula in its original form not work correctly?
2. Why does our method have an odd oscillation before settling to the correct speed?

<div id="download-btn-container">
  <a href="asst3_part3.zip" class="btn blue" role="button">
    <i class="icon ion-code-download"></i>
    Download Our Code
    <div class="description">(Part 3)</div>
  </a>
</div>